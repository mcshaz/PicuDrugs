using DBToJSON;
using DBToJSON.SqlEntities.BolusDrugs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs.DAL
{
    public class DefibRepository : IDisposable
    {
        private DrugSqlContext _db = new DrugSqlContext();
        public IEnumerable<DefibModel> GetDefibs()
        {
            return _db.DefibModels.ToList();
        }
        public void InsertDefib(DefibModel defib)
        {
            try
            {
                _db.DefibModels.Add(defib);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateDefib(DefibModel defib, DefibModel origDefib)
        {
            try
            {
                _db.DefibModels.Attach(origDefib);
                var ent = _db.Entry(origDefib);
                ent.CurrentValues.SetValues(defib);
                ent.State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteDefib(DefibModel defib)
        {
            try
            {
                _db.DefibModels.Attach(defib);
                _db.DefibModels.Remove(defib);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public DefibModel GetDefibModelById(int defibId)
        {
            try
            {
                return (from m in _db.DefibModels
                        where m.Id== defibId
                        select m).FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public IEnumerable<DefibModel> GetDuplicateDefibs(DefibModel defib)
        {
            try
            {
                return (from d in _db.DefibModels
                        where d.Id != defib.Id && d.Name==defib.Name
                        select d).ToList();
            }
            catch (Exception)
            {
                throw;
            }
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