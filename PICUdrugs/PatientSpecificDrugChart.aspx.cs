using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PICUdrugs.DAL;
using System.IO;
using PICUdrugs.Code.Utilities;
using PdfSharp.Pdf;

namespace PICUdrugs.Pages
{
    public partial class PatientSpecificDrugChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.PreviousPage == null || !Page.PreviousPage.IsValid)
            {
                Response.Redirect("~/EnterPtData.aspx");
            }
            else if (!Page.IsPostBack)
            {
                PdfDocument doc = CreatePDFReport.CreatePdf(PreviousPage.PatientDetails(), PreviousPage.ChartSelected, PreviousPage.InfusionSelected, Request.UrlReferrer.AbsoluteUri);
                //if wanting an editable copy during development, uncomment below:
                //CreatePDFReport.CreateRtf(PreviousPage.PatientDetails(), PreviousPage.ChartSelected, PreviousPage.InfusionSelected, Request.UrlReferrer.AbsoluteUri);
                // Send PDF to browser
                MemoryStream stream = new MemoryStream();
                doc.Save(stream, false);
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", stream.Length.ToString());
                Response.BinaryWrite(stream.ToArray());
                Response.Flush();
                stream.Close();
                Response.End();
            }
        }
    } 
}