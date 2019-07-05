using DBToJSON;
using DBToJSON.SqlEntities.Infusions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace PICUdrugs.DAL
{
    public class DrugReferenceRepository : IDisposable
    {
        private DrugSqlContext _db = new DrugSqlContext();
        public DrugReferenceSource GetReference(int refId)
        {
            return (from d in _db.DrugReferenceSources 
                    where d.DrugReferenceId == refId
                    select d).FirstOrDefault();
        }
        public IEnumerable<DrugReferenceSource> GetReferences()
        {
            return (from d in _db.DrugReferenceSources  
                    select d).ToList();
        }
        public void InsertReference(DrugReferenceSource drugRef)
        {
            try
            {
                _db.DrugReferenceSources.Add(drugRef);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteReference(DrugReferenceSource drugRef)
        {
            try
            {
                _db.DrugReferenceSources.Attach(drugRef);
                _db.DrugReferenceSources.Remove(drugRef);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateReference(DrugReferenceSource drugRef)
        {
            try
            {
                _db.DrugReferenceSources.Attach(drugRef);
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