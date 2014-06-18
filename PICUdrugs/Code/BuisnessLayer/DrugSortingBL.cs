using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PICUdrugs.DAL;
using PICUdrugs.Code.Utilities;
using PICUdrugs.Utils;
using PICUdrugs.Html.Utilities;
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
        public int[] GetWardsWithoutInfusions()
        {
            return infSortRepository.GetWardsWithoutInfusions();
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
        public const string ETTsize = "ETT size";
        private BolusSortingRepository bolusSortRepository;
        public IEnumerable<SortingDrugItem> GetAllDrugs(int WardId)
        {
            var drugs = bolusSortRepository.GetBolusDrugsAndOrders();
            var returnVar = new List<SortingDrugItem>();
            foreach (var drug in drugs)
            {
                var item = new SortingDrugItem { DrugName = drug.DrugName, 
                    Id= drug.BolusDrugId };
                var so = drug.BolusSortOrderings.FirstOrDefault(s=>s.WardId == WardId);
                if (so!=null) {item.SortOrder=so.SortOrder;}
                returnVar.Add(item);
            }
            var headers = bolusSortRepository.GetHeaders(WardId).Select(s => new SortingDrugItem { DrugName = s.SectionHeader, SortOrder = s.SortOrder });
            if (!headers.Any(h=>h.DrugName == ETTsize))
            {
                returnVar.Add(new SortingDrugItem { DrugName = ETTsize });
            }
            returnVar.AddRange(headers);
            return returnVar;
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
            string[] htmlCleanedOrder = newOrder.Map(o => o.Any(d=>!char.IsDigit(d))?CleanHtml(o):o);//clean first in order not to delete if it throws an error

            bolusSortRepository.DeleteSortOrder(WardId);
            bolusSortRepository.InsertSortOrder(WardId, htmlCleanedOrder);
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
        static readonly System.Text.RegularExpressions.Regex cleanPageBreaks = new System.Text.RegularExpressions.Regex(@"<\s*(\w+)\s*>[\r\n\s]*<!--\s*pagebreak\s*-->[\r\n\s]*<\/\s*\1\s*>");
        static string CleanHtml(string html)
        {
            string returnVar = cleanPageBreaks.Replace(html, "<!-- pagebreak -->");
            returnVar = HtmlSanitizer.SanitizeHtml(returnVar);
            Exception testBolus = CreatePDFReport.TestHtml(returnVar);
            if (testBolus != null) { throw new HtmlParsingException(testBolus); }
            return returnVar;
        }
        public int[] GetWardsWithoutBoluses()
        {
            return bolusSortRepository.GetWardsWithoutBoluses();
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