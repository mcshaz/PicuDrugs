using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PICUdrugs.DAL;
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
        public void DeleteBolusDose(BolusDose Dose)
        {
            try
            {
                bolusesRepository.DeleteBolusDose(Dose);
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

        public void InsertBolusDrug(BolusDrug Drug)
        {
            try
            {
                ValidateBolusDrug(Drug);
                bolusesRepository.InsertBolusDrug(Drug);
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
        public void UpdateBolusDrug(BolusDrug Drug, BolusDrug origDrug)
        {
            try
            {
                ValidateBolusDrug(Drug);
                bolusesRepository.UpdateBolusDrug(Drug, origDrug);
            }
            catch (Exception)
            {
                throw;
            }
        }
//
        private void ValidateBolusDrug(BolusDrug Drug)
        {
            if (Drug != null) 
            {
                Drug.DrugName = Drug.DrugName.Trim();
                if (Drug.Route != null) Drug.Route = Drug.Route.Trim();
                if (Drug.AmpuleConcentration != null)
                {
                    Drug.AmpuleConcentration = Drug.AmpuleConcentration.Trim();
                    string lconc = Drug.AmpuleConcentration.ToLower();
                    if ((lconc == "ml" || lconc == "mls") && Drug.Conc_ml != 1)
                    {
                        throw new BLexception(new ConcUnitDisparity("if units are mL, Concentration by definition must be 1 mL per mL"));
                    }
                    else if (lconc == "j" && Drug.Conc_ml != 1)
                    {
                        throw new BLexception(new ConcUnitDisparity("if units are J(joules), Concentration by definition must be 1J"));
                    }
                }
                var duplicateDrug = bolusesRepository.GetDrugsByNameRoute(Drug).FirstOrDefault();
                if (duplicateDrug != null)
                {
                    throw new BLexception(new DuplicateNameException("A definition already exists for a bolus with the same name and route - please choose another name"));
                }
            }
        }
        private void ValidateBolusDose(BolusDose Dose)
        {
            if (Dose.WeightMin >= Dose.WeightMax) throw new BLexception(new NonAscendingRangeException("weight"));
            if (Dose.MinDosePerKg > Dose.MaxDosePerKg) throw new BLexception(new NonAscendingRangeException("Dose per Kg"));
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
                    throw new BLexception(new OverlappingAgeWeightException(String.Format("Infusion for {0} overlaps with weight({1}-{2}kg)", 
                                                                          duplicateRange.BolusDrug.DrugName, 
                                                                          duplicateRange.WeightMin,
                                                                          duplicateRange.WeightMax)));
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