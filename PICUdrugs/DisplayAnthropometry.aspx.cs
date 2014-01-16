using PICUdrugs.BLL;
using PICUdrugs.DAL;
using PICUdrugs.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PICUdrugs
{
    public partial class DisplayAnthropometry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.PreviousPage == null || !Page.PreviousPage.IsValid)
            {
                Response.Redirect("EnterPtAnthropometry.aspx");
            }
            StatisticalData weightData=null;
            StatisticalData lengthData=null;
            StatisticalData bmiData=null;
            var ptDetails = PreviousPage.PatientAnthropometry();
            age.Text = ptDetails.ChildAge.ToString();

            if (ptDetails.ChildAge != null)
            {
                weightData = StatisticalTables.GetWeightStats(ptDetails.ChildAge, ptDetails.IsMale);
            }
            using (var statLookup = new StatisticalTables(ptDetails.ChildAge, ptDetails.IsMale))
            {
                if (ptDetails.LengthCm != 0)
                {
                    lengthData = statLookup.GetLengthForAge();
                    if (ptDetails.WeightKg != 0) { bmiData = statLookup.GetBmiForAge(); }
                }
            }
            if (ptDetails.WeightKg == 0)
            {
                weightDetails.Visible = false;
            }
            else
            {
                weight.Text = ptDetails.WeightKg.ToString("#.#");
                weightCentile.Text = weightData.CentileString(ptDetails.WeightKg, true);
            }

            if (ptDetails.LengthCm == 0)
            {
                LengthDetails.Visible = false;
            }
            else
            {
                length.Text = ptDetails.LengthCm.ToString("#.#");
                var lengthZ = lengthData.ZfromX(ptDetails.LengthCm);
                lengthCentile.Text = StatisticalDataExtensions.CentileToString(StatisticalMethods.CumSnorm(lengthZ) * 100, true);
                weightByLength.Text = weightData.XfromZ(lengthZ).ToString(2);
            }

            if (ptDetails.WeightKg == 0 || ptDetails.LengthCm == 0)
            {
                HeightAndLengthDetails.Visible = false;
            }
            else
            {
                if (bmiData == null)
                {
                    BmiPlaceholder.Controls.Clear();
                    BmiPlaceholder.Controls.Add(new LiteralControl("population data for BMI is not available within this age group"));
                }
                else
                {
                    var Bmi = ptDetails.Bmi();
                    bmi.Text = Bmi.ToString("#.#");
                    bmiCentile.Text = bmiData.CentileString(Bmi, true);
                }

                bsa.Text = ptDetails.Bsa().ToString("0.00");

                var yHat = ptDetails.eLbm();
                lbm.Text = yHat.Estimate.ToString(2);
                //lbm.Text = (yHat.Estimate<20)?Math.Round(yHat.Estimate,1).ToString():Math.Round(yHat.Estimate).ToString();
                lbmReference.Text = yHat.ReferenceHtml;
            }
        }
    }
}