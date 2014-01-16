using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace PICUdrugs.DAL
{
    public class BolusRepository : IDisposable, IBolusRepository
    {
        private DataContext _db = new DataContext();
        public IEnumerable<BolusDrug> GetBolusDrugs()
        {
            return (from d in _db.BolusDrugs.Include("BolusDoses")
                    select d).ToList();
        }
        public void InsertBolusDrug(BolusDrug drug)
        {
            try
            {
                _db.BolusDrugs.Add(drug);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteBolusDrug(BolusDrug drug)
        {
            try
            {
                _db.BolusDrugs.Attach(drug);
                _db.BolusDrugs.Remove(drug);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateBolusDrug(BolusDrug Drug, BolusDrug origDrug)
        {
            try
            {
                _db.BolusDrugs.Attach(origDrug);
                var ent = _db.Entry(origDrug);
                ent.CurrentValues.SetValues(Drug);
                ent.State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public IEnumerable<BolusDose> GetBolusDoses()
        {
            return (from d in _db.BolusDoses 
                    select d).ToList();
        }
        public IEnumerable<BolusDrug> GetDrugsByNameRoute(BolusDrug drug)
        {
            string lName = drug.DrugName.ToLower();
            string lRoute = (drug.Route==null)?null:drug.Route.ToLower();
            return (from d in _db.BolusDrugs.AsNoTracking()
                    where d.BolusDrugId != drug.BolusDrugId &&
                          d.DrugName.ToLower() == lName && d.Route.ToLower() == lRoute
                    select d).ToList();
        }
        public IEnumerable<BolusDose> GetDosesByOverlappingWeight(BolusDose dose)
        {
            return (from d in _db.BolusDoses.AsNoTracking()
                    where d.BolusDrugId == dose.BolusDrugId && d.BolusDoseId != dose.BolusDoseId &&
                          d.WeightMax > dose.WeightMin && d.WeightMin < dose.WeightMax
                    select d).ToList();
        }
        public IEnumerable<BolusDose> GetBolusDoses(int drugId)
        {
            return (from d in _db.BolusDoses.Include("BolusDrug")
                    where d.BolusDrugId==drugId
                    select d).ToList();
        }
        public void InsertBolusDose(BolusDose dose)
        {
            try
            {
                _db.BolusDoses.Add(dose);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteBolusDose(BolusDose dose)
        {
            try
            {
                _db.BolusDoses.Attach(dose);
                _db.BolusDoses.Remove(dose);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateBolusDose(BolusDose Dose, BolusDose origDose)
        {
            try
            {
                _db.BolusDoses.Attach(origDose);
                var ent = _db.Entry(origDose);
                ent.CurrentValues.SetValues(Dose);
                ent.State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        //disposing
        ~BolusRepository()
        {
            Dispose(false);
        }
        private bool disposedValue = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    if (_db != null) _db.Dispose();
                }
                _db = null;
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