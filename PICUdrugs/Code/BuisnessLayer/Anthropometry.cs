using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PICUdrugs.Utils;
using PICUdrugs.DAL;

namespace PICUdrugs.BLL
{
    public class RegressionResult
    {
        public string ReferenceHtml { get; set; }
        public double Estimate { get; set; }
    }
    public class Anthropometry
    {
        public ChildAge ChildAge { get; set; }
        public bool IsMale { get; set; }
        public double WeightKg { get; set; }
        public double LengthCm { get; set; }
        public double WeeksGestAgeAtBirth { get; set; }
        public double Bmi() { return WeightKg / (Math.Pow(LengthCm / 100, 2)); }
        public double Bsa() { return Math.Sqrt((LengthCm * WeightKg) / 3600); }
        private const string Peters = "Peters AM, Snelling HLR, Glass DM, Bird NJ. Estimate of lean body mass in children. <em>Br J Anaesth</em> 2011; <strong>106</strong>: 719-23";
        private const string Boer = "Boer P. Estimate of lean body mass as an index for normalization of body fluid volumes in man. <em>Am J Physiol</em> 1984; <strong>247</strong>: F632-5";
        public RegressionResult eLbm()
        {
            var returnVal = new RegressionResult();
            if (ChildAge.Years < 14)
            {
                returnVal.Estimate = 0.0817 * Math.Pow(WeightKg, 0.6469) * Math.Pow(LengthCm, 0.7236);
                returnVal.ReferenceHtml = Peters;
            }
            else if (IsMale)
            {
                returnVal.Estimate = 0.407 * WeightKg + 0.267 * LengthCm - 19.2;
                returnVal.ReferenceHtml = Boer;
            }
            else
            {
                returnVal.Estimate = 0.252 * WeightKg + 0.473 * LengthCm - 48.3;
                returnVal.ReferenceHtml = Boer;
            }
            return returnVal;
        }
    }
}