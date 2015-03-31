using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs2013.Code.BuisnessLayer
{
    public static class IVFluids
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="weight">Weight in kilograms</param>
        /// <returns>fluid rate (ml/hr)</returns>
        public static int HollidaySegar(int weight)
        {
            if (weight>20)
            {
                return 60 + (weight - 20);
            }
            if (weight>10)
            {
                return 40 + (weight - 10)*2;
            }
            return 4 * weight;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="age">age in total completed months</param>
        /// <returns></returns>
        public static double DextroseConcentration(int age)
        {
            if (age <6)
            {
                return 10;
            }
            if (age<72)
            {
                return 5;
            }
            return 2.5;
        }

    }
}