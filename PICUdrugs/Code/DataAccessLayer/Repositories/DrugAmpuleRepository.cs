using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PICUdrugs.Utils;
namespace PICUdrugs.DAL
{
    public class DrugAmpuleRepository : IDisposable
    {
        private DataContext _db = new DataContext();
        public IEnumerable<DrugAmpuleConcentration> GetAmpules(int drugId)
        {
            return (from d in _db.DrugAmpuleConcentrations  //.Include(".DoseCat")
                    where d.InfusionDrugId == drugId
                    select d).ToList();
        }
        public IEnumerable<DrugAmpuleConcentration> GetAmpules()
        {
            return (from d in _db.DrugAmpuleConcentrations  //.Include(".DoseCat")
                    select d).ToList();
        }
        public void InsertAmpule(DrugAmpuleConcentration drugAmp)
        {
            try
            {
                _db.DrugAmpuleConcentrations.Add(drugAmp);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteAmpule(DrugAmpuleConcentration drugAmp)
        {
            try
            {
                _db.DrugAmpuleConcentrations.Attach(drugAmp);
                _db.DrugAmpuleConcentrations.Remove(drugAmp);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateAmpule(DrugAmpuleConcentration drugAmp, DrugAmpuleConcentration origDrugAmp)
        {
            try
            {
                _db.DrugAmpuleConcentrations.Attach(origDrugAmp);
                var ent = _db.Entry(origDrugAmp);
                ent.CurrentValues.SetValues(drugAmp);
                ent.State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        //disposing
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