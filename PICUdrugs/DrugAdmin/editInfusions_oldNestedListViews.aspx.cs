using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.DynamicData;
using PICUdrugs.DAL;
using PICUdrugs.BLL;
using System.Text;

namespace PICUdrugs.Pages
{
    public partial class editInfusions_oldNestedListView : System.Web.UI.Page
    {
        private const string registerScript = "editInfusionObjArray";
        protected int currentDrugID;
        protected string currentDrugUnit;
        protected bool isfixedTimeInfusion;
        protected const string editInfInstatiateJS = "var dilMethod = [];var dilObj=function(pKg, vVol, vConc){this.isPerKg=(pKg!=0);this.varyVolume=(vVol!=0);this.varyConcentration=(vConc!=0);};";
        protected void Page_Load(object sender, EventArgs e)
        {
            string JSArrayBuilderScript;
            if (Page.IsPostBack)
            {
                JSArrayBuilderScript = JSdilutionArray.Value;
            }
            else
            {
                List<dilutionMethod> diluteToWeight;
                using (PICUdrugEntities myEntities = new PICUdrugEntities())
                {
                    var currentDrug = (from d in myEntities.infusionDrugs
                                       where d.InfusionDrugID == currentDrugID
                                       select new { d.fullname, d.SIunit.Measure }).First();
                    DrugName.Text = currentDrug.fullname;
                    currentDrugUnit = currentDrug.Measure;
                    diluteToWeight = (from d in myEntities.dilutionMethods
                                      select d).ToList();
                }
                StringBuilder propertiesBuild = new StringBuilder(300);
                foreach (dilutionMethod dm in diluteToWeight)
                {
                    propertiesBuild.AppendFormat("dilMethod[{0}] = new dilObj({1},{2},{3});",
                                                dm.dilutionMethodID,
                                                dm.perKg==true?"1":"0",
                                                dm.varyVolume== true ? "1" : "0",
                                                dm.varyConcentration == true ? "1" : "0");
                }
                JSArrayBuilderScript = propertiesBuild.ToString();
                JSdilutionArray.Value = JSArrayBuilderScript;
            }
            Type csType = this.GetType();
            if (!Page.ClientScript.IsStartupScriptRegistered(csType, registerScript))
            {
                Page.ClientScript.RegisterStartupScript(csType, registerScript, editInfInstatiateJS + JSArrayBuilderScript, true);
            }
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            string requestID = Request.QueryString.Get("drugID");
            if (requestID == null)
            {
                Response.Redirect("editInfusionDrugNames.aspx");
            }
            currentDrugID = Convert.ToInt32(requestID);
            isfixedTimeInfusion = Request.QueryString.Get("infusionDuration")=="fixed";
            if (isfixedTimeInfusion)
            {
                dilutionsObjDataSource.DataObjectTypeName = "PICUdrugs.DAL.fixedTimeDilution";
                dilutionsObjDataSource.SelectMethod = "getFixedTimeDilutions";
                infDilutnLV.EnableDynamicData(typeof(fixedTimeDilution));
            }
            else
            {
                dilutionsObjDataSource.DataObjectTypeName = "PICUdrugs.DAL.variableTimeDilution";
                dilutionsObjDataSource.SelectMethod = "getVariableTimeDilutions";
                infDilutnLV.EnableDynamicData(typeof(variableTimeDilution));
            }
        }
        protected void ObjDilutions_CRUD(object sender, ObjectDataSourceStatusEventArgs e)
        {
            Exception outerExcept = e.Exception;
            if (outerExcept != null)
            {
                var overlappingAgeWtValidator = new CustomValidator();
                overlappingAgeWtValidator.IsValid = false;
                if (outerExcept.InnerException is OverlappingAgeWeightException ||
                    outerExcept.InnerException is nonAscendingRangeException ||
                    outerExcept.InnerException is duplicateTimeException)
                {
                    overlappingAgeWtValidator.ErrorMessage = "Unable to proceed because: " + e.Exception.InnerException.Message;
                }
                else
                {
                    Exception innermostExcept=outerExcept.InnerException;
                    while (innermostExcept.InnerException != null) innermostExcept = innermostExcept.InnerException;

                    overlappingAgeWtValidator.ErrorMessage = "Database rules prevented changes: " + innermostExcept.Message;
                }
                Page.Validators.Add(overlappingAgeWtValidator);
                e.ExceptionHandled = true;
            }
        }
        protected void objConcentrations_CRUD(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                var overlappingAgeWtValidator = new CustomValidator();
                overlappingAgeWtValidator.IsValid = false;
                overlappingAgeWtValidator.ErrorMessage = "Update failed: " + e.Exception.InnerException.Message;
                Page.Validators.Add(overlappingAgeWtValidator);
                e.ExceptionHandled = true;
            }
        }
        protected void infDilutnLV_itemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                //note objConcentrationsDataSource only in itemTemplate
                ObjectDataSource infConcentrations = e.Item.FindControl("objConcentrations") as ObjectDataSource;
                if (infConcentrations != null)
                {
                    ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                    Parameter parameter = infConcentrations.SelectParameters[0];

                    ListView embeddedLV = e.Item.FindControl("infusionConcListView") as ListView;
                    Label unitDescription = embeddedLV.FindControl("concUnits") as Label;
                    Label dilutionUnits = embeddedLV.FindControl("dilutionUnits") as Label;
                    Label rateUnits = embeddedLV.FindControl("rateUnits") as Label;
                    Label drugUnits = embeddedLV.FindControl("drugUnits") as Label;
                    //set properties according to infusion type
                    if (isfixedTimeInfusion)
                    {
                        //set select parameter on objectdatasource
                        fixedTimeDilution infDil = (fixedTimeDilution)dataItem.DataItem;
                        parameter.DefaultValue = infDil.infusionDilutionID.ToString();
                        if (unitDescription != null)
                        {
                            unitDescription.Text = "(" + infDil.concentrationUnits() + ")";
                            dilutionUnits.Text = "(" + infDil.volumeUnits() + ")";
                            rateUnits.Text = "(" + infDil.rateUnits() + ")";
                            drugUnits.Text = "(" + infDil.infusionUnits() + ")";
                        }
                    }
                    else
                    {
                        variableTimeDilution infDil = (variableTimeDilution)dataItem.DataItem;
                        parameter.DefaultValue = infDil.infusionDilutionID.ToString();
                    }
                    //populate header of table 
                }
            }
        }
        protected void infDilutnLV_allDataBound(object sender, EventArgs e)
        {
            //set default drugID in insert item of listview
            HiddenField drugID = (HiddenField)infDilutnLV.InsertItem.FindControl("insertHiddenDrugID");
            if (drugID != null && drugID.Value == "") drugID.Value = currentDrugID.ToString();
        }
        protected void infusionConcLV_init(object sender, EventArgs e)
        {
            ListView thisLV = (ListView)sender;
            thisLV.EnableDynamicData(typeof(fixedTimeConcentration));
        }
        protected void ConcentrationLV_itemCreated(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.InsertItem)
            {
                ListView embeddedLV = (ListView)sender;
                ListViewDataItem DilutionLVitem = (ListViewDataItem)embeddedLV.NamingContainer;
                if (DilutionLVitem.DataItem == null) //need this to not loop through twice per dataitem
                {
                    string index = DilutionLVitem.DataItemIndex.ToString();
                    string ValGroupName = "insertConcentration" + index;
                    string ValSummaryID = "insertConcValidationSummary" + index;
                    if (extraValidationSummaries.FindControl(ValSummaryID) == null)
                    {
                        ValidationSummary insertVal = new ValidationSummary()
                        {
                            ID = ValSummaryID,
                            ValidationGroup = ValGroupName,
                            CssClass = "validationError"
                        };
                        extraValidationSummaries.Controls.Add(insertVal);
                    }
                    foreach (Control ctrl in embeddedLV.InsertItem.Controls)
                    {
                        if (ctrl.ID == "InsertButton")
                        {
                            Button insertBtn = (Button)embeddedLV.InsertItem.FindControl("InsertButton");
                            insertBtn.ValidationGroup = ValGroupName;
                        }
                        else
                        {
                            DynamicControl DC = ctrl as DynamicControl;
                            if (DC != null) DC.ValidationGroup = ValGroupName;
                        }
                    }
                }
            }
        }
        protected void ConcentrationLV_allDataBound(object sender, EventArgs e)
        {
            //will set default infusionDilutionID on insert item
            ListView embeddedLV = (ListView)sender;
            
            ListViewDataItem outerLVdataItem = (ListViewDataItem)embeddedLV.NamingContainer;
            //this is only relevant if no dataItem exists for the parent dataitem - seems to fire once after items & once after insert template
            if(outerLVdataItem.DataItem == null)
            {
                //find where to insert Dilution ID in insert template
                HiddenField insertinfusionDilutionID = (HiddenField)embeddedLV.InsertItem.FindControl("insertinfusionDilutionID");
                //find dilutionID of outer listview
                // - note the hiddenField is really being used as a property of the outer dataItem - does it need to be posted
                HiddenField editinfusionDilutionID = (HiddenField)outerLVdataItem.FindControl("hiddenDilutionID");
                if (insertinfusionDilutionID != null && editinfusionDilutionID != null)
                {
                    insertinfusionDilutionID.Value = editinfusionDilutionID.Value.ToString();
                }
            }
        }
    }
}
