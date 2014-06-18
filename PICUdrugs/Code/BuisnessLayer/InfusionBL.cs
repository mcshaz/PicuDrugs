using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PICUdrugs.DAL;
using PICUdrugs.Utils;
namespace PICUdrugs.BLL
{
    public class InfusionBL:IDisposable
    {
        private IInfusionRepository drugConcRepository;
        public InfusionBL()
        {
            this.drugConcRepository = new InfusionRepository();
        }
        public InfusionBL(IInfusionRepository drugConcRepository)
        {
            this.drugConcRepository = drugConcRepository;
        }

        public IEnumerable<VariableTimeDilution> GetVariableTimeDilutions(int drugId)
        {
            return drugConcRepository.GetVariableTimeDilutions(drugId);
        }
        public IEnumerable<VariableTimeConcentration> GetVariableTimeConcentrations(int infDilutionId)
        {
            return drugConcRepository.GetVariableTimeConcentrations(infDilutionId);
        }
        public void InsertConcentration(VariableTimeConcentration infConc)
        {
            try
            {
                ValidateVariableTimeConcentration(infConc);
                drugConcRepository.InsertConcentration(infConc);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteConcentration(VariableTimeConcentration infConc)
        {
            try
            {
                drugConcRepository.DeleteConcentration(infConc);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateConcentration(VariableTimeConcentration infConc, VariableTimeConcentration originfConc)
        {
            try
            {
                ValidateVariableTimeConcentration(infConc);
                drugConcRepository.UpdateConcentration(infConc, originfConc);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void InsertDilution(VariableTimeDilution infDil)
        {
            try
            {
                ValidateVariableTimeDilution(infDil);
                drugConcRepository.InsertDilution(infDil);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteDilution(VariableTimeDilution infDil)
        {
            try
            {
                drugConcRepository.DeleteDilution(infDil);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateDilution(VariableTimeDilution infDil, VariableTimeDilution origInfDil)
        {
            try
            {
                ValidateVariableTimeDilution(infDil);
                drugConcRepository.UpdateDilution(infDil, origInfDil);
            }
            catch (Exception)
            {
                throw;
            }
        }
        private void ValidateVariableTimeDilution(VariableTimeDilution infDil)
        {
            Exception e = ValidateInfusionDilutionAgeWeight(infDil);
            if (e != null) { throw e; }
            if (infDil.RateMin > infDil.RateMax) throw new NonAscendingRangeException("Dose Range");
            try
            {
                ValidateVariableTimeVolume(infDil.Volume, infDil.DilutionMethodId);
                ValidateSingleAgeWeightPerDrug(infDil);
            }
            catch (Exception)
            {
                throw;
            }
            FormatReferencePage(infDil);
        }
        private void ValidateVariableTimeVolume(int? volume, int dilutionMethodId)
        {
            if (volume.HasValue) { return; }
            var dilType = drugConcRepository.GetDilutionMethod(dilutionMethodId);
            if (!(dilType.IsVaryVolume && dilType.IsVaryConcentration))
            {
                throw new InvalidNullCombination("Volume can only be null if dilution method is of variable volume and fixed flow");
            }

        }
        private void ValidateFixedTimeVolume(int? volume, int dilutionMethodId)
        {
            if (volume.HasValue) { return; }
            var dilType = drugConcRepository.GetDilutionMethod(dilutionMethodId);
            if (!(dilType.IsPerKg && !dilType.IsVaryConcentration && !dilType.IsVaryVolume))
            {
                throw new InvalidNullCombination("Volume must be entered with this dilution method");
            }

        }
        private void ValidateSingleAgeWeightPerDrug(VariableTimeDilution infDil) 
        { 
            if (infDil != null) 
            {
                var duplicateRange = drugConcRepository.GetDilutionsByOverlappingAgeWeight(infDil).FirstOrDefault(); 
                if (duplicateRange != null) 
                {
                    throw new OverlappingAgeWeightException(String.Format("Infusion for {0} overlaps with age({1}-{2}months) &/or weight({3}-{4}kg).{5}Weights can have the same (non overlapping) value, months of age must be distinct.", 
                                                                          duplicateRange.InfusionDrug.Fullname, 
                                                                          duplicateRange.AgeMinMonths,
                                                                          duplicateRange.AgeMaxMonths,
                                                                          duplicateRange.WeightMin,
                                                                          duplicateRange.WeightMax,
                                                                          Environment.NewLine));
                } 
            }
        }
        private void ValidateVariableTimeConcentration(VariableTimeConcentration infConc)
        {
            IEnumerable <VariableTimeConcentration> assdConcentrations = drugConcRepository.GetVariableTimeConcentrations(infConc.InfusionDilutionId, NoTracking:true);
            bool otherConcentrations = false;
            DoseCat checkDoseCat = drugConcRepository.GetDoseCatById(infConc.DoseCatId);
            foreach (VariableTimeConcentration ascConc in assdConcentrations)
            {
                if (ascConc.InfusionConcentrationId != infConc.InfusionConcentrationId) //all checks only apply to records other than itself
                {
                    otherConcentrations = true;
                    //check infConc.DoseCat unused
                    if (ascConc.DoseCatId == infConc.DoseCatId)
                    {
                        throw new DuplicateDoseCatException("each Dilution can have only one of each dose category (including null)");
                    }
                    if (ascConc.Concentration == infConc.Concentration)
                    {
                        throw new DuplicateConcentrationException("Concentrations cannot be duplicated for the same Dilution Description");
                    }
                    //check infConc.Concentration is ascending with DoseCat.SortOrder
                    if ((ascConc.DoseCat.SortOrder < checkDoseCat.SortOrder && ascConc.Concentration > infConc.Concentration) ||
                        (ascConc.DoseCat.SortOrder > checkDoseCat.SortOrder && ascConc.Concentration < infConc.Concentration))
                    {
                        throw new NonAscendingConcentrationException("Concentrations must ascend according to category - low med high etc");
                    }
                }
            }
            if (otherConcentrations && !infConc.DoseCatId.HasValue) throw new NullDoseCatException("dose category cannot be empty if a Dilution has more than 1 Concentration");
        }

        public IEnumerable<FixedTimeDilution> GetFixedTimeDilutions(int drugId)
        {
            return drugConcRepository.GetFixedTimeDilutions(drugId);
        }
        public IEnumerable<FixedTimeConcentration> GetFixedTimeConcentrations(int infDilutionId)
        {
            return drugConcRepository.GetFixedTimeConcentrations(infDilutionId);
        }
        public void InsertConcentration(FixedTimeConcentration infConc)
        {
            try
            {
                ValidateFixedTimeConcentration(infConc);
                drugConcRepository.InsertConcentration(infConc);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteConcentration(FixedTimeConcentration infConc)
        {
            try
            {
                drugConcRepository.DeleteConcentration(infConc);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateConcentration(FixedTimeConcentration infConc, FixedTimeConcentration originfConc)
        {
            try
            {
                ValidateFixedTimeConcentration(infConc);
                drugConcRepository.UpdateConcentration(infConc, originfConc);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void InsertDilution(FixedTimeDilution infDil)
        {
            
            try
            {
                ValidateFixedTimeDilution(infDil);
                drugConcRepository.InsertDilution(infDil);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteDilution(FixedTimeDilution infDil)
        {
            try
            {
                drugConcRepository.DeleteDilution(infDil);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateDilution(FixedTimeDilution infDil, FixedTimeDilution origInfDil)
        {
            try
            {
                ValidateFixedTimeDilution(infDil);
                drugConcRepository.UpdateDilution(infDil, origInfDil);
            }
            catch (Exception)
            {
                throw;
            }
        }
        private void ValidateFixedTimeDilution(FixedTimeDilution infDil)
        {
            Exception e = ValidateInfusionDilutionAgeWeight(infDil);
            if (e != null) { throw e; }
            try
            {
                //if (infDil.AgeMinMonths >= infDil.AgeMaxMonths) throw new nonAscendingRangeException("age");
                //if (infDil.WeightMin >= infDil.WeightMax) throw new nonAscendingRangeException("weight");
                ValidateSingleAgeWeightPerDrug(infDil);
            }
            catch (Exception)
            {
                throw;
            }
            var reference = drugConcRepository.GetDrugReference(infDil.InfusionDrugId);
            FormatReferencePage(infDil);
        }
        private static Exception ValidateInfusionDilutionAgeWeight(IInfusionDilution infDil)
        {
            if (infDil.AgeMaxMonths <= infDil.AgeMinMonths)
            {
                return new NonAscendingRangeException("age");
            }
            if (infDil.WeightMax <= infDil.WeightMin)
            {
                return new NonAscendingRangeException("weight");
            }
            return null;
        }
        private void ValidateSingleAgeWeightPerDrug(FixedTimeDilution infDil)
        {
            if (infDil != null)
            {
                var duplicateRange = drugConcRepository.GetDilutionsByOverlappingAgeWeight(infDil).FirstOrDefault();
                if (duplicateRange != null)
                {
                    throw new OverlappingAgeWeightException(String.Format("Infusion for {0} overlaps with age({1}-{2}months) &/or weight({3}-{4}kg).{5}Weights can have the same (non overlapping) value, months of age must be distinct.",
                                                                          duplicateRange.InfusionDrug.Fullname,
                                                                          duplicateRange.AgeMinMonths,
                                                                          duplicateRange.AgeMaxMonths,
                                                                          duplicateRange.WeightMin,
                                                                          duplicateRange.WeightMax,
                                                                          Environment.NewLine));
                }
            }
        }
        private void ValidateFixedTimeConcentration(FixedTimeConcentration infConc)
        {
            FixedTimeConcentration duplicateStopTime = drugConcRepository.GetFixedTimeConcentrationsByStopTime(infConc.InfusionDilutionId, infConc.StopMinutes).FirstOrDefault();
            if (duplicateStopTime != null && duplicateStopTime.InfusionConcentrationId != infConc.InfusionConcentrationId)
            {
                throw new DuplicateTimeException(string.Format("Infusions for the same drug, age & weight group cannot have the same stop time ({0}) minutes", infConc.StopMinutes));
            }
            if (!infConc.Volume.HasValue)
            {
                var infDil = drugConcRepository.GetFixedTimeDilution(infConc.InfusionDilutionId);
                try
                {
                    ValidateFixedTimeVolume(infConc.Volume, infDil.DilutionMethodId);
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
        private static void FormatReferencePage(IInfusionDilution infDil)
        {
            if (infDil.ReferencePage == null) { return; }
            infDil.ReferencePage = infDil.ReferencePage.Trim().Replace(" ", "%20").Replace('\\', '/');
            /*
            string newRef = infDil.ReferencePage.Trim();
            var reference = drugConcRepository.GetDrugReference(infDil.InfusionDrugId);
            switch (reference.Location())
            {
                case ReferenceType.Http:
                    newRef = newRef.Replace(" ", "%20").Replace('\\', '/');
                    break;
                case ReferenceType.File:
                    newRef = newRef.Replace("%20", " ").Replace('/', '\\');
                    break;
            }
            infDil.ReferencePage = newRef;
            */
        }
        public IEnumerable<DoseCat> GetDoseCats()
        {
            return drugConcRepository.GetDoseCats();
        }
        public IEnumerable<DilutionMethod> GetDilutionMethods()
        {
            return drugConcRepository.GetDilutionMethods();
        }

        private bool disposedValue = false; 
        protected virtual void Dispose(bool disposing) 
        { 
            if (!this.disposedValue) 
            {
                if (disposing) 
                {
                    drugConcRepository.Dispose(); 
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