using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PICUdrugs.DAL;
using PICUdrugs.Html.Utilities;
using PICUdrugs.Code.Utilities;
using DBToJSON.SqlEntities.BolusDrugs;

namespace PICUdrugs.BLL
{
    public class BolusBL:IDisposable
    {
        private IBolusRepository bolusesRepository;
        private IEnumerable<BolusDrug> persistingDrugs;
        public BolusBL()
        { 
            this.bolusesRepository = new BolusRepository();
        }
        public BolusBL(IBolusRepository bolusesRepository)
        {
            this.bolusesRepository = bolusesRepository;
        }
        public IEnumerable<BolusDose> GetBolusDoses(int drugId)
        {
            if (persistingDrugs == null)
            {
                return bolusesRepository.GetBolusDoses(drugId);
            }
            else
            {
                BolusDrug selectedDrug = persistingDrugs.Where(d => d.BolusDrugId == drugId).FirstOrDefault();
                if (selectedDrug == null)
                {
                    return bolusesRepository.GetBolusDoses(drugId);
                }
                return selectedDrug.BolusDoses.ToList();
            }
        }

        public void InsertBolusDose(BolusDose Dose)
        {
            try
            {
                ValidateBolusDose(Dose);
                bolusesRepository.InsertBolusDose(Dose);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteBolusDose(BolusDose dose)
        {
            try
            {
                bolusesRepository.DeleteBolusDose(dose);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateBolusDose(BolusDose Dose, BolusDose origDose)
        {
            try
            {
                ValidateBolusDose(Dose);
                bolusesRepository.UpdateBolusDose(Dose, origDose);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IEnumerable<BolusDrug> GetBolusDrugs()
        {
            persistingDrugs = bolusesRepository.GetBolusDrugs();
            return persistingDrugs;
        }

        public void InsertBolusDrug(BolusDrug drug)
        {
            try
            {
                CleanHtml(drug);
                ValidateBolusDrug(drug);
                bolusesRepository.InsertBolusDrug(drug);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteBolusDrug(BolusDrug Drug)
        {
            try
            {
                bolusesRepository.DeleteBolusDrug(Drug);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateBolusDrug(BolusDrug drug, BolusDrug origDrug)
        {
            //try
            //{
                CleanHtml(drug);
                ValidateBolusDrug(drug);
                bolusesRepository.UpdateBolusDrug(drug, origDrug);
            /*}
            catch (Exception)
            {
                throw;
            }
            */
        }
//
        private void ValidateBolusDrug(BolusDrug drug)
        {
            if (drug != null) 
            {
                if (drug.AdultMax < drug.Min)
                {
                    throw new NonAscendingRangeException("Min, AdultMax");
                }

                drug.DrugName = drug.DrugName.Trim();
                if (drug.DrugName.Length > BolusDrug.DrugNameLength)
                {
                    throw new CleanedHtmlTooLongException("The drug name (including format directives) must be less than " + BolusDrug.DrugNameLength + " characters long");
                }
                drug.Units = drug.Units.Trim();
                string lunits = drug.Units.ToLower();
                if (lunits == "ml" || lunits == "mls")
                {
                    drug.Units = "mL";
                    if (drug.Conc_ml != 1)
                    {
                        throw new ConcUnitDisparity("if units are mL, Concentration by definition must be 1 mL per mL");
                    }
                }

                else if (lunits == "j" && drug.Conc_ml != 1)
                {
                    throw new ConcUnitDisparity("if units are J(joules), Concentration by definition must be 1J");
                }

                var duplicateDrug = bolusesRepository.GetDrugsByName(drug).FirstOrDefault(d=>d.BolusDrugId!=drug.BolusDrugId && d.SpecificWardId==drug.SpecificWardId);
                if (duplicateDrug != null)
                {
                    throw new DuplicateNameException(string.Format("A definition exists for '{0}' which is the same or similar to '{1}'",duplicateDrug.DrugName,drug.DrugName));
                }
            }
        }
        private static void CleanHtml(BolusDrug drug)
        {
            if (drug.Units.Contains('<') || drug.Units.Contains("&#")) { throw new HttpRequestValidationException(); }
            drug.DrugName = HtmlSanitizer.SanitizeHtml(drug.DrugName);
            Exception testBolus = CreatePDFReport.TestHtml(drug.DrugName);
            if (testBolus != null) { throw new HtmlParsingException(testBolus); }
        }
        private void ValidateBolusDose(BolusDose Dose)
        {
            if (Dose.WeightMin >= Dose.WeightMax) throw new NonAscendingRangeException("weight");
            if (Dose.MinDosePerKg > Dose.MaxDosePerKg) throw new NonAscendingRangeException("Dose per Kg");
            try
            {
                ValidateSingleWeightPerDrug(Dose);
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void ValidateSingleWeightPerDrug(BolusDose Dose) 
        {
            if (Dose != null) 
            {
                var duplicateRange = bolusesRepository.GetDosesByOverlappingWeight(Dose).FirstOrDefault(); 
                if (duplicateRange != null) 
                {
                    throw new OverlappingAgeWeightException(String.Format("Infusion for {0} overlaps with weight({1}-{2}kg)", 
                                                                          duplicateRange.BolusDrug.DrugName, 
                                                                          duplicateRange.WeightMin,
                                                                          duplicateRange.WeightMax));
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
                    bolusesRepository.Dispose(); 
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