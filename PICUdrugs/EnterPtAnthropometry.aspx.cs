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
using DBToJSON.SqlEntities;

namespace PICUdrugs.Pages
{
    public partial class EnterPtAnthropometry : System.Web.UI.Page
    {
        public const double warnCentileUbound = 99;
        public const double warnCentileLbound = 1;
        public const double limitCentileUbound = 100 - 1e-7;
        public const double limitCentileLbound = 1e-7;
        //private const string timeRegEx = @"^(20|21|22|23|0\d|\d):([0-5]\d)\s*([aApP])[.m]*$";
        protected void Page_PreInit(object sender, EventArgs e)
        {
            SiteMaster containingMaster = (SiteMaster)Page.Master;
            containingMaster.ValidateXsrfToken = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //if (Request.UserHostName=="????????????") && PreviousPage
                ptWeightRngValidator.Type = ValidationDataType.Double;
                ptWeightRngValidator.MinimumValue = FieldConst.minWeight.ToString();
                ptWeightRngValidator.MaximumValue = "200";
                ptAgeRngValidator.Type = ValidationDataType.Integer;
                ptAgeRngValidator.MinimumValue = FieldConst.minAge.ToString();
                ptAgeRngValidator.MaximumValue = FieldConst.maxAge.ToString();
                //?add 1 day or use datetimekind to allow for international time differences
                DateTime maxDOB = DateTime.Today;
                DateTime minDOB = new DateTime(maxDOB.Year - 99, 1, 1);
                ptDOBRngValidator.MinimumValue = minDOB.ToShortDateString();
                ptDOBRngValidator.MaximumValue = maxDOB.ToShortDateString();
                ptDOBRngValidator.ErrorMessage = string.Format("Date of birth must be between {0:dd MMM yyyy} and {1:dd MMM yyyy}", minDOB, maxDOB);
            }
            Type csType = this.GetType();
            if (!Page.ClientScript.IsStartupScriptRegistered(csType, "controlNames"))
            {
                Page.ClientScript.RegisterStartupScript(csType, "controlNames", JSglobals(), false);
            }
        }

        public Anthropometry PatientAnthropometry()
        {
            double wt;
            double length;
            double gestation;
            return new Anthropometry { 
                WeightKg = double.TryParse(ptWeight.Text, out wt)?wt:0,
                LengthCm = double.TryParse(ptLength.Text, out length)?length:0,
                WeeksGestAgeAtBirth = double.TryParse(WeeksGestation.Text, out gestation)?gestation:40,
                ChildAge = Age(),
                IsMale = IsMale
            };
        }
        public bool IsMale { get { return genderRadio.SelectedValue == "male"; } }
        protected void DobOrAgeValServer(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !(ptAgeMonths.Text.Trim() == "" && (ptAgeYrs.Text.Trim() == "0" || ptDOB.Text.Trim() == ""));
        }
        protected void LengthOrWeightValServer(object source, ServerValidateEventArgs args)
        {
            args.IsValid = ptWeight.Text.Trim() != "" || ptLength.Text.Trim() != "";
        }
        private ChildAge Age()
        {
            if (!String.IsNullOrWhiteSpace(ptDOB.Text))
            {
                return new ChildAge(DateTime.Parse(ptDOB.Text));
            }
            else if (!String.IsNullOrWhiteSpace(ptAgeYrs.Text) || !String.IsNullOrWhiteSpace(ptAgeMonths.Text) || !String.IsNullOrWhiteSpace(ptAgeDays.Text))
            {
                return new ChildAge(ptAgeYrs.Text, ptAgeMonths.Text, ptAgeDays.Text);
            }
            else
            {
                return null;
            }
        }
        private string JSglobals() {
            StringBuilder returnVal = new StringBuilder(1500);
            returnVal.AppendFormat("<script src='{0}' type='text/javascript'></script><script  type='text/javascript'>", ResolveUrl("~/Scripts/PICUdrugUtils-0.5.js"));
            string radioId = genderRadio.ClientID;
            returnVal.AppendLine("pic.el('male','" + radioId + "_0')");
            returnVal.AppendLine("   .el('female','" + radioId + "_1')");
            returnVal.AppendLine("   .el('yrs','" + ptAgeYrs.ClientID + "')");
            returnVal.AppendLine("   .el('months','" + ptAgeMonths.ClientID + "')");
            returnVal.AppendLine("   .el('days','" + ptAgeDays.ClientID + "')");
            returnVal.AppendLine("   .el('DOB','" + ptDOB.ClientID + "')");
            returnVal.AppendLine("   .el('DOBvalidator','" + ptDOBRngValidator.ClientID + "')");
            returnVal.AppendLine("   .el('weight','" + ptWeight.ClientID + "')");
            returnVal.AppendLine("   .el('ptLength','" + ptLength.ClientID + "')");
            returnVal.AppendLine("   .el('DOBval','" + ptDOBRngValidator.ClientID + "')");
            returnVal.AppendLine("   .el('submitBtn','" + Submit.ClientID + "');");
            returnVal.Append("</script>");
            return returnVal.ToString();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) { Server.Transfer("~/DisplayAnthropometry.aspx", true); }
        }
    }
}