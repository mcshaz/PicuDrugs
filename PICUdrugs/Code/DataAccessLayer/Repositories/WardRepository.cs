using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs.DAL
{
    public class WardRepository : IDisposable
    {
        private DataContext _db = new DataContext();
        public IEnumerable<Ward> GetDepartments()
        {
            return _db.Wards.ToList();
        }
        public int[] GetDepartmentIds()
        {
            return _db.Wards.Select(w=>w.WardId).ToArray();
        }
        public IDictionary<int, string> GetDepartmentNames()
        {
            return (from w in _db.Wards
                    select new { id = w.WardId, name = w.Fullname }).ToDictionary(key => key.id, value => value.name);
        }
        public void InsertDepartment(Ward dpt)
        {
            try
            {
                _db.Wards.Add(dpt);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateDepartment(Ward Dpt, Ward origDpt)
        {
            try
            {
                _db.Wards.Attach(origDpt);
                var ent = _db.Entry(origDpt);
                ent.CurrentValues.SetValues(Dpt);
                ent.State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteDepartment(Ward dpt)
        {
            try
            {
                _db.Wards.Attach(dpt);
                _db.Wards.Remove(dpt);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Ward GetDptByWardId(int WardId)
        {
            try
            {
                return (from w in _db.Wards
                        .Include("defibModel")
                        where w.WardId == WardId
                        select w).First();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public IEnumerable<Ward> GetDuplicateDpt(Ward dpt)
        {
            try
            {
                return (from w in _db.Wards
                        where w.WardId != dpt.WardId && (w.Fullname == dpt.Fullname || w.Abbrev==dpt.Abbrev)
                        select w).ToList();
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