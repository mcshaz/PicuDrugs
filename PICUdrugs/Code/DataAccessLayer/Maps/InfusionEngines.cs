using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PICUdrugs.Utils;
using PICUdrugs.DAL;
namespace PICUdrugs.Utils
{
    public static partial class UserSelectedInfusion
    {
        [Serializable]
        public class AmpuleDetail
        {
            public double Concentration { get; set; }
            public double Volume { get; set; }
        }
        [Serializable]
        public class SingleInfusion
        {
            public int DrugId { get; set; }
            public string DrugName { get; set; }
            public string Units { get; set; }
            public IEnumerable<AmpuleDetail> AvailableAmpules { get; set; }
        }
        [Serializable]
        public class SelectedInfusion
        {
            public int DrugId { get; set; }
            public double AmpuleConc { get; set; }
        }
        public static SingleInfusion[] GetSingleInfusions()
        {
            using (DataContext db = new DataContext())
            {
                return (from drug in db.InfusionDrugs.Include("DrugAmpuleConcentrations").Include("SiUnit")
                          where db.FixedTimeDilutions.Any(dil => dil.InfusionDrugId == drug.InfusionDrugId)
                                && drug.DrugAmpuleConcentrations.Any()
                          select drug).ToArray() //converting toArray so that static methods (drugUnits) do not confuse linq to entities
                                      .Select(d => new SingleInfusion
                                        { 
                                            DrugId = d.InfusionDrugId, 
                                            DrugName = d.Fullname, 
                                            Units=d.DrugUnits(),
                                            AvailableAmpules=d.DrugAmpuleConcentrations.Select(a=> new AmpuleDetail{
                                                Concentration=a.Concentration,
                                                Volume=a.Volume.Value
                                            })
                                        }).ToArray();
            }
        }
        public static SingleInfusion GetSingleInfusion(string infusionName)
        {
            InfusionDrug drug;
            using (DataContext db = new DataContext())
            {
                drug = (from d in db.InfusionDrugs.Include("DrugAmpuleConcentrations").Include("SiUnit")
                        where d.Fullname == infusionName || d.Abbrev == infusionName
                              && d.DrugAmpuleConcentrations.Any()
                        select d).FirstOrDefault();
            }
            if (drug == null) { return null; }
            return new SingleInfusion
            {
                DrugId = drug.InfusionDrugId,
                DrugName = drug.Fullname,
                Units = drug.DrugUnits(),
                AvailableAmpules = drug.DrugAmpuleConcentrations.Select(a => new AmpuleDetail
                {
                    Concentration = a.Concentration,
                    Volume = a.Volume.Value
                })
            };
        }
        public static AmpuleDetail[] AmpConc(int drugId)
        {
            using (DataContext myEntities = new DataContext())
            {
                //to do - if neat, only one concentration appropriate
                var concentrations = (from conc in myEntities.DrugAmpuleConcentrations.Include("InfusionDrug").Include("InfusionDrug.SiUnit")
                                      where conc.InfusionDrugId == drugId
                                      select conc).ToList();
                return concentrations.Select(c => new AmpuleDetail() 
                        {   Concentration=c.Concentration, 
                            Volume=(c.Volume.HasValue)?c.Volume.Value:0,
                        }).ToArray();
            }
        }
    }
}
namespace PICUdrugs.DAL
{
    public abstract class DrugInfusion
    {
        internal const int closeTo1 = 3; //number of decimal places, 3 = 1.001
        protected DrugInfusion(
                    double weight,
                    double concentration,
                    double? Volume,
                    int infusionPrefix,
                    int ampPrefix,
                    string unitMeasure,
                    bool isPerKg,
                    bool isPerMin,
                    bool isVaryConcentration,
                    bool isVaryVolume,
                    bool neat,
                    int minsDuration=0,
                    double doseRate = 0)
        {
            if (weight < FieldConst.minWeight || weight > FieldConst.maxWeight)
            {
                throw new Exception(FieldConst.wtErr);
            }
            double ampConvFact = Math.Pow(10, infusionPrefix - ampPrefix);
            _isNeat = neat;
            if (isVaryConcentration)
            {
                double dilVol;
                double workingWt;
                if (isVaryVolume)
                {
                    workingWt = Math.Truncate(weight / 2) * 2; //this decrease in acuracy to round to the weight to the nearest even integer is so that the volumes follow the PICU chart
                    dilVol = Formulas.DilutionVolumeMls(workingWt);
                }
                else
                {
                    workingWt = weight;
                    dilVol = Volume.Value;
                }
                DrawingUpDose = concentration * dilVol * workingWt * (isPerMin ? 60 : 1) * ampConvFact;
                FinalConcentration = concentration;
                DilutionVolume = Math.Round(dilVol);
            }
            else
            {
                if (isVaryVolume)
                {
                    //vary Volume && !vary Concentration = Volume in mL per kg
                    DilutionVolume = Volume.Value * weight;
                    DrawingUpDose = concentration * (isPerMin ? 60 : 1) * DilutionVolume;
                    FinalConcentration = concentration/weight;
                }
                else
                {
                    //must be neat or a fixed Concentration
                    FinalConcentration = (isPerKg ? (concentration / weight) : concentration);
                    if (Volume.HasValue)
                    {
                        DilutionVolume = Volume.Value;
                        DrawingUpDose = DilutionVolume * concentration * ampConvFact * (isPerMin ? 60 : 1);
                    }
                    else if (minsDuration != 0 && doseRate != 0)
                    {
                        //??final concentration rather than concentration
                        DrawingUpDose = doseRate * ampConvFact * minsDuration * (isPerKg ? weight : 1) / (isPerMin ? 1 : 60);
                        DilutionVolume = DrawingUpDose / (concentration*ampConvFact);
                    }
                    else
                    {
                        throw new Exception("either a volume or a duration and dose must be supplied");
                    }
                }
            }
            bool pleuralise;
            DrawingUpUnits = Formulas.UnitString(ampPrefix, unitMeasure, out pleuralise);
            if (pleuralise && Math.Round(DrawingUpDose, closeTo1) != 1) { DrawingUpUnits += "s"; }
            _infusionUnits = Formulas.UnitString(infusionPrefix, unitMeasure, out _pleuraliseInfusionUnits);
            _perKg = (isPerKg ? "/kg" : "");
            FinalConcentrationUnits = GetRateUnits(FinalConcentration) + (isPerMin ? "/min" : "/hr");
            _isPerMin = isPerMin;
        }
        public double DrawingUpDose { get; private set; }
        public string DrawingUpUnits { get; private set; }
        protected bool _isPerMin;
        protected bool _isNeat;
        public string DilutionString
        {
            get
            {
                if (_isNeat) return "neat, total";
                return "diluted to";
            }
        }
        public double DilutionVolume { get; private set; }
        public double FinalConcentration { get; private set; }
        public string FinalConcentrationUnits { get; private set; }
        protected readonly string _perKg;
        private string _infusionUnits;
        private bool _pleuraliseInfusionUnits;
        protected string GetRateUnits(double value)
        {
            if (_pleuraliseInfusionUnits && Math.Round(value, closeTo1) != 1)
            {
                return _infusionUnits + "s" + _perKg;
            }
            else
            {
                return _infusionUnits + _perKg;
            }
        }
        public double AmpuleConcentration { get; set; }

        public double? diluentVolume
        {
            get
            {
                if (AmpuleConcentration == 0) return null;
                return DilutionVolume - ampuleVolume.Value;
            }
        }
        public double? ampuleVolume
        {
            get
            {
                if (AmpuleConcentration == 0) return null;
                return DrawingUpDose / AmpuleConcentration;
            }
        }
        public string DiluentFluid { get; set; }
        public string ToDilutionString(string drugName = "")
        {
            if (AmpuleConcentration == 0)
                return "";
            string outputDrug = drugName == "" ? " " : " " + drugName + " ";
            if (DiluentFluid == "")
                return string.Format("dilute {0}mL of {1} ({2}{3}/mL) in {4}mL (total Volume of solution {5})",
                                        ampuleVolume,
                                        outputDrug,
                                        AmpuleConcentration,
                                        DrawingUpUnits,
                                        diluentVolume,
                                        DilutionVolume);
            return string.Format("dilute {0}mL of {1} ({2}{3}/mL) in {4}mL of {5} (total Volume of solution {6})",
                    ampuleVolume,
                    outputDrug,
                    AmpuleConcentration,
                    DrawingUpUnits,
                    diluentVolume,
                    DiluentFluid,
                    DilutionVolume);
        }
    }
    public class StandardInfusion : DrugInfusion
    {
        public StandardInfusion(double weight,
                    double Concentration,
                    int? Volume,
                    int InfusionPrefix,
                    int ampPrefix,
                    string unitMeasure,
                    bool IsPerKg,
                    bool IsPerMin,
                    bool IsVaryConcentration,
                    bool IsVaryVolume,
                    bool neat,
                    double minDoseRate,
                    double maxDoseRate):
            base(weight, Concentration, Volume, InfusionPrefix, ampPrefix,
                unitMeasure, IsPerKg, IsPerMin, IsVaryConcentration, IsVaryVolume, neat)
        {
            DoseRate = new NumericRange
            {
                LowerBound = minDoseRate,
                UpperBound = maxDoseRate
            };
            RateUnits = GetRateUnits(maxDoseRate) + (_isPerMin ? "/min" : "/hr");
            FlowRate = new NumericRange
            {
                LowerBound = minDoseRate / FinalConcentration,
                UpperBound = maxDoseRate / FinalConcentration
            };
        }
        public string DrugName { get; internal set;}
        public string RateUnits { get; private set; }
        public NumericRange DoseRate { get; private set; }
        public string Note { get; internal set;}
        public int DrugId { get; internal set; }
        public NumericRange FlowRate { get; private set; }
        public string SubHeader{get; internal set;}
        public string Href { get; set; }
    }
    public enum BolusListItemType { Header, DosePerKg, FixedDose}
    public class BolusDrugListItem
    {
        public BolusListItemType ItemType { get; set; }
        public string RowTitle { get; set; }
        public double? Conc_ml { get; set; }
        private string _doseUnits;
        public string DoseUnits 
        { 
            get 
            {
                return (DosePerKg!=null && DosePerKg.UpperBound == 1) ? _doseUnits.Singularise() : _doseUnits; 
            } 
            set { _doseUnits = value; } 
        }
        public string MaxDoseUnits
        {
            get { return (AdultMax == 1) ? _doseUnits.Singularise() : _doseUnits; }
        }
        public const string DefaultAdministrationUnits = "mL";
        public const string EnergyUnits = "J";
        public string AdministrationUnits
        {
            get
            {
                if (DoseUnits == EnergyUnits) { return DoseUnits; }
                if (DoseUnits.Length >= 5 && DoseUnits.Substring(0, 5).ToLower() == "joule") { return DoseUnits; };
                return DefaultAdministrationUnits;
            }
        }
        public double AdultMax { get; set; }
        public double Min { get; set; }
        public NumericRange DosePerKg { get; set; }
        public NumericRange BolusDose { get; private set; }
        public NumericRange BolusVolume { get; private set; }
        public void SetWeight(double weight, int[] roundingList = null)
        {
            if (DosePerKg == null) { throw new Exception("DosePerKg must be set before calling this Description"); }
            if (Conc_ml == 0) { throw new Exception("Conc_ml must be set before calling this Description"); }

            double lb = weight * DosePerKg.LowerBound;
            if (lb > AdultMax) { lb = AdultMax; }
            else if (lb < Min) { lb = Min; }

            BolusDose = new NumericRange();

            if (roundingList != null) { BolusDose.LowerBound = Formulas.ClosestValue(lb, roundingList); }
            else { BolusDose.LowerBound = lb; }

            double ub = weight * DosePerKg.UpperBound;
            if (ub > AdultMax) { ub = AdultMax; }
            else if (ub < Min) { ub = Min; }
            if (roundingList != null)
            {
                if (ub == lb)
                {
                    BolusDose.UpperBound = BolusDose.LowerBound;
                }
                else
                {
                    BolusDose.UpperBound = Formulas.ClosestValue(ub, roundingList);
                }
            }
            else
            {
                BolusDose.UpperBound = ub;
            }
            if (Conc_ml.HasValue)
            {
                BolusVolume = new NumericRange();
                BolusVolume.LowerBound = BolusDose.LowerBound / Conc_ml.Value;
                BolusVolume.UpperBound = BolusDose.UpperBound / Conc_ml.Value;
            }
        }
    }
    public class FixedDurationInfusion : DrugInfusion
    {
        public FixedDurationInfusion(double weight,
                    double concentration,
                    int? volume,
                    int infusionPrefix,
                    int ampPrefix,
                    string unitMeasure,
                    bool isPerKg,
                    bool isPerMin,
                    bool isVaryConcentration,
                    bool isVaryVolume,
                    bool isNeat,
                    double doseRate,
                    int minsDuration,
                    double ampConcentration)
               :base(weight, 
                concentration, 
                volume,
                //if isPerKg && !(isVarConcentration || isVaryVolume) - work out volume = (amount administered = weight*finaldose) / concentration 
                //conc = 1ml/hr = x units/(kg)/mh
                //if 
                infusionPrefix, 
                ampPrefix,
                unitMeasure, 
                isPerKg, 
                isPerMin, 
                isVaryConcentration, 
                isVaryVolume, 
                isNeat,
                minsDuration,
                doseRate)
        {
            if (doseRate > FieldConst.maxRate || doseRate < FieldConst.minRate) throw new Exception(FieldConst.rateErr);
            _doseRate = doseRate;
            _flowRate = doseRate/FinalConcentration;
            _unitsPerMin = (_doseRate*Math.Pow(10,infusionPrefix))/ (isPerMin?1:60);
            _unitMeasure = unitMeasure + (isPerKg?"/kg":"");

            if (minsDuration > FieldConst.maxStop || minsDuration < FieldConst.minStop) throw new Exception(FieldConst.stopErr);
            MinsDuration = minsDuration;
            var dose = MinsDuration * _unitsPerMin;
            double zeros = Math.Log10(dose);
            int siPrefix;
            if (zeros < 0)
            {
                siPrefix = ((int)zeros / 3 - 1) * 3; //note doble to int = Math.Truncate
                dose *= Math.Pow(10, -siPrefix);
            }
            else
            {
                siPrefix = 0;  //not usually talking kilograms or kilounits
            }
            _doseTotal = dose;
            bool pleuraliseTotalUits;
            _doseTotalUnits = Formulas.UnitString(siPrefix, unitMeasure, out pleuraliseTotalUits);
            _doseTotalUnits += pleuraliseTotalUits?"s":string.Empty + _perKg;

        }
        private double _unitsPerMin;
        private string _unitMeasure;
        private double _doseTotal;
        public double DoseTotal { get { return _doseTotal; } }
        private string _doseTotalUnits;
        public string DoseTotalUnits
        {
            get
            {
                return _doseTotalUnits;
            }
        }

        private double _flowRate;
        public double FlowRate { get { return _flowRate; } }
        public int MinsDuration { get; private set; }
        public string DurationStr
        {
            get { return Formulas.MinsToString(MinsDuration); }
        }
        private int _startTime;
        public string StartTimeStr(bool asProse = true)
        {
            return TimeStr(_startTime, asProse);
        }
        public string StopTimeStr(bool asProse = true)
        {
            return TimeStr(_startTime + MinsDuration, asProse);
        }
        private string TimeStr(int mins, bool asProse)
        {
            if (asProse)
            {
                return Formulas.MinsToString(mins);
            }
            return Formulas.MinsToString(mins, "{0}", ":", "{0:00}", false, false);
        }
        public int StartTime
        {
            set
            {
                if (value > FieldConst.maxStop || value < 0) throw new Exception("duration of Infusion out limits");
                _startTime = value;
            }
        }
        private double _doseRate;
        public double DoseRate
        {
            get { return _doseRate; }
        }
    }
}
