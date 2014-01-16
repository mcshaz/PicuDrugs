﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs.DAL
{
    public class InfusionSortingRepository : IDisposable
    {
        private DataContext _db = new DataContext();
        public IEnumerable<InfusionDrug> GetInfDrugsAndOrders()
        {
            return (from d in _db.InfusionDrugs.Include("InfusionSortOrderings")
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
            return (from d in _db.BolusDrugs.Include("BolusSortOrderings")
                    select d).ToList();
        }
        public IEnumerable<BolusSortOrdering> GetHeaders(int WardId)
        {
            return (from d in _db.BolusSortOrdering
                    where d.WardId == WardId && d.BolusDrugId==null
                    select d).ToList();
        }
        public void InsertSortOrder(BolusSortOrdering bolusSort)
        {
            try
            {
                _db.BolusSortOrdering.Add(bolusSort);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void InsertSortOrder(int WardId, string[] bolusIDs)
        {
            try
            {
                for (int i = 0; i < bolusIDs.Length; i++)
                {
                    int drugId;
                    var isInt = int.TryParse(bolusIDs[i], out drugId);
                    BolusSortOrdering sort;
                    if (isInt)
                    {
                        sort = new BolusSortOrdering
                        {
                            WardId = WardId,
                            SortOrder = i + 1,
                            BolusDrugId = drugId
                        };
                    }
                    else if (string.IsNullOrWhiteSpace(bolusIDs[i]))
                    {
                        continue;
                    }
                    else 
                    {
                        sort = new BolusSortOrdering
                        {
                            WardId = WardId,
                            SortOrder = i + 1,
                            SectionHeader = bolusIDs[i]
                        };
                    }
                    _db.BolusSortOrdering.Add(sort);
                }
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
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