using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PICUdrugs.Utils;
namespace PICUdrugs.DAL 
{
    public interface IInfusionDilution
    {
        int InfusionDilutionId {get; set;}
        int InfusionDrugId {get; set;}
        int DilutionMethodId {get; set;}
        int SiPrefixVal {get; set;}
        double WeightMin {get; set;}
        double WeightMax {get; set;}
        int AgeMinMonths{get; set;}
        int AgeMaxMonths {get; set;}
        bool IsPerMin {get; set;}
        //int roundSigFigs {get; set;}
        string InfusionUnits { get; set; }
        string ReferencePage { get; set; }

        //ICollection<IInfusionConcentration> InfusionConcentrations {get;}
        InfusionDrug InfusionDrug { get; set; }
        DilutionMethod DilutionMethod { get; set; }
    }
    public interface IInfusionConcentration
    {
        int InfusionConcentrationId{get; set;}
        int InfusionDilutionId{get; set;}
        double Concentration {get; set;}

        //IInfusionDilution InfusionDilution {get;}
    }
    public static class InfusionDilutionExtensions
    {
        public static void SetDrugMeasure(this IInfusionDilution dil, string measure)//call this first to avoid query on DB if this.InfusionDrug.SiUnit.Measure not available;
        {
            dil.InfusionUnits = Formulas.LogSiToString(dil.SiPrefixVal) + measure;
        }
        public static string InfusionUnits(this IInfusionDilution dil)
        {
            if (dil.InfusionUnits == null)
            {
                try
                {
                    dil.InfusionUnits = Formulas.LogSiToString(dil.SiPrefixVal) + dil.InfusionDrug.SiUnit.Measure; //OK if lazy loading or include used in linq to entities
                }
                catch (ObjectDisposedException e)
                {
                    if (e != null)
                    {
                        throw new Exception("InfusionDrug.SiUnit.measure unavailable - either use include in linq statement, enable lazy loading or use setDrugMeasure Description");
                    }
                }
            }
            return dil.InfusionUnits;
        }
        public static string RateUnits(this IInfusionDilution dil)
        {
            DilutionMethod Description = dil.DilutionMethod;
            return dil.InfusionUnits() + (Description.IsPerKg ? "/kg/" : "/") + (dil.IsPerMin ? "min" : "hr");
        }
        public static string ConcentrationUnits(this IInfusionDilution dil)
        {
            DilutionMethod Description = dil.DilutionMethod;
            return dil.InfusionUnits() + (Description.IsVaryConcentration ? "/kg/" : "/") + (dil.IsPerMin ? "min" : "hr");
        }
        public static string VolumeUnits(this IInfusionDilution dil)
        {
            DilutionMethod Description = dil.DilutionMethod;
            return (Description.IsPerKg && Description.IsVaryVolume && !Description.IsVaryConcentration) ? "mL/kg" : "mL";         
        }
    }
    public partial class InfusionDrug
    {
        public string DrugUnits()
        {
            return Formulas.LogSiToString(SiPrefixVal) + this.SiUnit.Measure;
        }
    }
    public partial class DilutionMethod
    {
        public bool DrawUpPerKg
        {
            get
            {
                return (IsVaryConcentration ^ IsVaryVolume);
            }
        }
    }
}