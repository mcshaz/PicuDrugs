using System;
using System.Collections.Generic;
using DBToJSON.SqlEntities.Enums;
using DBToJSON.SqlEntities.Infusions;

namespace PICUdrugs.DAL
{
    public interface IInfusionRepository : IDisposable
    {
        IEnumerable<VariableTimeDilution> GetVariableTimeDilutions(int drugId);
        IEnumerable<FixedTimeDilution> GetFixedTimeDilutions(int drugId);
        FixedTimeDilution GetFixedTimeDilution(int dilutionId);
        DrugReferenceSource GetDrugReference(int drugId);

        IEnumerable<VariableTimeConcentration> GetVariableTimeConcentrations(int infDilutionId, bool NoTracking = false);
        IEnumerable<FixedTimeConcentration> GetFixedTimeConcentrations(int DilutionId);

        IEnumerable<VariableTimeDilution> GetDilutionsByOverlappingAgeWeight(VariableTimeDilution infDil);
        IEnumerable<FixedTimeDilution> GetDilutionsByOverlappingAgeWeight(FixedTimeDilution infDil);

        void InsertDilution(FixedTimeDilution infDil);
        void DeleteDilution(FixedTimeDilution infDil);
        void UpdateDilution(FixedTimeDilution infDil, FixedTimeDilution origInfDil);

        void InsertDilution(VariableTimeDilution infDil);
        void DeleteDilution(VariableTimeDilution infDil);
        void UpdateDilution(VariableTimeDilution infDil, VariableTimeDilution origInfDil);

        void InsertConcentration(FixedTimeConcentration infConc);
        void DeleteConcentration(FixedTimeConcentration infConc);
        void UpdateConcentration(FixedTimeConcentration infConc, FixedTimeConcentration origInfConc);

        void InsertConcentration(VariableTimeConcentration infConc);
        void DeleteConcentration(VariableTimeConcentration infConc);
        void UpdateConcentration(VariableTimeConcentration infConc, VariableTimeConcentration origInfConc);

        IEnumerable<FixedTimeConcentration> GetFixedTimeConcentrationsByStopTime(int DilutionId, int totalMinutes);

        IEnumerable<DoseCat> GetDoseCats();
        DoseCat GetDoseCatById(int? DoseCatId);
    }
}