using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs.DAL
{
    public class InfusionDrugNameRepository :IDisposable
    {
        private DataContext _db = new DataContext();
        public IEnumerable<InfusionDrug> GetInfusionDrugs()
        {
            return _db.InfusionDrugs.Include("SiUnit").Include("SiUnit").Include("DrugReferenceSource").Include("InfusionDiluent").Include("DrugRoute")
                .OrderBy(d=>d.Fullname)
                .ToList();
        }
        public void InsertInfusionDrug(InfusionDrug infusionDrug)
        {
            _db.InfusionDrugs.Add(infusionDrug);
            _db.SaveChanges();

        }
        public void UpdateInfusionDrug(InfusionDrug infusionDrug, InfusionDrug origInfusionDrug)
        {
            _db.InfusionDrugs.Attach(origInfusionDrug);
            var ent = _db.Entry(origInfusionDrug);
            ent.CurrentValues.SetValues(infusionDrug);
            ent.State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
        }
        public void DeleteInfusionDrug(InfusionDrug infusionDrug)
        {
            _db.Entry(infusionDrug).State = System.Data.Entity.EntityState.Deleted;
            _db.SaveChanges();
        }

        ~InfusionDrugNameRepository()
        {
            Dispose(false);
        }
        private bool disposedValue = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    if (_db!=null) _db.Dispose();
                }
                _db = null;
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