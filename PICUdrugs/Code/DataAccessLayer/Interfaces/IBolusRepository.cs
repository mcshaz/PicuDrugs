using System;
using System.Collections.Generic;
namespace PICUdrugs.DAL
{
    public interface IBolusRepository : IDisposable
    {
        IEnumerable<BolusDrug> GetBolusDrugs();
        void InsertBolusDrug(BolusDrug drug);
        void DeleteBolusDrug(BolusDrug drug);
        void UpdateBolusDrug(BolusDrug Drug, BolusDrug origDrug);

        IEnumerable<BolusDose> GetBolusDoses(int drugId);
        void InsertBolusDose(BolusDose dose);
        void DeleteBolusDose(BolusDose dose);
        void UpdateBolusDose(BolusDose Dose, BolusDose origDose);
        IEnumerable<BolusDose> GetDosesByOverlappingWeight(BolusDose drug);
        IEnumerable<BolusDrug> GetDrugsByName(BolusDrug drug);
    }
}