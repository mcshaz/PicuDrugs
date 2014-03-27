using PICUdrugs.BLL;
using PICUdrugs.DAL;
using PICUdrugs.Utils;
using StatsForAge;
using StatsForAge.DataSets;
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
            
            Anthropometry ptDetails = PreviousPage.PatientAnthropometry();
            age.Text = ptDetails.ChildAge.ToString();
            
            if (ptDetails.ChildAge == null)
            {
                age.Text = "No details entered";
            }
            else
            {
                UKWeightData weightData = new UKWeightData();
                var ageDays = (int)(ptDetails.ChildAge.GetAgeRangeInDays().MidRange+0.5);
                LMS weightParams = weightData.LMSForAge(ageDays, ptDetails.IsMale, ptDetails.WeeksGestAgeAtBirth);
                if (ptDetails.WeightKg != 0)
                {
                    weight.Text = ptDetails.WeightKg.ToString("#.#");
                    weightCentile.Text = StatisticalDataExtensions.CentileToString(weightParams.Centile(ptDetails.WeightKg), true);
                    if (ptDetails.LengthCm != 0)
                    {
                        UKBMIData bmiData = new UKBMIData();
                        double bmiVal = ptDetails.Bmi();
                        bmi.Text = bmiVal.ToString("#.#");

                        if (bmiData.IsDataAvailable(ageDays, ptDetails.IsMale, ptDetails.WeeksGestAgeAtBirth))
                        {
                            bmiCentile.Text = StatisticalDataExtensions.CentileToString(
                            bmiData.LMSForAge(ageDays, ptDetails.IsMale, ptDetails.WeeksGestAgeAtBirth).Centile(bmiVal), true);
                        }
                        else
                        {
                            BmiPlaceholder.Controls.Clear();
                            BmiPlaceholder.Controls.Add(new LiteralControl("population data for BMI is not available within this age group"));
                        }

                        bsa.Text = ptDetails.Bsa().ToString("0.00");

                        var yHat = ptDetails.eLbm();
                        lbm.Text = yHat.Estimate.ToString(2);
                        lbmReference.Text = yHat.ReferenceHtml;
                    }
                }
                if (ptDetails.LengthCm != 0)
                {
                    length.Text = ptDetails.LengthCm.ToString("#.#");
                    UKLengthData lengthData = new UKLengthData();
                    double lengthZ = lengthData.ZForAge(ptDetails.LengthCm, ageDays, ptDetails.IsMale, ptDetails.WeeksGestAgeAtBirth);
                    lengthCentile.Text = StatisticalDataExtensions.CentileToString(
                        100*Stats.CumSnorm(lengthZ), true);

                    weightByLength.Text = weightParams.XfromZscore(lengthZ).ToString(2);
                }
            }
            if (ptDetails.WeightKg == 0)
            {
                weightDetails.Visible = false;
            }

            if (ptDetails.LengthCm == 0)
            {
                LengthDetails.Visible = false;
            }

            if (ptDetails.WeightKg == 0 || ptDetails.LengthCm == 0)
            {
                HeightAndLengthDetails.Visible = false;
            }
        }
    }
}