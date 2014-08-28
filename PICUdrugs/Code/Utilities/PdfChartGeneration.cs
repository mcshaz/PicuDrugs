#region PDFsharp - A .NET library for processing PDF
//
// Authors:
// Stefan Lange (mailto:Stefan.Lange@pdfsharp.com)
//
// Copyright (c) 2005-2009 empira Software GmbH, Cologne (Germany)
//
// http://www.pdfsharp.com
// http://sourceforge.net/projects/pdfsharp
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.
#endregion

using MigraDoc.DocumentObjectModel;
using MigraDoc.DocumentObjectModel.Shapes;
using MigraDoc.DocumentObjectModel.Tables;
using MigraDoc.Rendering;
using PdfSharp.Pdf;
using PICUdrugs.DAL;
using PICUdrugs.Utils;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml;

namespace PICUdrugs.Code.Utilities
{
    public static class CreatePDFReport
    {
        static CreatePDFReport()
        { 
            BlockEls = new HashSet<string>(new string[] { "div", "p", "h1", "h2", "h3", "h4", "h5", "h6" });
            UsedHtmlTags = new HashSet<string>(new string[]{ "strong", "em", "span", "sup"});
            UsedHtmlTags.UnionWith(BlockEls);
            ThinWidth = new Unit(0.5);
            MediumWidth = ThinWidth * 2;
            HtmlUnits = new string[] { "px", "em", "pt" };
            HtmlWidths = new string[] { "thin", "medium", "thick" };
            StyleSeperator = new char[] { ';' };
        }
        public const string hostUrl = "http://www.paediatricdrugs.net/";
        public static PdfDocument CreatePdf(PatientDrugChartDetails patient, SelectedChart chartType, UserSelectedInfusion.SelectedInfusion drug=null, string url = hostUrl )
        {
            //return testHyperlinks();
            PdfDocumentRenderer renderer = new PdfDocumentRenderer(true, PdfSharp.Pdf.PdfFontEmbedding.Always);
            renderer.Document = CreateDocument(patient, chartType, drug, url);
            renderer.RenderDocument();
            return renderer.PdfDocument;
        }
        public static Document CreateDocument(PatientDrugChartDetails patient, SelectedChart chartType, UserSelectedInfusion.SelectedInfusion drug=null,string url = hostUrl )
        {
            // Create a new MigraDoc document
            var doc = new Document();
            doc.Info.Title = "Drug Chart";
            doc.Info.Subject = patient.Name;
            doc.Info.Author = "Starship PICU";
            doc.DefaultPageSetup.Orientation = (chartType == SelectedChart.singleInfusion)?Orientation.Landscape:Orientation.Portrait;

            DefineStyles(doc);
            var section = CreateHeadFoot(doc, patient, url);
            var InfusionData = new PatientSpecificDrugData(patient);
            Ward dpt = null;
            if (chartType == SelectedChart.bolusOnly || chartType == SelectedChart.bolusPlusInfusion)
            {
                var bolusList = InfusionData.EmergencyBoluses(patient.Age);
                if (bolusList.Any())
                {
                    dpt = InfusionData.GetWard();
                    CreateBolusTable(section, dpt.BolusChartHeader, bolusList, InfusionData.ETT(), dpt.PaddingInCm);
                }
            }
            if (chartType == SelectedChart.bolusPlusInfusion)
            {
                var stdInf = InfusionData.StandardInfusions();
                if (stdInf.Any())
                {
                    section = doc.AddSection();
                    CreateStandardInfusionTable(section, (dpt ?? InfusionData.GetWard()).InfusionChartHeader, stdInf);
                }
            } 
            else if (chartType == SelectedChart.singleInfusion)
            {
                CreateFixedDurationInfusionTable(section, InfusionData.FixedInfusion(drug));
            }

            return doc;
        }
        public static Exception TestHtml(string html)
        {
            var doc = new Document();
            DefineStyles(doc);
            SetupBolusClasses(doc);
            try
            {
                AddParaFromHtml(doc.AddSection(), html);
            }
            catch(Exception ex)
            {
                return ex;
            }
            return null;
        }
        private static void DefineStyles(Document doc)
        {
            doc.DefaultPageSetup.PageFormat = PageFormat.A4;
            doc.DefaultPageSetup.TopMargin = Unit.FromCentimeter(2.0);
            doc.DefaultPageSetup.RightMargin = Unit.FromCentimeter(1.4);
            doc.DefaultPageSetup.BottomMargin = Unit.FromCentimeter(2);
            doc.DefaultPageSetup.LeftMargin = Unit.FromCentimeter(1.4);
            // Get the predefined style Normal.
            Style style = doc.Styles[StyleNames.Normal]; 
            // Because all styles are derived from Normal, the next line changes the 
            // font of the whole document. Or, more exactly, it changes the font of
            // all styles and paragraphs that do not redefine the font.
            style.Font.Name = "Arial";
            style.Font.Size = 12;
            style.ParagraphFormat.Alignment = ParagraphAlignment.Left;
            style.ParagraphFormat.TabStops.Clear();
            
            //H1 used for each pages Title -
            style = doc.Styles[StyleNames.Heading1];
            style.ParagraphFormat.Alignment = ParagraphAlignment.Center;
            style.Font.Size = 22;
            style.Font.Name = "Constantia";

            style = doc.Styles[StyleNames.Heading2];
            style.ParagraphFormat.Alignment = ParagraphAlignment.Center;
            style.Font.Size = 20;
            style.Font.Name = "Constantia";

            style = doc.Styles[StyleNames.Heading3];
            style.ParagraphFormat.Alignment = ParagraphAlignment.Left;
            style.Font.Size = 16;
            style.Font.Name = "Constantia";

            //subheader rather than a header so that title does not appear in index
            /*
            style = doc.AddStyle("subHeader","Normal");
            style.Font.Size = 16;
            style.ParagraphFormat.Alignment = ParagraphAlignment.Center;
            */
        }
        private static Section CreateHeadFoot(Document doc, PatientDrugChartDetails patient, string Url)
        {
            Section section = doc.AddSection();
            section.PageSetup.TopMargin = Unit.FromCentimeter(4.7); 

            Style detailLabel = doc.AddStyle("PatientDetailLabel", "Normal");
            //detailLabel.Font.Name = "Comic Sans MF";
            detailLabel.ParagraphFormat.LineSpacing = 20;
            detailLabel.ParagraphFormat.LineSpacingRule = LineSpacingRule.AtLeast;

            Style smDetailLabel = doc.AddStyle("SmallDetail", "PatientDetailLabel");
            smDetailLabel.Font.Size = 10;

            Style detail = doc.AddStyle("PatientDetail", "Normal");
            detail.Font.Size = 14;
            detail.Font.Bold = true;

            Style minorDetail = doc.AddStyle("MinorDetail", "Normal");
            minorDetail.Font.Size = 9;
            minorDetail.Font.Bold = false;
            minorDetail.Font.Italic = true;

            Style sign = doc.AddStyle("Signatures", "Normal");
            sign.Font.Size = 8;
            sign.ParagraphFormat.SpaceAfter = Unit.FromCentimeter(0.3);
            sign.ParagraphFormat.AddTabStop(Unit.FromCentimeter(1.5), TabAlignment.Left);
            sign.ParagraphFormat.AddTabStop(Unit.FromCentimeter(4), TabAlignment.Left);

            Paragraph para = section.Headers.Primary.AddParagraph();
            Unit usableWidth = Unit.FromCentimeter((doc.DefaultPageSetup.Orientation == Orientation.Landscape ? doc.DefaultPageSetup.PageHeight.Centimeter : doc.DefaultPageSetup.PageWidth.Centimeter) - doc.DefaultPageSetup.LeftMargin.Centimeter - doc.DefaultPageSetup.RightMargin.Centimeter);
            para.Format.AddTabStop(usableWidth, TabAlignment.Right);
            para.Style = detailLabel.Name;
            para.AddText("Date: ");
            para.AddFormattedText(DateTime.Today.ToString("MMMMM dd, yyyy"), detail.Font);
            para.AddTab();
            para.AddText("Weight: ");
            string str = (patient.ActualWeight > 20) ? patient.ActualWeight.ToString("###") : patient.ActualWeight.ToString("#0.#");
            para.AddFormattedText(str, detail.Font);
            para.AddText(" kg ");
            if (patient.WeightEstimate) {para.AddText("(estimate only)");}
            else if (!string.IsNullOrEmpty(patient.Centile)) {para.AddFormattedText("(" + patient.Centile + ")", smDetailLabel.Font);}
            
            // Create the text frame for the address
            TextFrame ptSticker = section.Headers.Primary.AddTextFrame();
            ptSticker.Height = Unit.FromCentimeter(2.8);
            ptSticker.Width = Unit.FromCentimeter(10.5);
            ptSticker.Left = ShapePosition.Left;
            ptSticker.RelativeHorizontal = RelativeHorizontal.Margin;
            ptSticker.Top = ShapePosition.Top;
            ptSticker.RelativeVertical = RelativeVertical.Page;
            ptSticker.WrapFormat.DistanceTop = Unit.FromCentimeter(1.9);
            
            //ptSticker. = Unit.FromMillimeter(40);

            ptSticker.LineFormat.Color = Colors.Black;
            ptSticker.LineFormat.DashStyle = DashStyle.Solid;
            ptSticker.LineFormat.Width = 1 ;
            ptSticker.MarginTop = ptSticker.MarginRight = ptSticker.MarginBottom = ptSticker.MarginLeft = "3mm";
            TextFrame staffSign = ptSticker.Clone(); //clone before any text assigned
            staffSign.Left = ShapePosition.Right;
            staffSign.Width = Unit.FromCentimeter(7);

            para = ptSticker.AddParagraph();

            para.Format.AddTabStop(Unit.FromCentimeter(9.8), TabAlignment.Right);
            para.Style = detailLabel.Name;
            para.AddText("Name: ");
            para.AddFormattedText(patient.Name, detail.Name);
            if (patient.IsMale.HasValue) { para.AddFormattedText("\t" + (patient.IsMale.Value ? "Male" : "Female"), minorDetail.Name); }
            para.AddText("\nNHI: ");
            para.AddFormattedText(patient.NHI, detail.Name);
            if (patient.Age != null) 
            {
                para.AddText("\tAge: ");
                para.AddFormattedText(patient.Age.ToShortString(), detail.Name); 
            }
            para.AddText("\nDOB: ");
            str = (patient.Age != null && patient.Age.Dob.HasValue) ? patient.Age.Dob.Value.ToShortDateString() : "?";
            para.AddFormattedText(str, detail.Font);
            para.AddFormattedText("\tAttach patient sticker here", minorDetail.Name);

            section.Headers.Primary.Add(staffSign);

            para = staffSign.AddParagraph("Patient's weight is appropriate for age of child and entered correctly:");
            para.Style = sign.Name;

            string dots = new String('.', 28);
            para = staffSign.AddParagraph("Signature: ");
            para.AddTab();
            para.AddText(dots);
            para.AddTab();
            para.AddText(dots);
            para.Style = sign.Name;

            para = staffSign.AddParagraph("Name: ");
            para.AddTab();
            para.AddText(dots);
            para.AddTab();
            para.AddText(dots);
            para.Style = sign.Name;

            para = section.Footers.Primary.AddParagraph();
            para.Format.AddTabStop(usableWidth/2, TabAlignment.Center);
            para.Format.AddTabStop(usableWidth, TabAlignment.Right);
            para.Format.Font.Size = 9;
            para.AddText("Page ");
            para.AddPageField();
            para.AddText(" of ");
            para.AddNumPagesField();
            para.AddTab();
            var hl = para.AddHyperlink(Url, HyperlinkType.Url);
            //a.AddFormattedText(Url, TextFormat.Underline);
            hl.AddText(Url + '\t');
            para.AddText(DateTime.Today.ToString("d MMM yyyy"));

            return section;
        }
        static Table CreateBolusTable(Section section, double defaultPaddingCm)
        {
            // Create the item table
            var tbl = section.AddTable();
            tbl.Style = "Table";
            tbl.Borders.Color = Colors.Black;
            tbl.Borders.Width = ThinWidth;
            //table.Borders.Left.Width = 0.5;
            //table.Borders.Right.Width = 0.5;
            tbl.Rows.LeftIndent = 0;
            tbl.Rows.VerticalAlignment = VerticalAlignment.Center;
            
            tbl.BottomPadding = tbl.TopPadding = Unit.FromCentimeter(0.05);

            // Before you can add a row, you must define the columns
            Column column = tbl.AddColumn(Unit.FromCentimeter(7));
            column.Format.Alignment = ParagraphAlignment.Right;

            column = tbl.AddColumn(Unit.FromCentimeter(6.5));
            column.Format.Alignment = ParagraphAlignment.Center;
            Font font = column.Format.Font;
            font.Size = 16;
            font.Name = "Arial";

            column = tbl.AddColumn(Unit.FromCentimeter(4.6));
            column.Format.Alignment = ParagraphAlignment.Center;
            font = column.Format.Font;
            font.Name = "Arial Baltic";
            font.Size = 9;

            // Create the header of the table
            Row row = tbl.AddRow();
            row.HeadingFormat = true;
            row.Format.Alignment = ParagraphAlignment.Center;
            row.Format.Font.Bold = true;
            //row.Shading.Color = TableBlue;
            row.Cells[1].AddParagraph("Doses for this child");
            //row.Cells[1].Format.Alignment = ParagraphAlignment.Left;
            //row.Cells[1].MergeRight = 3;
            Paragraph para = row.Cells[2].AddParagraph();
            para.AddFormattedText("Notes", TextFormat.Underline);
            para.AddLineBreak();
            para.AddText("Dose Calculation");
            return tbl;
        }
        private static void SetupBolusClasses(Document doc)
        {
            Style currentStyle = doc.AddStyle("RowHeader", "Normal");
            currentStyle.ParagraphFormat.Alignment = ParagraphAlignment.Left;
            currentStyle.Font.Bold = true;
            currentStyle.Font.Size = 14;

            currentStyle = doc.AddStyle("concentration", "Normal");
            currentStyle.Font.Size = 11;

            currentStyle = doc.AddStyle("route", "Normal");
            currentStyle.Font.Italic = true;

            currentStyle = doc.AddStyle("note", "Normal");
            currentStyle.Font.Size = 10;
        }
        //const int NewLineCharLimit = 32;
        //currently 1cm per row via 0.05 cm top and bottom padding all cells, + 0.1cm top & bottom in rows which do not have route specified
        private static void CreateBolusTable(Section section, string header,IEnumerable<BolusDrugListItem> bolusList, Ett ett = null, double defaultPaddingCm=0)
        {
            // Each MigraDoc document needs at least one section.
            AddParaFromHtml(section, header);
            
            //define header style
            SetupBolusClasses(section.Document);

            Unit extraPad = Unit.FromCentimeter(defaultPaddingCm);

            Table tbl = CreateBolusTable(section, defaultPaddingCm);

            Row row = null;

            Func<bool,Paragraph> CreateNewHeaderPara = new Func<bool,Paragraph>(isNewPageRequest =>
            {
                if (isNewPageRequest)
                {
                    section.AddPageBreak();
                    AddParaFromHtml(section, header);
                    tbl = CreateBolusTable(section, defaultPaddingCm);                   
                }
                row = tbl.AddRow();
                row.Cells[0].MergeRight = 2;
                var para = row.Cells[0].AddParagraph();
                para.Format.Alignment = ParagraphAlignment.Left;
                return para;
            });
            Func<bool, Paragraph> CreateNewStdPara = new Func<bool, Paragraph>(isNewPageRequest =>
            {
                row = tbl.AddRow();
                return row.Cells[0].AddParagraph();
            });

            foreach (BolusDrugListItem bolus in bolusList)
            {
                
                switch (bolus.ItemType)
                {
                    case BolusListItemType.Header:
                        if (ett != null && bolus.RowTitle == PICUdrugs.BLL.BolusSortingBL.ETTsize)
                        {
                            row = tbl.AddRow();
                            var para = row.Cells[0].AddParagraph("ETT");
                            para.Format.SpaceBefore = para.Format.SpaceAfter = extraPad;
                            var fmt = para.AddFormattedText("(internal diameter)", TextFormat.Italic);
                            fmt.Size = 9;
                            para = row.Cells[1].AddParagraph();
                            if (ett.InternalDiameter.HasValue) { para.AddText(ett.InternalDiameter.Value.ToString("0.0")); }
                            fmt = para.AddFormattedText(String.Format(" ({0}) mm", ett.InternalDiameterRange.ToString(1, NumericRange.Rounding.FixedDecimalPlaces)));
                            if (!String.IsNullOrEmpty(ett.Note)) { fmt.AddText("\n" + ett.Note); }
                            fmt.Size = 10;
                            row.Cells[2].AddParagraph(String.Format("{0} cm @ lips\n{1} cm @ nose", ett.LengthAtLip, ett.LengthAtNose));
                        }
                        else
                        {
                            AddParaFromHtml(section, bolus.RowTitle, CreateNewHeaderPara);
                        }
                        break;
                    //para.Style = rowHeader.Name;
                    case BolusListItemType.DosePerKg:
                        AddParaFromHtml(section, bolus.RowTitle, CreateNewStdPara);
                        //ampule concentration: fmt.Font.Size = 11; //1 point less 
                        Paragraph adminPara = (bolus.BolusVolume==null)
                            ? row.Cells[1].AddParagraph(bolus.BolusDose.ToString(3) + ' ' + bolus.DoseUnits)
                            :row.Cells[1].AddParagraph(bolus.BolusVolume.AsDrawingUpVolume() + ' ' + bolus.AdministrationUnits);
                        adminPara.Format.SpaceBefore = adminPara.Format.SpaceAfter = extraPad;
                        Paragraph notePara;

                        if (bolus.DoseUnits == BolusDrugListItem.DefaultAdministrationUnits || bolus.DoseUnits == BolusDrugListItem.EnergyUnits || bolus.Conc_ml == null)
                        {
                            notePara = row.Cells[2].AddParagraph(String.Format("{0} {1}/kg\nmax {2} {3}", bolus.DosePerKg, bolus.DoseUnits, bolus.AdultMax, bolus.MaxDoseUnits));
                        }
                        else
                        {
                            string dosePerKg = string.Format("{0} {1}/kg",bolus.DosePerKg, bolus.DoseUnits);
                            string doseTotal = string.Format("{0} {1}",bolus.BolusDose.AsDrawingUpVolume(), bolus.DoseUnits);
                            if (dosePerKg.Length + doseTotal.Length <= 24)
                            {
                                notePara =  row.Cells[2].AddParagraph(dosePerKg + " = ");
                            }
                            else
                            {
                                notePara = row.Cells[2].AddParagraph(dosePerKg + "\n= ");
                            }
                            notePara.AddFormattedText(doseTotal, TextFormat.Bold);
                            notePara.AddText(string.Format("\nmax {0} {1}", bolus.AdultMax, bolus.MaxDoseUnits));
                        }
                        break;
                    case BolusListItemType.FixedDose:
                        AddParaFromHtml(section, bolus.RowTitle, CreateNewStdPara);
                        Paragraph dosePara = row.Cells[1].AddParagraph(bolus.DoseUnits);
                        dosePara.Format.SpaceBefore = dosePara.Format.SpaceAfter = extraPad;
                        notePara = row.Cells[2].AddParagraph();
                        notePara.AddFormattedText("Not per Kg", TextFormat.Italic);
                        break;
                }
            }

            //now add ETT info if present
            //tbl.SetEdge(0, 0, 6, 2, Edge.Box, BorderStyle.Single, 0.75, Color.Empty);
        }
        private static void CreateStandardInfusionTable(Section section, string header, IEnumerable<StandardInfusion> standardInfusions)
        {
            AddParaFromHtml(section, header);
            Document doc = section.Document;

            var tbl = section.AddTable();
            tbl.Style = "Table";
            tbl.Rows.LeftIndent = 0;
            tbl.Rows.VerticalAlignment = VerticalAlignment.Center;
            tbl.Rows.Alignment = RowAlignment.Left;
            tbl.AddColumn(Unit.FromCentimeter(18.2));
            Style drugDetail = doc.Styles.AddStyle("drugDetail", "Normal");
            drugDetail.ParagraphFormat.AddTabStop(Unit.FromCentimeter(17), TabAlignment.Right);
            drugDetail.ParagraphFormat.LeftIndent = 0;
            byte b = 0;
            Border blackSolid = new Border()
            {
                Style = BorderStyle.Single,
                Color = new Color(b,b,b),
                Visible = true,
                Width = MediumWidth
            };
            Style concDetail = doc.Styles.AddStyle("concDetail", "Normal");
            concDetail.ParagraphFormat.AddTabStop(Unit.FromCentimeter(17.9), TabAlignment.Right);
            concDetail.ParagraphFormat.LeftIndent = Unit.FromCentimeter(0.7);
            b=130;
            concDetail.ParagraphFormat.Borders.Top = new Border()
            {
                Style = BorderStyle.Single,
                Color = new Color(b,b,b),
                Visible = true,
                Width = MediumWidth
            };
            string currentDrug = String.Empty;
            bool alternateBknd = false;
            b = 220;
            Color lightGrey = new Color(b,b,b);

            foreach(StandardInfusion infusn in standardInfusions)
            {
                var row = tbl.AddRow();
                Paragraph para;
                if (infusn.DrugName != currentDrug)
                {
                    alternateBknd = !alternateBknd;
                    currentDrug = infusn.DrugName;
                    //drug overview row
                    //row.Cells[0].MergeRight = 2;
                    para = row.Cells[0].AddParagraph();
                    //para.Style = overview.Name;
                    para.Style = drugDetail.Name;
                    if (infusn.Href == null) { para.AddFormattedText(infusn.DrugName, TextFormat.Bold); }
                    else 
                    {
                        var hl = para.AddHyperlink(infusn.Href, HyperlinkType.Web);
                        hl.AddFormattedText(infusn.DrugName, TextFormat.Bold);
                    }
                    para.AddTab();
                    if (!String.IsNullOrEmpty(infusn.Note))
                    {
                        para.AddFormattedText(infusn.Note + " ", TextFormat.Italic);
                    }
                    //note no space before @ - this seems to create newline
                    para.AddText(String.Format("@ {0} {1}", infusn.DoseRate, infusn.RateUnits));
                    if (alternateBknd) { row.Shading.Color = lightGrey; }
                    row.Borders.Top = blackSolid.Clone();
                    row = tbl.AddRow();
                }
                    //Infusion info row
                para = row.Cells[0].AddParagraph(infusn.SubHeader);
                para.Style = concDetail.Name;
                para.AddTab();
                FormattedText fmt = para.AddFormattedText(infusn.DrawingUpDose.ToPrecisionAndHalf(2).ToClarityString());
                fmt.Font.Size = 14;
                para.AddText(" " + infusn.DrawingUpUnits);
                fmt = para.AddFormattedText(" " + infusn.DilutionString + " ");
                fmt.Font.Size = 10;
                para.AddText(String.Format("{0} mL ", infusn.DilutionVolume));
                fmt = para.AddFormattedText(String.Format("(1 mL/hr = {0} {1}) @ ",infusn.FinalConcentration.ToPrecision(2), infusn.FinalConcentrationUnits));
                fmt.Font.Size = 10;
                para.AddText(String.Format("{0} mL/h", infusn.FlowRate));
                if (alternateBknd) { row.Shading.Color = lightGrey; }
            }
        }
        private const double Lindent = 1.7;
        private static void CreateFixedDurationInfusionTable(Section section, SingleDrugModel singleDrug)
        {
            byte b = 215;
            Color lightGrey = new Color(b, b, b);
            b = 255;
            Color white = new Color(b, b, b);
            Unit paraSpace = Unit.FromCentimeter(0.1);

            Style genericDetails = section.Document.AddStyle("genericDetails","Normal");

            ParagraphFormat rowFmt =genericDetails.ParagraphFormat;
            rowFmt.SpaceBefore = rowFmt.SpaceAfter = paraSpace;
            rowFmt.AddTabStop(Unit.FromCentimeter(1.4), TabAlignment.Left);
            rowFmt.AddTabStop(Unit.FromCentimeter(5.5), TabAlignment.Left); //3.5

            section.AddParagraph(singleDrug.DrugName, "Heading2");
            Paragraph para = section.AddParagraph("Source:\t", "genericDetails");
            Unit indent = Unit.FromCentimeter(Lindent);
            para.Format.AddTabStop(indent);
            if (singleDrug.Reference == null)
            {
                para.AddText("No drug reference supplied");
            }
            else if (singleDrug.Reference.HyperLink == null)
            {
                para.AddText(singleDrug.Reference.Name);
            }
            else
            {
                para.AddText(singleDrug.Reference.Name);
                para = section.AddParagraph();
                para.Format.LeftIndent = indent;
                Hyperlink hl = para.AddHyperlink(singleDrug.Reference.HyperLink, HyperlinkType.Web);
                hl.AddText(singleDrug.Reference.HyperLink);
            }

            bool firstRow = true;

            foreach (var d in singleDrug.InfusionData)
            {
                string rateDescribe = String.Format("\t{0} {1}\t({2} {3} for {4})", d.DoseTotal.ToPrecision(3),d.DoseTotalUnits, d.DoseRate.ToPrecision(3), d.FinalConcentrationUnits, d.DurationStr);
                if (firstRow) 
                {
                    rateDescribe = "Dose:" + rateDescribe;
                    firstRow = false;
                }
                section.AddParagraph(rateDescribe, "genericDetails");
            }

            section.AddParagraph("Line: " + singleDrug.Route, "genericDetails");

            if (!string.IsNullOrEmpty(singleDrug.Note))
            {
                section.AddParagraph("Note: " + singleDrug.Note, "genericDetails");
            }

            section.AddParagraph("\n", "genericDetails");

            Table tbl = section.AddTable();
            tbl.Style = "Table";
            tbl.Rows.LeftIndent = 0;
            tbl.Rows.VerticalAlignment = VerticalAlignment.Top;
            tbl.Rows.Alignment = RowAlignment.Left;
            tbl.Format.Alignment = ParagraphAlignment.Center;
            tbl.Format.SpaceBefore = tbl.Format.SpaceAfter = paraSpace;
            tbl.AddColumn(Unit.FromCentimeter(3.6));
            Column col = tbl.AddColumn(Unit.FromCentimeter(4));
            col.Format.AddTabStop(Unit.FromCentimeter(1.5), TabAlignment.Right);
            tbl.AddColumn(Unit.FromCentimeter(3.4));
            tbl.AddColumn(Unit.FromCentimeter(4.8));
            tbl.AddColumn(Unit.FromCentimeter(4.1));
            tbl.AddColumn(Unit.FromCentimeter(4.1));
            tbl.AddColumn(Unit.FromCentimeter(2.8));

            Row row = tbl.AddRow();
            row.HeadingFormat = true;
            row.Cells[0].AddParagraph("Duration");

            Cell cell = row.Cells[1];
            para = cell.AddParagraph("Start Date + Time\n");
            para.Format.Alignment = ParagraphAlignment.Center;
            FormattedText fmt= para.AddFormattedText("(fill in at commencement)");
            fmt.Size = 9;

            row.Cells[2].AddParagraph("Dose");

            row.Cells[3].AddParagraph(String.Format("Ampule Volume\n({0})", singleDrug.AmpuleConcentration));
            row.Cells[4].AddParagraph(String.Format("Diluted with\n({0})", singleDrug.DilutionFluid));
            row.Cells[5].AddParagraph("Final Volume");
            row.Cells[6].AddParagraph("Rate");

            firstRow = true;
            bool alternateBknd = false;
            foreach (var d in singleDrug.InfusionData)
            {
                row = tbl.AddRow();
                alternateBknd = !alternateBknd;
                if (alternateBknd) { row.Shading.Color = lightGrey; }
                if (firstRow)
                {
                    row[0].AddParagraph(String.Format("First {0}", d.DurationStr));
                    para = row[1].AddParagraph("\tstart time");
                    firstRow = false;
                }
                else
                {
                    row[0].AddParagraph(String.Format("Next {0}", d.DurationStr));
                    para = row[1].AddParagraph("\tstart time+" + d.StartTimeStr(false));
                }
                para.Format.Font.Color = (alternateBknd) ? white : lightGrey;

                row[2].AddParagraph(d.DrawingUpDose.ToPrecisionAndHalf(2).ToClarityString() + " " + d.DrawingUpUnits);
                row[3].AddParagraph(d.ampuleVolume.Value.AsDrawingUpVolume() + " mL");
                row[4].AddParagraph(d.diluentVolume.Value.AsDrawingUpVolume() + " mL");
                row[5].AddParagraph(d.DilutionVolume.ToString() + " mL");
                row[6].AddParagraph(d.FlowRate.ToString("#.#") + " mL/hr");
            }
            row = tbl.AddRow();
            alternateBknd = !alternateBknd;
            if (alternateBknd) 
            { 
                row.Cells[0].Shading.Color = lightGrey;
                row.Cells[1].Shading.Color = lightGrey; 
            }
            para = row.Cells[0].AddParagraph();
            para.AddFormattedText("Finish at", TextFormat.Bold);
            para = row.Cells[1].AddParagraph("\tstart time+" + singleDrug.InfusionData.Last().StopTimeStr(false));
            para.Format.Font.Color = (alternateBknd) ? white : lightGrey;
        }
        static HashSet<string> BlockEls;
        static HashSet<string> UsedHtmlTags ;
        static void AddParaFromHtml(Section section, string html)
        {
            AddParaFromHtml(section, html, isNewPageRequest=>{
                if (isNewPageRequest) { section.AddPageBreak(); }
                return section.AddParagraph();
            });
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="section"></param>
        /// <param name="html"></param>
        /// <param name="createNewParagraph">a function which returns a new paragraph to create text within. the bool param is whether the request is for a newpage</param>
        static void AddParaFromHtml(Section section, string html, Func<bool, Paragraph> createNewParagraph)
        {
            Paragraph para = null;
            XmlReader reader = XmlReader.Create(new StringReader("<body>"+html+"</body>"));
            Stack<Font> fontStack = new Stack<Font>();
            fontStack.Push(section.Document.Styles[StyleNames.Normal].Font);
            Font currentFont = null;
            //To use this, would need to figure how to merge style and format
            //Stack<ParagraphFormat> paragraphStack = new Stack<ParagraphFormat>();
            //ParagraphFormat currentParaFormat = null;
            reader.Read();
            
            bool isFirstParagraphOfNewPage = false;
            while (!reader.EOF) //load loop
            {
                switch (reader.NodeType)
                {
                    case XmlNodeType.Whitespace:
                        if (currentFont != null && para !=null)
                        {
                            para.AddFormattedText(" ", currentFont);
                        }
                        reader.Read();
                        continue;
                    case XmlNodeType.EndElement:
                        if (UsedHtmlTags.Contains(reader.Name))
                        {
                            fontStack.Pop();
                            currentFont = fontStack.Peek();
                            /*
                            if (BlockEls.Contains(reader.Name))
                            {
                                paragraphStack.Pop();
                            }
                            */
                        }
                        reader.Read();
                        continue;
                    case XmlNodeType.Comment:
                        if (reader.Value.Trim()=="pagebreak")
                        {
                            para = createNewParagraph(true);
                            isFirstParagraphOfNewPage = true;
                            currentFont = null;
                        }
                        reader.Read();
                        continue;
                    case XmlNodeType.Element:
                        if (reader.IsEmptyElement)
                        {
                            switch (reader.Name)
                            {
                               case "br":
                                    para.AddLineBreak();
                                    break;
                               //case PageBreak
                            }
                            reader.Read();
                            continue;
                        }
                        switch (reader.Name)
                        {
                            case "body":
                                reader.Read();
                                continue;
                            case "strong":
                                currentFont = fontStack.Peek().Clone();
                                currentFont.Bold = true;
                                fontStack.Push(currentFont);
                                break;
                            case "em":
                                currentFont = fontStack.Peek().Clone();
                                currentFont.Italic = true;
                                fontStack.Push(currentFont);
                                break;
                            case "sup":
                                currentFont = fontStack.Peek().Clone();
                                currentFont.Superscript = true;
                                fontStack.Push(currentFont);
                                break;
                            case "h1":
                            case "h2":
                            case "h3":
                            case "h4":
                            case "h5":
                            case "h6":
                                if (!isFirstParagraphOfNewPage)
                                {
                                    para = createNewParagraph(false);
                                    currentFont = para.Format.Font;
                                }
                                string attr = reader.GetAttribute("class");
                                para.Style = string.IsNullOrEmpty(attr)?"Heading" + reader.Name[1]:attr;
                                goto case "_attr";
                            case "p":
                            case "div":
                                if (!isFirstParagraphOfNewPage)
                                {
                                    para = createNewParagraph(false);
                                }
                                currentFont = para.Format.Font;
                                attr = reader.GetAttribute("class");
                                if (!string.IsNullOrEmpty(attr))
                                {
                                    para.Style = attr;
                                }
                                goto case "_attr";
                            case "span":
                                attr = reader.GetAttribute("class");
                                currentFont = string.IsNullOrEmpty(attr)?fontStack.Peek():section.Document.Styles[attr].Font;
                                goto case "_attr";
                            case "_attr":
                                attr = reader.GetAttribute("style");
                                if (attr!=null)
                                {
                                    var styleProps = attr.Split(StyleSeperator, StringSplitOptions.RemoveEmptyEntries).Map(s=>new CssStyleProperty(s));
                                    currentFont = currentFont.Clone();
                                    UpdateFontFromStyle(styleProps, currentFont);
                                    if (BlockEls.Contains(reader.Name))
                                    {
                                        UpdateFormatFromStyle(styleProps, para.Format);
                                    }
                                }
                                fontStack.Push(currentFont);
                                break;
                        }
                        break;
                        /*
                    case XmlNodeType.Text:
                        currentFont = fontStack.Peek();
                        break;
                         * */
                }
                string contents = reader.ReadString();
                if (contents != "")
                {
                    if (para == null) //1st run through - if html does not begin with block element
                    {
                        para = createNewParagraph(false);
                        currentFont = para.Format.Font;
                    }
                    else
                    {
                        isFirstParagraphOfNewPage = false;
                    }
                    para.AddFormattedText(contents, currentFont);
                }
            }
        }
        static void UpdateFormatFromStyle(CssStyleProperty[] styleProperties, ParagraphFormat format)
        {
            foreach (var prop in styleProperties)
            {
                switch (prop.Name)
                {
                    case "border":
                        string[] borderAttr = prop.Value.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                        int widthIndx = borderAttr.FindIndex(a => HtmlUnits.Any(u => a.EndsWith(u)));
                        if (widthIndx == -1)
                        {
                            int multiplierIndex = HtmlWidths.FindIndex(w => borderAttr.Contains(w));
                            format.Borders.Width = ThinWidth * (multiplierIndex + 1);
                            widthIndx = Array.IndexOf(borderAttr, HtmlWidths[multiplierIndex]); // reset to the 
                        }
                        else
                        {
                            format.Borders.Width = ParseHtmlUnit(borderAttr[widthIndx]);
                        }
                        int colourIndx = borderAttr.FindIndex(a => a[0] == '#');
                        int styleIndx = (new int[] { 1, 2, 3 }).First(indx => indx != widthIndx && indx != colourIndx);
                        format.Borders.Color = ParseColorString(borderAttr[colourIndx]);
                        format.Borders.Visible = !(borderAttr[styleIndx] == "none" || borderAttr[styleIndx] == "hidden");
                        break;
                    case "margin-top":
                        format.SpaceBefore = ParseHtmlUnit(prop.Value);
                        break;
                    case "margin-bottom":
                        format.SpaceAfter = ParseHtmlUnit(prop.Value);
                        break;
                    case "padding-left":
                        format.LeftIndent = ParseHtmlUnit(prop.Value);
                        break;
                    case "line-height":
                        //intentionally ignoring complex differences in inheritance between css values in % or unitless
                        int lastChar = prop.Value.Length - 1;
                        format.LineSpacingRule = LineSpacingRule.Multiple;
                        format.LineSpacing = (prop.Value[lastChar] == '%') ? (double.Parse(prop.Value.Substring(0, lastChar)) / 100) : double.Parse(prop.Value);
                        break;
                    case "text-indent":
                        format.FirstLineIndent = ParseHtmlUnit(prop.Value);
                        break;
                    case "text-align":
                        switch (prop.Value)
                        {
                            case "left":
                                format.Alignment = ParagraphAlignment.Left;
                                break;
                            case "right":
                                format.Alignment = ParagraphAlignment.Right;
                                break;
                            case "center":
                                format.Alignment = ParagraphAlignment.Center;
                                break;
                            case "justify":
                                format.Alignment = ParagraphAlignment.Justify;
                                break;
                        }
                        break;
                }
            }
        }
        static void UpdateFontFromStyle(CssStyleProperty[] styleProperties, Font font)
        {
            foreach (var prop in styleProperties)
            {
                switch (prop.Name)
                {
                    case "color":
                        //if (val[0] == '#') { val = "0xFF" + val.Substring(1); }
                        font.Color = ParseColorString(prop.Value);
                        break;
                    case "font-size":
                        font.Size = ParseHtmlUnit(prop.Value); //lots of stuff missed here - small, 150% etc
                        break;
                    case "font-family":
                        font.Name = prop.Value;
                        break;
                    case "text-decoration":
                        if (prop.Value == "underline")
                        {
                            font.Underline = Underline.Single;
                        }
                        break;
                }
            }
        }
        /// <summary>
        /// Dumb but fast #000000 to color
        /// </summary>
        /// <returns></returns>
        static Color ParseColorString (string colorString)
        {
            return new Color(uint.Parse("FF" + colorString.Substring(1), System.Globalization.NumberStyles.AllowHexSpecifier));
        }
        static readonly Unit ThinWidth;
        static readonly Unit MediumWidth;
        static readonly string[] HtmlUnits;
        static readonly string[] HtmlWidths;
        static readonly char[] StyleSeperator;
        static Unit ParseHtmlUnit(string measure)
        {
            if (measure.Length <= 2)
            {
                return new Unit(0);
            }
            int splitPoint = measure.Length - 2;
            string unit=measure.Substring(splitPoint);
            double val = double.Parse(measure.Substring(0,splitPoint));
            switch (unit)
            {
                case "px":
                    val *= 0.75;
                    goto case "pt";
                case "em": //note incorrect parsing - of course relative to browser view size & parent
                    val *= 12;
                    goto case "pt";
                case "pt":
                    return new Unit(val);
                default:
                throw new NotImplementedException("px em(explicit) ex");
            }
        }
        #region testing tools
        /// <summary>
        /// Creates a RTF file from the current document.
        /// </summary>
        public static PdfDocument testHyperlinks()
        {
            PdfDocumentRenderer renderer = new PdfDocumentRenderer(true, PdfSharp.Pdf.PdfFontEmbedding.Always);
            var doc = renderer.Document = new Document() ;

            var section = doc.AddSection();
            var para = section.AddParagraph();
            string[] testPaths = new string[] { @"file://///ahsl6/Main/Groups/INTRANET/Pharmacy/eNoids6/eNOIDs6Mongraphs/ACETYLCYSTEINE.pdf",
                                                @"file://ahsl6/Main/Groups/INTRANET/Pharmacy/eNoids6/eNOIDs6Mongraphs/ACETYLCYSTEINE.pdf",
                                                @"file://\\ahsl6\Main\Groups\INTRANET\Pharmacy\eNoids6\eNOIDs6Mongraphs\ACETYLCYSTEINE.pdf",
                                                @"\\ahsl6\Main\Groups\INTRANET\Pharmacy\eNoids6\eNOIDs6Mongraphs\ACETYLCYSTEINE.pdf",
                                                @"\ahsl6\Main\Groups\INTRANET\Pharmacy\eNoids6\eNOIDs6Mongraphs\ACETYLCYSTEINE.pdf"};
            foreach (var path in testPaths)
            {
                var hl = para.AddHyperlink(path, HyperlinkType.Web);
                hl.AddText(path + "_web");
                para.AddLineBreak();
                hl = para.AddHyperlink(path, HyperlinkType.File);
                hl.AddText(path + "_file");
                para.AddLineBreak();
            }
            var rtf = new MigraDoc.RtfRendering.RtfDocumentRenderer();
            rtf.Render(doc, "test.rtf", null);
            renderer.RenderDocument();
            System.Diagnostics.Process.Start("test.rtf");
            return renderer.PdfDocument;
        }
        public static void CreateRtf(PatientDrugChartDetails patient, SelectedChart chartType, UserSelectedInfusion.SelectedInfusion drug = null, string url = hostUrl)
        {
            var rtf = new MigraDoc.RtfRendering.RtfDocumentRenderer();
            rtf.Render(CreateDocument(patient, chartType, drug, url), "test.rtf", null);
            System.Diagnostics.Process.Start("test.rtf");
        }
        #endregion
    }
}