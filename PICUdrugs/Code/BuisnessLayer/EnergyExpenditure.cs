using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs.BLL
{
    public static class EnergyExpenditure
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="weight">Weight in Kilograms</param>
        /// <param name="age">Age in completed years</param>
        /// <param name="isMale"></param>
        /// <param name="height">height/length in metres</param>
        /// <returns>Basal Metabolic Rate in kcal/day</returns>
        public static double Schofield(double weight, int age,bool isMale,double? height = null)
        {
            if (weight < 3) { weight = 3; }
            if (height.HasValue)
            {
                if (age < 3)
                {
                    return isMale
                        ? 0.167 * weight + 1517.4*height.Value - 617.6
                        : 16.25 * weight + 1023.2 * height.Value - 413.5;
                }
                if (age < 10)
                {
                    return isMale
                        ? 19.6 * weight + 130.3 * height.Value - 414.9
                        : 16.97 * weight + 161.8 * height.Value - 371.2;
                }
                //else using 10-18yrs
                return isMale
                    ? 16.25 * weight + 137.2 * height.Value + 515.5
                    : 8.365 * weight + 465 * height.Value + 200;
            }
            else
            {
                if (age < 3)
                {
                    return isMale ? 59.48 * weight - 30.3 : 58.29 * weight - 31.1;
                }
                if (age < 10)
                {
                    return isMale ? 22.7 * weight + 505 : 20.3 * weight + 486;
                }
                //else using 10-18yrs
                return isMale ? 17.7 * weight + 659 : 13.4 * weight + 693;
            }
        }
    }
}