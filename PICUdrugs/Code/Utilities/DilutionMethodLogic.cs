using DBToJSON.SqlEntities.Enums;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace PICUdrugs.DAL
{
    public class MethodLogic
    {
        public MethodLogic(bool isNeat, bool isVaryConcentration, bool isVaryVolume, bool isPerKg)
        {
            IsNeat = isNeat;
            IsVaryConcentration = isVaryConcentration;
            IsVaryVolume = isVaryVolume;
            IsPerKg = isPerKg;
        }
        public bool IsNeat { get; }
        public bool IsVaryConcentration { get; }
        public bool IsVaryVolume { get; }
        public bool IsPerKg { get; }
        public bool DrawUpPerKg
        {
            get
            {
                return (IsVaryConcentration ^ IsVaryVolume);
            }
        }
    }
    internal static class DilutionLogic
    {
        static DilutionLogic()
        {
            _allLogic = new ReadOnlyDictionary<DilutionMethod, MethodLogic>(
                new Dictionary<DilutionMethod, MethodLogic> {
                    [DilutionMethod.NeatFixedFlow]=                  new MethodLogic(true,  false, false, false),
                    [DilutionMethod.NeatVaryFlowByWeight]=           new MethodLogic(true,  false, false, true),
                    [DilutionMethod.FixedDilutionFixedFlow]=         new MethodLogic(false, false, false, false),
                    [DilutionMethod.FixedDilutionVaryFlowByWeight]=  new MethodLogic(false, false, false, true),
                    [DilutionMethod.VaryDilutionVolumeFixedFlow]=    new MethodLogic(false, true,  true,  true),
                    [DilutionMethod.VaryDrugFixedFlow]=              new MethodLogic(false, true,  false, true),
                    [DilutionMethod.VaryDrugDilutionVolFlowByWeight]=new MethodLogic(false, false, true,  true)
                });
        }
        public static MethodLogic GetMethod(DilutionMethod method) => _allLogic[method];
        internal static readonly ReadOnlyDictionary<DilutionMethod, MethodLogic> _allLogic;

        public static string AsDescription(DilutionMethod method)
        {
            if (method == DilutionMethod.VaryDrugDilutionVolFlowByWeight)
            {
                return "Vary Drug + Dilution Vol. + Flow by Weight";
            }
            else
            {
                string returnVar = Regex.Replace(method.ToString(), "([a-z])([A-Z])", "$1 $2");
                return returnVar.Replace(" Vary", ", Vary").Replace(" Fixed", ", Fixed");
            }
        }
    }
}
