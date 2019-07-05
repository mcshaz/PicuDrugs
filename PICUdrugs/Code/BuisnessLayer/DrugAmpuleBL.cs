using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBToJSON.SqlEntities.Infusions;
using PICUdrugs.DAL;
using PICUdrugs.Utils;
namespace PICUdrugs.BLL
{
    public class DrugAmpuleBL : IDisposable
    {
        private DrugAmpuleRepository DrugAmpRepository;
        public DrugAmpuleBL()
        {
            this.DrugAmpRepository = new DrugAmpuleRepository();
        }
        public DrugAmpuleBL(DrugAmpuleRepository DrugAmpRepository)
        {
            this.DrugAmpRepository = DrugAmpRepository;
        }
        public IEnumerable<DrugAmpuleConcentration> GetAmpules(int drugId)
        {
            return DrugAmpRepository.GetAmpules(drugId);
        }
        public IEnumerable<DrugAmpuleConcentration> GetAmpules()
        {
            return DrugAmpRepository.GetAmpules();
        }
        public void InsertAmpule(DrugAmpuleConcentration drugAmp)
        {
            try
            {
                DrugAmpRepository.InsertAmpule(drugAmp);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteAmpule(DrugAmpuleConcentration drugAmp)
        {
            try
            {
                DrugAmpRepository.DeleteAmpule(drugAmp);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateAmpule(DrugAmpuleConcentration DrugAmp, DrugAmpuleConcentration origDrugAmp)
        {
            try
            {
                DrugAmpRepository.UpdateAmpule(DrugAmp, origDrugAmp);
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
                    DrugAmpRepository.Dispose();
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