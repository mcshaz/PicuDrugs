using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs.DAL
{
    public class InfusionRepository : IDisposable, IInfusionRepository
    {
        private DataContext _db = new DataContext();

        public IEnumerable<VariableTimeDilution> GetVariableTimeDilutions(int drugId)
        {
            return (from i in _db.VariableTimeDilutions.Include("DilutionMethod")  //.Include(".DoseCat")
                    where i.InfusionDrugId == drugId
                    orderby i.AgeMinMonths, i.WeightMin
                    select i).ToList();
        }
        public IEnumerable<FixedTimeDilution> GetFixedTimeDilutions(int drugId)
        {
            return (from i in _db.FixedTimeDilutions.Include("DilutionMethod") // now being handled in query string ->.Include("InfusionDrug.SiUnit")
                    where i.InfusionDrugId == drugId
                    orderby i.AgeMinMonths, i.WeightMin
                    select i).ToList();
        }
        public FixedTimeDilution GetFixedTimeDilution(int dilutionId)
        {
            return _db.FixedTimeDilutions.Where(d => d.InfusionDilutionId == dilutionId).FirstOrDefault();
        }
        public DrugReferenceSource GetDrugReference(int DrugId)
        {
            return (from d in _db.InfusionDrugs
                    where d.InfusionDrugId == DrugId
                    select d.DrugReferenceSource).FirstOrDefault();
        }
        public IEnumerable<VariableTimeConcentration> GetVariableTimeConcentrations(int DilutionId, bool NoTracking = false)
        {
            if (NoTracking)
            {
                return (from i in _db.VariableTimeConcentrations.Include("DoseCat").AsNoTracking()
                        where i.InfusionDilutionId == DilutionId
                        orderby i.DoseCat.SortOrder
                        select i).ToList();
            }
            else
            {
                return (from i in _db.VariableTimeConcentrations.Include("DoseCat")
                        where i.InfusionDilutionId == DilutionId
                        orderby i.DoseCat.SortOrder
                        select i).ToList();
            }
        }
        public IEnumerable<FixedTimeConcentration> GetFixedTimeConcentrations(int DilutionId)
        {
            return (from l in _db.FixedTimeConcentrations
                    where l.InfusionDilutionId == DilutionId
                    orderby l.StopMinutes
                    select l).ToList();
        }

        public IEnumerable<VariableTimeDilution> GetDilutionsByOverlappingAgeWeight(VariableTimeDilution infDil)
        {
            return (from i in _db.VariableTimeDilutions.AsNoTracking().Include("InfusionDrug")
                    where i.InfusionDrugId==infDil.InfusionDrugId && i.InfusionDilutionId!=infDil.InfusionDilutionId &&
                        i.AgeMaxMonths >= infDil.AgeMinMonths && i.AgeMinMonths <= infDil.AgeMaxMonths && 
                        i.WeightMax > infDil.WeightMin && i.WeightMin < infDil.WeightMax
                    select i).ToList();
        }
        public IEnumerable<FixedTimeDilution> GetDilutionsByOverlappingAgeWeight(FixedTimeDilution infDil)
        {
            return (from i in _db.FixedTimeDilutions.AsNoTracking().Include("InfusionDrug")
                    where  i.InfusionDrugId == infDil.InfusionDrugId && i.InfusionDilutionId != infDil.InfusionDilutionId &&
                           i.AgeMaxMonths >= infDil.AgeMinMonths && i.AgeMinMonths <= infDil.AgeMaxMonths &&
                           i.WeightMax > infDil.WeightMin && i.WeightMin < infDil.WeightMax
                    select i).ToList();
        }

        public void InsertDilution(FixedTimeDilution infDil)
        {
            try
            {
                _db.FixedTimeDilutions.Add(infDil);
                _db.SaveChanges();
            }
            catch(Exception)
            {
                throw;
            }
        }
        public void InsertDilution(VariableTimeDilution infDil)
        {
            try
            {

                _db.VariableTimeDilutions.Add(infDil);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void DeleteDilution(FixedTimeDilution infDil)
        {
            try
            {
                _db.FixedTimeDilutions.Attach(infDil);
                _db.FixedTimeDilutions.Remove(infDil);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteDilution(VariableTimeDilution infDil)
        {
            try
            {
                _db.VariableTimeDilutions.Attach(infDil);
                _db.VariableTimeDilutions.Remove(infDil);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void UpdateDilution(FixedTimeDilution infDil, FixedTimeDilution origInfDil)
        {
            try
            {
                _db.FixedTimeDilutions.Attach(origInfDil);
                var ent = _db.Entry(origInfDil);
                ent.CurrentValues.SetValues(infDil);
                ent.State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateDilution(VariableTimeDilution infDil, VariableTimeDilution origInfDil)
        {
            try
            {
                _db.VariableTimeDilutions.Attach(origInfDil);
                var ent = _db.Entry(origInfDil);
                ent.CurrentValues.SetValues(infDil);
                ent.State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void InsertConcentration(FixedTimeConcentration infConc)
        {
            try
            {
                _db.FixedTimeConcentrations.Add(infConc);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void InsertConcentration(VariableTimeConcentration infConc)
        {
            try
            {
                _db.VariableTimeConcentrations.Add(infConc);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void DeleteConcentration(FixedTimeConcentration infConc)
        {
            try
            {
                _db.FixedTimeConcentrations.Attach(infConc);
                _db.FixedTimeConcentrations.Remove(infConc);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteConcentration(VariableTimeConcentration infConc)
        {
            try
            {
                _db.VariableTimeConcentrations.Attach(infConc);
                _db.VariableTimeConcentrations.Remove(infConc);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void UpdateConcentration(FixedTimeConcentration InfConc, FixedTimeConcentration origInfConc)
        {
            try
            {
                    _db.FixedTimeConcentrations.Attach(origInfConc);
                    var ent = _db.Entry(origInfConc);
                ent.CurrentValues.SetValues(InfConc);
                ent.State = System.Data.Entity.EntityState.Modified;
                    _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateConcentration(VariableTimeConcentration infConc, VariableTimeConcentration origInfConc)
        {
            try
            {
                _db.VariableTimeConcentrations.Attach(origInfConc);
                var ent = _db.Entry(origInfConc);
                ent.CurrentValues.SetValues(infConc);
                ent.State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        
        public IEnumerable<FixedTimeConcentration> GetFixedTimeConcentrationsByStopTime(int DilutionId, int totalMinutes)
        {
            return (from c in _db.FixedTimeConcentrations.AsNoTracking()
                    where c.InfusionDilutionId == DilutionId && c.StopMinutes == totalMinutes
                    select c).ToList();
        }
        
        public IEnumerable<DoseCat> GetDoseCats()
        {
            return _db.DoseCats.OrderBy(d=>d.SortOrder).ToList();
        }
        public DoseCat GetDoseCatById(int? DoseCatId)
        {
            if (!DoseCatId.HasValue) return null;
            return (from d in _db.DoseCats
                    where d.DoseCatId == DoseCatId.Value
                    select d).First();
        }
        public IEnumerable<DilutionMethod> GetDilutionMethods()
        {
            return _db.DilutionMethods.ToList();
        }
        public DilutionMethod GetDilutionMethod(int dilutionMethodId)
        {
            return _db.DilutionMethods.Where(d=>d.DilutionMethodId == dilutionMethodId).FirstOrDefault();
        }

        //disposing
        private bool disposedValue = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    _db.Dispose();
                }
            }
            disposedValue = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}