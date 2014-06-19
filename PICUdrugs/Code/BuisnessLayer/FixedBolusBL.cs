using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PICUdrugs.DAL;
using PICUdrugs.Html.Utilities;
using PICUdrugs.Code.Utilities;
namespace PICUdrugs.BLL
{
    public class FixedBolusBL:IDisposable
    {
        internal FixedDoseRepository FixedDoseRepository { get; private set; }
        private IEnumerable<FixedDrug> persistingDrugs;
        public FixedBolusBL()
            : this(new FixedDoseRepository())
        { 
        }
        public FixedBolusBL(FixedDoseRepository fixedDoseRepository)
        {
            this.FixedDoseRepository = fixedDoseRepository;
        }
        public IEnumerable<FixedDose> GetFixedDoses(int drugId)
        {
            if (persistingDrugs == null)
            {
                return FixedDoseRepository.GetFixedDoses(drugId);
            }
            else
            {
                FixedDrug selectedDrug = persistingDrugs.Where(d => d.FixedDrugId == drugId).FirstOrDefault();
                if (selectedDrug == null)
                {
                    return FixedDoseRepository.GetFixedDoses(drugId);
                }
                return selectedDrug.FixedDoses.ToList();
            }
        }

        public void InsertFixedDose(FixedDose Dose)
        {
            try
            {
                ValidateFixedDose(Dose);
                FixedDoseRepository.InsertFixedDose(Dose);
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
                FixedDoseRepository.DeleteFixedDose(dose);
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
                ValidateFixedDose(Dose);
                FixedDoseRepository.UpdateFixedDose(Dose, origDose);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IEnumerable<FixedDrug> GetFixedDrugs()
        {
            persistingDrugs = FixedDoseRepository.GetFixedDrugs();
            return persistingDrugs;
        }

        public void InsertFixedDrug(FixedDrug drug)
        {
            try
            {
                CleanHtml(drug);
                ValidateFixedDrug(drug);
                FixedDoseRepository.InsertFixedDrug(drug);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteFixedDrug(FixedDrug Drug)
        {
            try
            {
                FixedDoseRepository.DeleteFixedDrug(Drug);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateFixedDrug(FixedDrug drug, FixedDrug origDrug)
        {
            try
            {
                CleanHtml(drug);
                ValidateFixedDrug(drug);
                FixedDoseRepository.UpdateFixedDrug(drug, origDrug);
            }
            catch (Exception)
            {
                throw;
            }
        }
//
        private void ValidateFixedDose(FixedDose drug)
        {
            if (drug.MaxAgeMonths <= drug.MinAgeMonths)
            {
                throw new NonAscendingRangeException("MinAgeMonths, MaxAgeMonths");
            }
        }
        private void ValidateFixedDrug(FixedDrug drug)
        {
            var duplicateDrug = FixedDoseRepository.GetDrugsByName(drug).FirstOrDefault(d=>d.FixedDrugId!=drug.FixedDrugId);
            if (duplicateDrug != null)
            {
                throw new DuplicateNameException(string.Format("A definition exists for '{0}' which is the same or similar to '{1}'",duplicateDrug.DrugName,drug.DrugName));
            }
        }
        private static void CleanHtml(FixedDrug drug)
        {
            drug.DrugName = HtmlSanitizer.SanitizeHtml(drug.DrugName);
            Exception testBolus = CreatePDFReport.TestHtml(drug.DrugName);
            if (testBolus != null) { throw new HtmlParsingException(testBolus); }
        }

        private void ValidateSingleAgePerDrug(FixedDose Dose) 
        {
            if (Dose != null) 
            {
                var duplicateRange = FixedDoseRepository.GetDosesByOverlappingWeight(Dose).FirstOrDefault(); 
                if (duplicateRange != null) 
                {
                    throw new OverlappingAgeWeightException(String.Format("Infusion for {0} overlaps (with age {1}-{2} months)", 
                                                                          duplicateRange.Drug.DrugName, 
                                                                          duplicateRange.MinAgeMonths,
                                                                          duplicateRange.MaxAgeMonths));
                } 
            }
        }

        private bool disposedValue = false; 
        protected virtual void Dispose(bool disposing) 
        { 
            if (!this.disposedValue) 
            {
                if (disposing) 
                {
                    FixedDoseRepository.Dispose(); 
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