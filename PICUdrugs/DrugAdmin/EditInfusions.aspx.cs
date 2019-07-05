using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.DynamicData;
using PICUdrugs.DAL;
using PICUdrugs.BLL;
using PICUdrugs.Utils;
using DBToJSON.SqlEntities.Infusions;
using DBToJSON.SqlEntities.Enums;
using DBToJSON;
using DBToJSON.SqlEntities;

namespace PICUdrugs.drugAdmin
{
    public partial class editInfusions : Page
    {
        private readonly string[] FixedConcProperties = { "Volume", "Rate", "StopMinutes" };
        private readonly string[] ConcDynamicControls = { "ConcentrationDynamicControl", "volumeDynamicControl", "rateDynamicControl", "stopTimeDynamicControl" };
        protected InfusionDrug CurrentDrug;
        protected bool IsfixedTimeInfusion;
        //private IEnumerable<double> uniqueConcentrations;
        private IEnumerable<DoseCat> DoseCategories;

        protected void Page_Init(object sender, EventArgs e)
        {
            var query = Request.QueryString;
            string requestId = query.Get("drugId");
            if (requestId == null)
            {
                Response.Redirect("editInfusionDrugNames.aspx");
                return;
            }

            DrugAmpListView.EnableDynamicData(typeof(DrugAmpuleConcentration));
            //work out what kind of page to build
            IsfixedTimeInfusion = query.Get("InfusionDuration") == "fixed";

            //fill constants for use throughout page cycle
            SetPageGlobals(Convert.ToInt32(requestId));

            if (IsfixedTimeInfusion)
            {
                DilutionsObjDataSource.DataObjectTypeName = "PICUdrugs.DAL.FixedTimeDilution";
                DilutionsObjDataSource.SelectMethod = "GetFixedTimeDilutions";
                infDilutnLV.EnableDynamicData(typeof(FixedTimeDilution));
                Master.CreateScript("~/Scripts/editFixedTimeInfusions.js");
            }
            else
            {
                DilutionsObjDataSource.DataObjectTypeName = "PICUdrugs.DAL.VariableTimeDilution";
                DilutionsObjDataSource.SelectMethod = "GetVariableTimeDilutions";
                infDilutnLV.EnableDynamicData(typeof(VariableTimeDilution));
            }
        }
        protected void SetPageGlobals(int drugId)
        {
            using (DrugSqlContext myEntities = new DrugSqlContext())
            {
                CurrentDrug = (from d in myEntities.InfusionDrugs.Include("DrugReferenceSource")
                               where d.InfusionDrugId == drugId
                               select d).First();

                DoseCategories = (from c in myEntities.DoseCats
                                  select c).ToList();
            }

            //create ECMAscript objects
            Type csType = GetType();
            if (!Page.ClientScript.IsStartupScriptRegistered(csType, "editInfusionObjArray"))
            {
                string returnVar = string.Format("var dilMethod = [{0}], currentDrug={{prefix:{1}}};",
                    string.Join(",", DilutionLogic._allLogic.Values.Select(d => string.Format("{{ isPerKg:{0}, isVaryVolume:{1}, isVaryConcentration:{2}}}",
                        d.IsPerKg.ToString().ToLower(), 
                        d.IsVaryVolume.ToString().ToLower(), 
                        d.IsVaryConcentration.ToString().ToLower()))),
                    CurrentDrug.SiPrefix);
                Page.ClientScript.RegisterStartupScript(csType, "editInfusionObjArray", returnVar, true);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DrugName.Text = CurrentDrug.Fullname;
            DrugReferenceSource.Text = CurrentDrug.DrugReferenceSource.ReferenceDescription;

            System.Web.UI.HtmlControls.HtmlTableCell ampConc = DrugAmpListView.FindControl("drugAmpuleConcentration") as System.Web.UI.HtmlControls.HtmlTableCell;
            ampConc.InnerHtml = CurrentDrug.DrugUnits() + "/mL";
            Master.AddJQuery();

        }
        protected void General_CRUD(object sender, ObjectDataSourceStatusEventArgs e)
        {
            Exception outerExcept = e.Exception;
            if (outerExcept != null)
            {
                var overlappingAgeWtValidator = new CustomValidator();
                overlappingAgeWtValidator.IsValid = false;
                if (outerExcept is BLexception)
                {
                    overlappingAgeWtValidator.ErrorMessage = "Cannot update as the following rule would be broken: " + outerExcept.InnerException.Message;
                }
                else
                {
                    overlappingAgeWtValidator.ErrorMessage = "Database rules prevented changes: " + Formulas.GetExceptionMessages(outerExcept);
                }
                Page.Validators.Add(overlappingAgeWtValidator);
                e.ExceptionHandled = true;
            }
        }
        protected void InfDilutnLV_itemCreated(object sender, ListViewItemEventArgs e)
        {
            {
                PlaceHolder varTimeHolder = (PlaceHolder)e.Item.FindControl(IsfixedTimeInfusion ? "variableTimeSpecific" : "fixedTimeSpecific");
                varTimeHolder.Visible = false;
                varTimeHolder.Controls.Clear();
            }
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                {
                    IInfusionDilution infDil = (IInfusionDilution)dataItem.DataItem;
                    Label dilMethod = (Label)e.Item.FindControl("DilutionMethodIdLabel");
                    if (dilMethod != null)
                    {
                        dilMethod.Text = DilutionLogic.AsDescription(infDil.DilutionMethodId);
                    }
                }
                ObjectDataSource infConcObjDataSrc = e.Item.FindControl("objConcentrations") as ObjectDataSource;
                if (infConcObjDataSrc != null)
                {
                    Parameter parameter = infConcObjDataSrc.SelectParameters[0];
                    IInfusionDilution infDil;
                    if (IsfixedTimeInfusion)
                    {
                        infConcObjDataSrc.DataObjectTypeName = "PICUdrugs.DAL.FixedTimeConcentration";
                        infConcObjDataSrc.SelectMethod = "GetFixedTimeConcentrations";
                        infDil = (IInfusionDilution)dataItem.DataItem;

                    }
                    else
                    {
                        infConcObjDataSrc.DataObjectTypeName = "PICUdrugs.DAL.VariableTimeConcentration";
                        infConcObjDataSrc.SelectMethod = "GetVariableTimeConcentrations";
                        VariableTimeDilution varyDil = (VariableTimeDilution)dataItem.DataItem;

                        Label varTimeLbl = (Label)e.Item.FindControl("RateMinLabel");
                        varTimeLbl.Text = varyDil.RateMin.ToString();
                        varTimeLbl = (Label)e.Item.FindControl("rateMaxLabel");
                        varTimeLbl.Text = varyDil.RateMax.ToString();
                        varTimeLbl = (Label)e.Item.FindControl("volumeLabel");
                        var dilution = DilutionLogic.GetMethod(varyDil.DilutionMethodId);
                        varTimeLbl.Text = (dilution.IsVaryVolume)?"N/A (vary by weight)":(varyDil.Volume.ToString() + " mL");
                        varTimeLbl = (Label)e.Item.FindControl("rangeUnitLabel");
                        varTimeLbl.Text = varyDil.RateUnits();
                        infDil = (IInfusionDilution)varyDil;
                    }
                    parameter.DefaultValue = infDil.InfusionDilutionId.ToString();
                    PlaceHolder refPg = (PlaceHolder)e.Item.FindControl("refPgLabel");
                    string fullRef = CurrentDrug.DrugReferenceSource.ReferenceBase(true) + infDil.ReferencePage;
                    if (CurrentDrug.DrugReferenceSource.Location() != ReferenceType.Text && infDil.ReferencePage != null)
                    {
                        //cannot use Hyperlink control here, as url encodes which is confuses filesystem
                        var refPgHL = new System.Web.UI.HtmlControls.HtmlAnchor() { HRef = fullRef, InnerText = infDil.ReferencePage, Target = "_blank" };
                        refPg.Controls.Add(refPgHL);
                    }
                    else
                    {
                        Label refPgLbl = new Label() { Text = fullRef };
                        refPg.Controls.Add(refPgLbl);
                    }
                }
            }
        }
        protected void InfDilutnLV_itemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                ListView embeddedLV = e.Item.FindControl("InfusionConcLV") as ListView;
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                if (embeddedLV != null)
                {
                    Label subHead = embeddedLV.FindControl("concUnits") as Label;
                    if (IsfixedTimeInfusion)
                    {
                        FixedTimeDilution infDil = (FixedTimeDilution)dataItem.DataItem;
                        subHead.Text = "(" + infDil.ConcentrationUnits() + ")";
                        subHead = embeddedLV.FindControl("DilutionUnits") as Label;
                        subHead.Text = "(" + infDil.VolumeUnits() + ")"; //ie dilute to ? mL | mL/kg
                        subHead = embeddedLV.FindControl("rateUnits") as Label;
                        subHead.Text = "(" + infDil.RateUnits() + ")";
                        subHead = embeddedLV.FindControl("drugUnits") as Label;
                        var dilutionMethod = DilutionLogic.GetMethod(infDil.DilutionMethodId);
                        if (subHead != null)
                        {
                            subHead.Text = "(" + CurrentDrug.DrugUnits() + (dilutionMethod.DrawUpPerKg ? "/kg" : "") + ")"; //not infDil.InfusionUnits() as we want the drug used in Dilution!
                        }
                        PlaceHolder varyTimeHolder = (PlaceHolder)embeddedLV.FindControl("variableTimeSpecific");
                        varyTimeHolder.Visible = false;
                        varyTimeHolder = (PlaceHolder)embeddedLV.FindControl("variableTimeSpecificSH");
                        varyTimeHolder.Visible = false;
                    }
                    else
                    {
                        VariableTimeDilution infDil = (VariableTimeDilution)dataItem.DataItem;
                        subHead.Text = "(" + infDil.ConcentrationUnits() + ")";
                        PlaceHolder fixTimeHolder = (PlaceHolder)embeddedLV.FindControl("fixedTimeSpecific");
                        fixTimeHolder.Visible = false;
                        fixTimeHolder = (PlaceHolder)embeddedLV.FindControl("fixedTimeSpecificSH");
                        fixTimeHolder.Visible = false;
                    }
                }
                else //embedded LV==null = edit item
                {
                    RadioButton perHr = (RadioButton)e.Item.FindControl("perHourRadio");
                    if (perHr!=null)
                    {
                        IInfusionDilution infDil = (IInfusionDilution)dataItem.DataItem;
                        perHr.Checked = !infDil.IsPerMin;
                    }
                    Label unitLabel = e.Item.FindControl("unitLabel") as Label;
                    if (unitLabel != null) unitLabel.Text = CurrentDrug.SiUnitId.ToString();

                    Label hrefLabel = e.Item.FindControl("refHref") as Label;
                    if (hrefLabel != null) hrefLabel.Text=HrefLabelVal();
                    //if (isfixedTimeInfusion){}
                }
            }
        }
        protected void InfDilutnLV_allDataBound(object sender, EventArgs e)
        {
            //set default drugId in insert item of listview
            HiddenField drugId = (HiddenField)infDilutnLV.InsertItem.FindControl("InsertHiddenDrugId");
            if (drugId != null && drugId.Value == "") drugId.Value = CurrentDrug.InfusionDrugId.ToString();
            Label unitLabel = infDilutnLV.InsertItem.FindControl("unitLabel") as Label;
            if (unitLabel != null) unitLabel.Text = CurrentDrug.SiUnitId.ToString();
            //if (isfixedTimeInfusion) { }
            Label hrefLabel = infDilutnLV.InsertItem.FindControl("refHref") as Label;
            if (hrefLabel != null) hrefLabel.Text = HrefLabelVal();
        }
        protected void InfusionConcLV_init(object sender, EventArgs e)
        {
            ListView thisLV = (ListView)sender;
            if (IsfixedTimeInfusion)
            {
                thisLV.EnableDynamicData(typeof(FixedTimeConcentration));
            }
            else
            {
                thisLV.EnableDynamicData(typeof(FixedTimeConcentration));
            }
        }

        protected void InfusionConcLV_itemCreated(object sender, ListViewItemEventArgs e)
        {
            ListView concLV = (ListView)sender;
            var dataItem = (ListViewItem)e.Item;

            if (dataItem.ItemType == ListViewItemType.DataItem && e.Item.FindControl("ConcentrationDynamicControl") == null)
            {
                return;
            }
            //put seperate validation group & summary per insert item
            ListViewDataItem infDilutionLVitem = (ListViewDataItem)concLV.NamingContainer;
            var infDil = (IInfusionDilution)infDilutionLVitem.DataItem;
            if (infDil != null)
            {
                string index = infDil.InfusionDilutionId.ToString();
                string ValGroupName = "InsertConcentration" + index;
                string ValSummaryId = "InsertConcValidationSummary" + index;
                if (extraValidationSummaries.FindControl(ValSummaryId) == null)
                {
                    ValidationSummary InsertVal = new ValidationSummary()
                    {
                        ID = ValSummaryId,
                        ValidationGroup = ValGroupName,
                        CssClass = "validationError"
                    };
                    extraValidationSummaries.Controls.Add(InsertVal);
                }
                if (dataItem.ItemType == ListViewItemType.InsertItem)
                {
                    Button InsertBtn = (Button)e.Item.FindControl("InsertButton");
                    InsertBtn.ValidationGroup = ValGroupName;
                    foreach (string c in ConcDynamicControls)
                    {
                        DynamicControl dynamicInsert = (DynamicControl)e.Item.FindControl(c);
                        if (dynamicInsert != null) dynamicInsert.ValidationGroup = ValGroupName;
                    }
                }
            }

            if (IsfixedTimeInfusion)
            {
                PlaceHolder timeHolder = (PlaceHolder)e.Item.FindControl("variableTimeSpecific");
                if (timeHolder != null)
                {
                    timeHolder.Visible = false;
                    timeHolder.Controls.Clear();
                }
            }
            else
            {
                PlaceHolder timeHolder = (PlaceHolder)e.Item.FindControl("fixedTimeSpecific");
                if (timeHolder != null)
                {
                    timeHolder.Visible = false;
                    timeHolder.Controls.Clear();
                }
                Label DoseCatLabel = (Label)e.Item.FindControl("DoseCatLabel");
                if (DoseCatLabel != null)
                {
                    VariableTimeConcentration infConc = (VariableTimeConcentration)dataItem.DataItem;
                    if (infConc.DoseCat != null) DoseCatLabel.Text = infConc.DoseCat.Category;
                }
            }
        }


        protected void InfusionConcLV_allDataBound(object sender, EventArgs e)
        {
            //set default InfusionDilutionId on insert items within Concentration list views
            ListView concLV = (ListView)sender;
            HiddenField concDilId = (HiddenField)concLV.InsertItem.FindControl("InsertInfusionDilutionId");
            if (concDilId != null && concDilId.Value == "")
            {
                ListViewDataItem DilutionLV = (ListViewDataItem)concLV.Parent;
                HiddenField parentDilId = (HiddenField)DilutionLV.FindControl("hiddenDilutionId");
                concDilId.Value = parentDilId.Value.ToString();
            }

            ListViewDataItem infDilutionLVitem = (ListViewDataItem)concLV.NamingContainer;
            if (infDilutionLVitem.DataItem != null) //need this to not loop through twice per dataitem
            {
                var infDil = (IInfusionDilution)infDilutionLVitem.DataItem;
                //var dilMethod = DilutionMethods.FirstOrDefault(m => m.DilutionMethodId == infDil.DilutionMethodId);
                if (IsfixedTimeInfusion && infDil.DilutionMethodId==DilutionMethod.NeatVaryFlowByWeight) 
                {
                    concLV.FindControl("drugUnits").Visible = false;
                    //I need to think about this with less time pressure
                    //? situations required
                    //? javascript to mirror and not provide radiobuttons to toggle
                }
            }
        }
        protected string HrefLabelVal()
        {
            return CurrentDrug.DrugReferenceSource.Hyperlink ?? CurrentDrug.DrugReferenceSource.ReferenceDescription ?? "reference source not set";
        }

        protected void DrugAmpLV_AllDataBound(object sender, EventArgs e)
        {
            HiddenField drugId = (HiddenField)DrugAmpListView.InsertItem.FindControl("drugId");
            if (drugId != null && drugId.Value == "")
            {
                drugId.Value = CurrentDrug.InfusionDrugId.ToString();
            }
        }

        protected void DilutionMethodDropDown_DataBinding(object sender, EventArgs e)
        {
            ((DropDownList)sender).DataSource = Enum.GetValues(typeof(DilutionMethod)).Cast<DilutionMethod>().Select(m=> new { Value = (int)m, Text = m.ToString()  });
        }
        protected void DoseCatDDL_DataBinding(object sender, EventArgs e)
        {
            ((DropDownList)sender).DataSource = DoseCategories;
        }
    }
}
