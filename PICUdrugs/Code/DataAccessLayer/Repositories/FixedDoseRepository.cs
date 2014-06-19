using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using PICUdrugs.Utils;
namespace PICUdrugs.DAL
{
    public class FixedDoseRepository : IDisposable
    {
        private DataContext _db = new DataContext();
        public IEnumerable<FixedDrug> GetFixedDrugs()
        {
            return (from d in _db.FixedDrugs.Include("FixedDoses")
                    select d).ToList();
        }
        public void InsertFixedDrug(FixedDrug drug)
        {
            try
            {
                _db.FixedDrugs.Add(drug);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteFixedDrug(FixedDrug drug)
        {
            try
            {
                _db.FixedDrugs.Attach(drug);
                _db.FixedDrugs.Remove(drug);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateFixedDrug(FixedDrug Drug, FixedDrug origDrug)
        {
            try
            {
                _db.FixedDrugs.Attach(origDrug);
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
        public IEnumerable<FixedDose> GetFixedDoses()
        {
            return (from d in _db.FixedDoses 
                    select d).ToList();
        }
        public IEnumerable<FixedDrug> GetDrugsByName(FixedDrug drug)
        {
            string searchName = GetTextFromHtml(drug.DrugName);
            return _db.FixedDrugs.AsNoTracking().ToList().Where(b => GetTextFromHtml(b.DrugName) == searchName);
        }
        
        static string GetTextFromHtml(string html)
        {
            var doc = new HtmlAgilityPack.HtmlDocument();
            doc.LoadHtml(html);
            return doc.DocumentNode.InnerText.ToLower().Replace("/","per").Replace(":","in").RemoveNonAlphaNumeric();
        }
        public IEnumerable<FixedDose> GetDosesByOverlappingWeight(FixedDose dose)
        {
            return (from d in _db.FixedDoses.AsNoTracking()
                    where d.FixedDrugId == dose.FixedDrugId && d.FixedDoseId != dose.FixedDoseId &&
                          d.MaxAgeMonths > dose.MinAgeMonths && d.MinAgeMonths < dose.MaxAgeMonths
                    select d).ToList();
        }
        public IEnumerable<FixedDose> GetFixedDoses(int drugId)
        {
            return (from d in _db.FixedDoses.Include("Drug")
                    where d.FixedDrugId==drugId
                    select d).ToList();
        }
        public void InsertFixedDose(FixedDose dose)
        {
            try
            {
                _db.FixedDoses.Add(dose);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteFixedDose(FixedDose dose)
        {
            try
            {
                _db.FixedDoses.Attach(dose);
                _db.FixedDoses.Remove(dose);
                _db.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateFixedDose(FixedDose Dose, FixedDose origDose)
        {
            try
            {
                _db.FixedDoses.Attach(origDose);
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
        ~FixedDoseRepository()
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