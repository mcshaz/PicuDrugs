using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBToJSON.SqlEntities;
using DBToJSON.SqlEntities.Enums;
using DBToJSON.SqlEntities.Infusions;
using PICUdrugs.Utils;
namespace PICUdrugs.DAL 
{
    public static class InfusionExtensions
    {
        public static string InfusionUnits(this IInfusionDilution dil)
        {
            return Formulas.LogSiToString(dil.SiPrefix) + dil.InfusionDrug.SiUnitId; //OK if lazy loading or include used in linq to entities
        }
        public static string RateUnits(this IInfusionDilution dil)
        {
            MethodLogic method = DilutionLogic.GetMethod(dil.DilutionMethodId);
            return dil.InfusionUnits() + (method.IsPerKg ? "/kg/" : "/") + (dil.IsPerMin ? "min" : "hr");
        }
        public static string ConcentrationUnits(this IInfusionDilution dil)
        {
            MethodLogic method = DilutionLogic.GetMethod(dil.DilutionMethodId);
            return dil.InfusionUnits() + (method.IsVaryConcentration ? "/kg/" : "/") + (dil.IsPerMin ? "min" : "hr");
        }
        public static string VolumeUnits(this IInfusionDilution dil)
        {
            MethodLogic method = DilutionLogic.GetMethod(dil.DilutionMethodId);
            return (method.IsPerKg && method.IsVaryVolume && !method.IsVaryConcentration) ? "mL/kg" : "mL";         
        }
        public static string DrugUnits(this InfusionDrug drug)
        {
            return Formulas.LogSiToString(drug.SiPrefix) + drug.SiUnitId.ToString();
        }
    }
}