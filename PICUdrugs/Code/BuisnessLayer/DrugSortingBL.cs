using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using PICUdrugs.DAL;
namespace PICUdrugs.BLL
{
    public class SortingDrugItem
    {
        public int? Id { get; set; }
        public string DrugName { get; set; }
        public int? SortOrder { get; set; }
    }
    public class InfusionSortingBL:IDisposable
    {
        private InfusionSortingRepository infSortRepository;
        public InfusionSortingBL()
        {
            this.infSortRepository = new InfusionSortingRepository();
        }
        public InfusionSortingBL(InfusionSortingRepository infSortRepository)
        {
            this.infSortRepository = infSortRepository;
        }
        public void SetNewSortOrdering(int wardId, int[] newOrder)
        {
            infSortRepository.DeleteSortOrder(wardId);
            infSortRepository.InsertSortOrder(wardId, newOrder);
        }
        public void DeleteAllOrderingforWard(int wardId)
        {
            infSortRepository.DeleteSortOrder(wardId);
        }
        public void CloneWard(int fromWardId, int toWardId, bool allowOverwrite = false)
        {
            if (fromWardId == toWardId) { return; }
            if (!allowOverwrite && infSortRepository.AnySortOrder(toWardId))
            {
                throw new InvalidOperationException("attempt to overwrite ward which already contains infusions");
            }
            infSortRepository.CloneWard(fromWardId, toWardId);
        }
        public IEnumerable<SortingDrugItem> GetAllVariableInfusions(int WardId)
        {
            var drugs = infSortRepository.GetInfDrugsAndOrders();
            var returnVal = new List<SortingDrugItem>();
            foreach (var drug in drugs)
            {
                var item = new SortingDrugItem { DrugName = drug.Fullname, Id= drug.InfusionDrugId };
                var so = drug.InfusionSortOrderings.FirstOrDefault(s => s.WardId == WardId);
                if (so != null) { item.SortOrder = so.SortOrder; }
                returnVal.Add(item);
            }
            return returnVal;
        }
        private bool disposedValue = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    infSortRepository.Dispose();
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
    public class BolusSortingBL : IDisposable
    {
        private BolusSortingRepository bolusSortRepository;
        public IEnumerable<SortingDrugItem> GetAllDrugs(int WardId)
        {
            var drugs = bolusSortRepository.GetBolusDrugsAndOrders();
            var returnVal = new List<SortingDrugItem>();
            foreach (var drug in drugs)
            {
                var item = new SortingDrugItem { DrugName = drug.DrugName + (drug.Route == null ? "" : (string.Format(" ({0})", drug.Route))), 
                    Id= drug.BolusDrugId };
                var so = drug.BolusSortOrderings.FirstOrDefault(s=>s.WardId == WardId);
                if (so!=null) {item.SortOrder=so.SortOrder;}
                returnVal.Add(item);
            }
            returnVal.AddRange(bolusSortRepository.GetHeaders(WardId).Select(s => new SortingDrugItem { DrugName = s.SectionHeader, SortOrder = s.SortOrder }));
            return returnVal;
        }
        public BolusSortingBL() : this(new BolusSortingRepository())
        {
        }
        public BolusSortingBL(BolusSortingRepository bolusSortRepository)
        {
            this.bolusSortRepository = bolusSortRepository;
        }
        public void SetNewSortOrdering(int WardId, string[] newOrder)
        {
            bolusSortRepository.DeleteSortOrder(WardId);
            bolusSortRepository.InsertSortOrder(WardId, newOrder);
        }
        public void DeleteAllOrderingforWard(int WardId)
        {
            bolusSortRepository.DeleteSortOrder(WardId);
        }
        public bool AnyBoluses(int wardId)
        {
            return bolusSortRepository.AnySortOrder(wardId);
        }
        public void CloneWard(int fromWardId, int toWardId, bool allowOverwrite = false)
        {
            if (fromWardId == toWardId) { return; }
            if (!allowOverwrite && bolusSortRepository.AnySortOrder(toWardId))
            {
                throw new InvalidOperationException("attempt to overwrite ward which already contains boluses");
            }
            bolusSortRepository.CloneWard(fromWardId, toWardId);
        }
        private bool disposedValue = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    bolusSortRepository.Dispose();
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