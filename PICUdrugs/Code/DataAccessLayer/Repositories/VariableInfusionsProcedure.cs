//this code replaces the sql stored procedure pVariableTimeInfusions in order to run under sql compact (CE), which does not support stored procedures. 
//If moving up to sql server, would recomend this code be made obscolete for reason of computational efficiency and query optimisation, and call DataContext.pVariableTimeInfusions
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace PICUdrugs.DAL
{
    public class VariableInfusionRowData {
        public string Fullname {get; set;} 
        public string Abbrev {get; set;} 
        public int AmpulePrefix {get; set;} 
		public string Note {get; set;} 
        public string Measure {get; set;} 
        public string Category {get; set;} 
        public bool IsNeat {get; set;} 
        public bool IsVaryConcentration {get; set;} 
        public bool IsVaryVolume {get; set;} 
		public bool IsPerKg {get; set;}
        public int DilutionPrefix { get; set; }
        public int? Volume {get; set;}
		public double RateMin {get; set;} 
        public double RateMax {get; set;} 
		public bool IsPerMin {get; set;} 
        public double Concentration {get; set;}
        public string HrefBase { get; set; }
        public string HrefLink { get; set; }
    }
    public class pVariableTimeInfusions : IDisposable
    {
        private DataContext _db;
        public pVariableTimeInfusions():this(new DataContext())
        {
        }
        public pVariableTimeInfusions(DataContext db)
        {
            _db = db;
        }

        public IEnumerable<VariableInfusionRowData> GetRowData(int wardId, double weight, int ageMonths)
        {
            return (from c in _db.VariableTimeConcentrations
                    where c.VariableTimeDilution.WeightMin < weight && c.VariableTimeDilution.WeightMax >= weight
		                 && c.VariableTimeDilution.AgeMinMonths <= ageMonths && c.VariableTimeDilution.AgeMaxMonths >= ageMonths
                         && c.VariableTimeDilution.InfusionDrug.InfusionSortOrderings.Any(s=>s.WardId == wardId)
	                orderby c.VariableTimeDilution.InfusionDrug.InfusionSortOrderings.FirstOrDefault().SortOrder, c.DoseCat.SortOrder
                    select new VariableInfusionRowData
                    {
                        Fullname = c.VariableTimeDilution.InfusionDrug.Fullname,
                        Abbrev = c.VariableTimeDilution.InfusionDrug.Abbrev,
                        AmpulePrefix = c.VariableTimeDilution.InfusionDrug.SiPrefixVal, 
		                Note = c.VariableTimeDilution.InfusionDrug.Note, 
                        Measure = c.VariableTimeDilution.InfusionDrug.SiUnit.Measure, 
                        Category = c.DoseCat.Category, 
                        IsNeat = c.VariableTimeDilution.DilutionMethod.IsNeat, 
                        IsVaryConcentration = c.VariableTimeDilution.DilutionMethod.IsVaryConcentration, 
                        IsVaryVolume = c.VariableTimeDilution.DilutionMethod.IsVaryVolume, 
		                IsPerKg = c.VariableTimeDilution.DilutionMethod.IsPerKg,
                        DilutionPrefix = c.VariableTimeDilution.SiPrefixVal,
                        Volume = c.VariableTimeDilution.Volume,
		                RateMin = c.VariableTimeDilution.RateMin , 
                        RateMax = c.VariableTimeDilution.RateMax, 
		                IsPerMin = c.VariableTimeDilution.IsPerMin, 
                        Concentration = c.Concentration,
                        HrefBase = c.VariableTimeDilution.InfusionDrug.DrugReferenceSource.Hyperlink,
                        HrefLink = c.VariableTimeDilution.ReferencePage
                    }).ToList();
        }

        private bool disposedValue = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    _db.Dispose();
                }
            }
            this.disposedValue = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}