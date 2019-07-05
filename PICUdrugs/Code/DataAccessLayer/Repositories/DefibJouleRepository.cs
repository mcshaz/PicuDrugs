using DBToJSON;
using DBToJSON.SqlEntities.BolusDrugs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs.DAL
{
    public class DefibJouleRepository : IDisposable
    {
        private DrugSqlContext _db = new DrugSqlContext();
        public IEnumerable<DefibJoule> GetDefibJoules()
        {
            return _db.DefibJoules.ToList();
        }
        public void InsertDefibJoule(DefibJoule defibJ)
        {
            try
            {
                _db.DefibJoules.Add(defibJ);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateDefibJoule(DefibJoule DefibJ, DefibJoule origDefibJ)
        {
            try
            {
                _db.DefibJoules.Attach(origDefibJ);
                var ent = _db.Entry(origDefibJ);
                ent.CurrentValues.SetValues(DefibJ);
                ent.State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteDefibJoule(DefibJoule defibJ)
        {
            try
            {
                _db.DefibJoules.Attach(defibJ);
                _db.DefibJoules.Remove(defibJ);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public IEnumerable<DefibJoule> GetDefibJoulesByModel(int modelId)
        {
            try
            {
                return (from m in _db.DefibModels
                        where m.Id== modelId
                        select m.DefibJoules).FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public IEnumerable<DefibJoule> GetDuplicateDefibJoules(DefibJoule defibJ)
        {
            try
            {
                return (from j in _db.DefibJoules
                        where j.Id != defibJ.Id && j.DefibId==defibJ.DefibId && j.Joules == defibJ.Joules
                        select j).ToList();
            }
            catch (Exception)
            {
                throw;
            }
        }
        ~DefibJouleRepository()
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
                    if (_db!=null) _db.Dispose();
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