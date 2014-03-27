using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Text;
using System.Web.Script.Serialization;
using PICUdrugs.Utils;
using PICUdrugs.DAL;
using PICUdrugs.BLL;
using StatsForAge.DataSets;
namespace PICUdrugs.Pages
{
    public partial class EnterPtData : System.Web.UI.Page
    {
        public const double warnCentileUbound = 99;
        public const double warnCentileLbound = 1;
        public const double limitCentileUbound = 100 - 1e-7;
        public const double limitCentileLbound = 1e-10;
        //private const string timeRegEx = @"^(20|21|22|23|0\d|\d):([0-5]\d)\s*([aApP])[.m]*$";
        protected void Page_PreInit(object sender, EventArgs e)
        {
            SiteMaster containingMaster = (SiteMaster)Page.Master;
            containingMaster.ValidateXsrfToken = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Type csType = this.GetType();
            if (!Page.ClientScript.IsStartupScriptRegistered(csType, "controlNames"))
            {
                Page.ClientScript.RegisterStartupScript(csType, "controlNames", JSglobals(), false);
            }
            StatsForAge.JavaScript.Include_UkWeightData(Page.ClientScript);
            wardList.DataBind();
            if (!Page.IsPostBack)
            {
                HttpCookie defaultWard = Request.Cookies.Get("ward");
                if (defaultWard != null) { wardList.SelectedValue = defaultWard.Value; }
                //if (Request.UserHostName=="????????????") && PreviousPage
                ptWeightRngValidator.Type = ValidationDataType.Double;
                ptAgeRngValidator.Type = ValidationDataType.Integer;
                ptAgeRngValidator.MinimumValue = FieldConst.minAge.ToString();
                ptAgeRngValidator.MaximumValue = FieldConst.maxAge.ToString();
                //?add 1 day or use datetimekind to allow for international time differences
                DateTime maxDOB = DateTime.Today;
                DateTime minDOB = new DateTime(maxDOB.Year - 99, 1, 1);
                ptDOBRngValidator.Type = ValidationDataType.Date;
                ptDOBRngValidator.MinimumValue = minDOB.ToShortDateString();
                ptDOBRngValidator.MaximumValue = maxDOB.ToShortDateString();
                ptDOBRngValidator.ErrorMessage = string.Format("Date of birth must be between {0:dd MMM yyyy} and {1:dd MMM yyyy} (day/month/year)", minDOB, maxDOB);

                var query = Request.QueryString;
                if (query.Count > 0)
                {
                    string infusion = query.Get("infusion");
                    if (!string.IsNullOrEmpty(infusion))
                    {
                        var infDetails = UserSelectedInfusion.GetSingleInfusion(infusion);
                        if (infDetails != null)
                        {
                            string infusionSelected = "pic.util.addEvent(window,'load',function(){pic.ajax.drugChosen(" + infDetails.ToJSON() +")});";
                            Page.ClientScript.RegisterStartupScript(csType, "infusionSelected", infusionSelected, true);
                            chartTypeRadio.SelectedValue = "choose";
                        }
                    }
                    else
                    {
                        string wardName = query.Get("ward");
                        if (!string.IsNullOrEmpty(wardName))
                        {
                            ListItem newItem = wardList.Items.FindByText(wardName);
                            if (newItem != null)
                            {
                                wardList.SelectedItem.Selected = false;
                                newItem.Selected = true;
                            }
                        }
                        string bolusOnly = query.Get("bolusOnly");
                        if (bolusOnly != null && bolusOnly.ToLower() != "false")
                        {
                            chartTypeRadio.SelectedValue = "bolus";
                        }
                        else
                        {
                            chartTypeRadio.SelectedValue = "list";
                        }
                    }
                }
                else
                {
                    HttpCookie defaultReport = Request.Cookies.Get("report");
                    chartTypeRadio.SelectedValue = defaultReport == null ? "list" : defaultReport.Value;
                }
            }
        }
        /// <summary>
        /// set cookie for default value of Ward
        /// not being used at present - javaScript handles cookie creation instead
        /// This facillitates resetting expires every time submit button is pressed, and also
        /// bypasses any problems with the response redirect
        /// </summary>
        protected void WardListIndexChange(object sender, EventArgs e)
        {
            HttpCookie defaultWard = new HttpCookie("defaultWard");
            defaultWard.Expires = DateTime.Now.AddMonths(3);
            defaultWard.Value = wardList.SelectedValue;
            Response.Cookies.Add(defaultWard);
        }

        public PatientDrugChartDetails PatientDetails()
        {
            var returnVal = new PatientDrugChartDetails();
            returnVal.Name = ptName.Text;
            returnVal.NHI = ptNHI.Text.ToUpper();
            returnVal.ActualWeight = Convert.ToDouble(ptWeight.Text);
            returnVal.WeightEstimate = weightEstimate.Checked;
            returnVal.WardId = Convert.ToInt32(Request.Form[wardList.UniqueID]);
            returnVal.Centile = centileText.Text;
            returnVal.Age = this.Age;
            returnVal.IsMale = this.IsMale;
            return returnVal;
        }
        private bool? _isMale;
        public bool? IsMale 
        { 
            get 
            {
                if (!_isMale.HasValue)
                {
                    _isMale = String.IsNullOrEmpty(genderRadio.Text) ? (bool?)null : (genderRadio.Text == "male");
                }
                return _isMale;
            } 
        }
        public bool IsAgeNotProvided { get { return (ptAgeYrs.Text == "" && ptAgeMonths.Text == "" && ptDOB.Text == ""); } }
        private ChildAge _age;
        private ChildAge Age
        {
            get
            {
                if (_age == null)
                {
                    if (!String.IsNullOrWhiteSpace(ptDOB.Text))
                    {
                        _age = new ChildAge(DateTime.Parse(ptDOB.Text));
                    }
                    else if (!String.IsNullOrWhiteSpace(ptAgeYrs.Text) || !String.IsNullOrWhiteSpace(ptAgeMonths.Text) || !String.IsNullOrWhiteSpace(ptAgeDays.Text))
                    {
                        _age = new ChildAge(ptAgeYrs.Text, ptAgeMonths.Text, ptAgeDays.Text);
                    }
                }
                return _age;
            }
        }
        public SelectedChart ChartSelected {
            get{ 
                    switch(chartTypeRadio.SelectedValue) {
                        case("bolus"):
                            return SelectedChart.bolusOnly;
                        case ("list"):
                            return SelectedChart.bolusPlusInfusion;
                        case ("choose"):
                            return SelectedChart.singleInfusion;
                        default:
                            return SelectedChart.noneSelected;
                    }
            }
        }
        public UserSelectedInfusion.SelectedInfusion InfusionSelected { 
           get {
               if (drugJSON.Value == "") return null;
               JavaScriptSerializer serial = new JavaScriptSerializer();
               return serial.Deserialize<UserSelectedInfusion.SelectedInfusion>(drugJSON.Value);
            }
        }
        private string JSglobals() {
            return "<script src='" + ResolveUrl("~/Scripts/PICUdrugUtils-0.4.js") + "' type='text/javascript'></script><script type='text/javascript'>" +
                "pic.el('male','" + genderRadio.ClientID + "_0')" + 
                   ".el('female','" + genderRadio.ClientID + "_1')" + 
                   ".el('yrs','" + ptAgeYrs.ClientID + "')" + 
                   ".el('months','" + ptAgeMonths.ClientID + "')" + 
                   ".el('days','" + ptAgeDays.ClientID + "')" + 
                   ".el('DOB','" + ptDOB.ClientID + "')" + 
                   ".el('WtOrAgeVal','" + dobOrAgeValidator.ClientID + "')" + 
                   ".el('DOBvalidator','" + ptDOBRngValidator.ClientID + "')" + 
                   ".el('weight','" + ptWeight.ClientID + "')" + 
                   ".el('guessCB','" + weightEstimate.ClientID + "')" + 
                   ".el('DOBval','" + ptDOBRngValidator.ClientID + "')" + 
                   ".el('medianWeightBtn')" + 
                   ".el('NHI','" + ptNHI.ClientID + "')" + 
                   ".el('centileVal','" + centileValidator.ClientID + "')" + 
                   ".el('wardList','" + wardList.ClientID + "')" + 
                   ".el('drugJSON','" + drugJSON.ClientID + "')" + 
                   ".el('bolus','" + chartTypeRadio.ClientID + "_0')" + 
                   ".el('list','" + chartTypeRadio.ClientID + "_1')" + 
                   ".el('choose','" + chartTypeRadio.ClientID + "_2')" + 
                   ".el('monthVal','" + ptMonthsVal.ClientID + "')" + 
                   ".el('gestation','" + WeeksGestation.ClientID + "')" + 
                   ".el('centileText','" + centileText.ClientID + "')" + 
                   ".el('upperCentileValue','" + upperCentileValue.ClientID + "')" + 
                   ".el('lowerCentileValue','" + lowerCentileValue.ClientID + "');" + 
                "pic.el.chooseLbl=pic.el.choose.parentNode.getElementsByTagName('label')[0];" + 
                "pic.centileValue = {};" + 
                "pic.centileValue.hardMin = " + limitCentileLbound + ";" + 
                "pic.centileValue.softMin = " + warnCentileLbound + ";" + 
                "pic.centileValue.softMax = " + warnCentileUbound + ";" + 
                "pic.centileValue.hardMax = " + limitCentileUbound + ";" + 
                "pic.centileValue.set = {};" + 
                "pic.centileValue.set.age = new pic.construct.Age(null, null, null);" + 
                "pic.centileValue.set.weight = null;" + 
                "pic.centileValue.set.isMale = null;" + 
                "pic.el('drugDiv', 'drugSelect').el('concDiv').el('drugName', 'selectDrug').el('cancelConc').el('cancelDrug', 'cancelList').el('concTable').el('drugList').el('chosenDrug');" + 
                "</script>";
        }

        [WebMethod]
        public static UserSelectedInfusion.SingleInfusion[] GetSingleInfusions()
        {
            return UserSelectedInfusion.GetSingleInfusions();
        }

        /*
        public static UserSelectedInfusion.AmpuleDetail[] GetAmpuleConcentrations(int drugId)
        {
            var ampConc = UserSelectedInfusion.AmpConc(drugId);
            return ampConc;
        }
         * */

        #region Validators
        protected void DobOrAgeValServer(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !(ptAgeYrs.Text.Trim() == "" && ptDOB.Text.Trim() == "");
        }
        protected void MonthsValServer(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (ptAgeYrs.Text.Trim() != "0" || ptAgeMonths.Text.Trim() != "");
        }
        protected void centileValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //belongs to validationgroup centile
            if (!(ptWeightRqdValidator.IsValid && ptWeightRngValidator.IsValid && dobOrAgeValidator.IsValid && ptMonthsVal.IsValid && ptDOBRngValidator.IsValid
                && ptAgeRngValidator.IsValid && ptMonthRngValidator.IsValid && ptDaysRngValidator.IsValid))
            {
                return;
            }

            double upperCentile;
            double lowerCentile;
            bool centileOk = double.TryParse(upperCentileValue.Value, out upperCentile);
            centileOk |= double.TryParse(lowerCentileValue.Value, out lowerCentile);

            if (!centileOk)
            {
                if (this.Age == null){ return; }
                {
                    var wtData = new UKWeightData();
                    var wt = double.Parse(ptWeight.Text);
                    int weeksGestation;
                    if (!int.TryParse(WeeksGestation.Text, out weeksGestation)) 
                    { 
                        weeksGestation = 40; 
                    }
                    IntegerRange ageRange = Age.GetAgeRangeInDays();
                    if (this.IsMale.HasValue)
                    {
                        NumericRange centileRng = new NumericRange(
                            wtData.CumSnormForAge(wt, ageRange.LowerBound, IsMale.Value, weeksGestation) * 100,
                            wtData.CumSnormForAge(wt, ageRange.UpperBound, IsMale.Value, weeksGestation) * 100);
                        upperCentile = centileRng.UpperBound;
                        lowerCentile = centileRng.LowerBound;
                        upperCentileValue.Value = upperCentile.ToString();
                        lowerCentileValue.Value = lowerCentile.ToString();

                        centileText.Text = centileRng.AsCentileString();
                    }
                    else //gender not set - get both genders, and check a female does not weigh more than the upper bound, or a male less than lower bound
                    {
                        NumericRange maleCentile = new NumericRange
                        ( wtData.CumSnormForAge(wt, ageRange.LowerBound, true, weeksGestation) * 100,
                          wtData.CumSnormForAge(wt, ageRange.UpperBound, true, weeksGestation) * 100 );
                        NumericRange femaleCentile = new NumericRange
                        ( wtData.CumSnormForAge(wt, ageRange.LowerBound, false, weeksGestation) * 100,
                          wtData.CumSnormForAge(wt, ageRange.UpperBound, false, weeksGestation) * 100 );
                        centileText.Text = string.Format("\u2642{0}, \u2640{1}",
                            maleCentile.AsCentileString(),
                            femaleCentile.AsCentileString());
                        upperCentile = maleCentile.UpperBound;
                        lowerCentile = femaleCentile.LowerBound;
                    }
                }
            }
            args.IsValid = (upperCentile < limitCentileUbound && lowerCentile > limitCentileLbound);
        }
        #endregion
        
        protected void Submit_Click(object sender, EventArgs e)
        {
            if (chartTypeRadio.Text != "bolus") 
            { 
                Page.Validate("age"); 
            }
            Page.Validate("centile");
            if (Page.IsValid) { Server.Transfer("~/PatientSpecificDrugChart.aspx", true); }
        }

        protected void wardList_DataBinding(object sender, EventArgs e)
        {
            
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                
                List<Ward> wards;
                using (var db = new DataContext())
                {
                    wards = db.Wards.ToList();
                             //where w.IsLive || w.WardId==userWardId
                             //select w).ToList();
                }
                wardList.DataSource = wards;
                int? userWardId = UserProfile.GetUserProfile(HttpContext.Current.User.Identity.Name).WardId;
                EventHandler dataBound = null;
                dataBound = delegate
                {
                    for (int i = 0; i < wards.Count; i++)
                    {
                        var att = wardList.Items[i].Attributes;
                        if (wards[i].WardId == userWardId)
                        {
                            if (!wards[i].IsLive)
                            {
                                att.Add("class", "homeWard notLive");
                            }
                            else
                            {
                                att.Add("class", "homeWard");
                            }
                        }
                        else if (!wards[i].IsLive)
                        {
                            wardList.Items[i].Attributes.Add("class", "notLive");
                        }
                    }
                    dataBound = null;
                };
                wardList.DataBound += dataBound;
            }
            else
            {
                IEnumerable<Ward> wards;
                using (var db = new DataContext())
                {
                    wards = (from w in db.Wards
                             where w.IsLive
                             select w).ToList();
                }
                wardList.DataSource = wards;
            }

        }

    }
    public class BiGenderZWt4Age
    {
        public double MaleZ {get; set;}
        public double FemaleZ { get; set; }
    }
}