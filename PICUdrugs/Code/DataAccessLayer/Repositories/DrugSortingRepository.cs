using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PICUdrugs.DAL
{
    public class InfusionSortingRepository : IDisposable
    {
        private DataContext _db = new DataContext();
        public IEnumerable<InfusionDrug> GetInfDrugsAndOrders()
        {
            return (from d in _db.InfusionDrugs.Include("InfusionSortOrderings").Include("SpecificWard")
                    where d.IsTitratable==true
                    select d).ToList();
        }
        public void InsertSortOrder(InfusionSortOrdering infSort)
        {
            try
            {
                _db.InfusionSortOrderings.Add(infSort);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void InsertSortOrder(int WardId, int[] InfusionIDs)
        {
            try
            {
                for (int i = 0; i < InfusionIDs.Length; i++)
                {
                     _db.InfusionSortOrderings.Add(new InfusionSortOrdering(){WardId = WardId,
                                                                                        SortOrder = i + 1,
                                                                                        InfusionDrugId = InfusionIDs[i]});
                }
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool AnySortOrder(int wardId)
        {
            return _db.InfusionSortOrderings.Any(i => i.WardId == wardId);
        }
        public void CloneWard(int fromWardId, int toWardId)
        {
            var fromParam = new SqlParameter("@fromWardId",fromWardId);
            var toParam = new SqlParameter("@toWardId", toWardId);
            _db.Database.ExecuteSqlCommand(
                @"INSERT INTO [PicuDrugData].[dbo].[InfusionSortOrdering]
                    ([WardId]
                    ,[InfusionDrugId]
                    ,[SortOrder])
                SELECT @toWardId
                    ,[InfusionDrugId]
                    ,[SortOrder]
                FROM [PicuDrugData].[dbo].[InfusionSortOrdering]
                WHERE [WardId]=@fromWardId", toParam, fromParam);
        }
        public int[] GetWardsWithoutInfusions()
        {
            return (from w in _db.Wards
                    where !w.InfusionSortOrderings.Any()
                    select w.WardId).ToArray();
        }
        public void DeleteSortOrder(InfusionSortOrdering infSort)
        {
            try
            {
                _db.InfusionSortOrderings.Attach(infSort);
                _db.InfusionSortOrderings.Remove(infSort);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteSortOrder(int WardId)
        {
            try
            {
                _db.Database.ExecuteSqlCommand("Delete FROM InfusionSortOrdering WHERE WardId={0}",WardId.ToString());
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateSortOrder(InfusionSortOrdering infSort, InfusionSortOrdering originfSort)
        {
            try
            {
                _db.InfusionSortOrderings.Attach(originfSort);
                var ent = _db.Entry(originfSort);
                ent.CurrentValues.SetValues(infSort);
                ent.State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
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
    public class BolusSortingRepository : IDisposable
    {
        private DataContext _db = new DataContext();
        public IEnumerable<BolusDrug> GetBolusDrugsAndOrders()
        {
            return (from d in _db.BolusDrugs.Include("BolusSortOrderings").Include("SpecificWard")
                    select d).ToList();
        }
        public IEnumerable<FixedDrug> GetFixedDrugsAndOrders()
        {
            return (from d in _db.FixedDrugs.Include("BolusSortOrderings")
                    select d).ToList();
        }
        public IEnumerable<BolusSortOrdering> GetHeaders(int WardId)
        {
            return (from d in _db.BolusSortOrdering
                    where d.WardId == WardId && d.SectionHeader!=null
                    select d).ToList();
        }
        public void InsertSortOrders(params BolusSortOrdering[] bolusSorting)
        {
            foreach (var order in bolusSorting)
            {
                _db.BolusSortOrdering.Add(order);
            }
            try
            {
                _db.SaveChanges();
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException e)
            {
                System.Diagnostics.Debug.Write(string.Join(";", e.EntityValidationErrors.Select(ve => string.Join(",", ve.ValidationErrors.Select(v => v.PropertyName + ":" + v.ErrorMessage)))));
                throw;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool AnySortOrder(int wardId)
        {
            return _db.BolusSortOrdering.Any(b => b.WardId == wardId);
        }
        public void CloneWard(int fromWardId, int toWardId)
        {
            var fromParam = new SqlParameter("@fromWardId", fromWardId);
            var toParam = new SqlParameter("@toWardId", toWardId);
            _db.Database.ExecuteSqlCommand(
                @"INSERT INTO [PicuDrugData].[dbo].[BolusSortOrdering]
                    ([WardId]
                    ,[BolusDrugId]
                    ,[SortOrder]
                    ,[SectionHeader])
                SELECT @toWardId
                    ,[BolusDrugId]
                    ,[SortOrder]
                    ,[SectionHeader]
                FROM [PicuDrugData].[dbo].[BolusSortOrdering]
                WHERE [WardId]=@fromWardId", toParam, fromParam);
        }
        public int[] GetWardsWithoutBoluses()
        {
            return (from w in _db.Wards
                    where !w.BolusSortOrderings.Any()
                    select w.WardId).ToArray();
        }
        public void DeleteSortOrder(BolusSortOrdering bolusSort)
        {
            try
            {
                _db.BolusSortOrdering.Attach(bolusSort);
                _db.BolusSortOrdering.Remove(bolusSort);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteSortOrder(int WardId)
        {
            try
            {
                _db.Database.ExecuteSqlCommand("Delete FROM bolusSortOrdering WHERE WardId={0}", WardId.ToString());
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateSortOrder(BolusSortOrdering bolusSort, BolusSortOrdering origBolusSort)
        {
            try
            {
                _db.BolusSortOrdering.Attach(origBolusSort);
                var ent = _db.Entry(origBolusSort);
                ent.CurrentValues.SetValues(bolusSort);
                ent.State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
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