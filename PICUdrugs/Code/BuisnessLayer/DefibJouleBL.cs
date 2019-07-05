using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBToJSON.SqlEntities.BolusDrugs;
using PICUdrugs.DAL;
namespace PICUdrugs.BLL
{
    public class DefibJouleBL : IDisposable
    {
        private DefibJouleRepository _defibJouleRepository;
        public DefibJouleBL()
        {
            _defibJouleRepository = new DefibJouleRepository();
        }
        public DefibJouleBL(DefibJouleRepository defibRepository)
        {
            _defibJouleRepository = defibRepository;
        }
        public void DeleteDefibJoule(DefibJoule defibJ)
        {
            try
            {
                _defibJouleRepository.DeleteDefibJoule(defibJ);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public DefibJoule InsertDefibJoule(DefibJoule defibJ)
        {
            try
            {
                ValidateUniqueJoule(defibJ);
                _defibJouleRepository.InsertDefibJoule(defibJ);
            }
            catch (Exception)
            {
                throw;
            }
            return defibJ; // to use in afterupdate
        }
        public void UpdateDefibJoule(DefibJoule DefibJoule, DefibJoule origDefibJoule)
        {
            try
            {
                ValidateUniqueJoule(DefibJoule);
                _defibJouleRepository.UpdateDefibJoule(DefibJoule, origDefibJoule);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public IEnumerable<DefibJoule> GetDefibJoulesByModelId(int modelId)
        {
            return _defibJouleRepository.GetDefibJoulesByModel(modelId);
        }
        private void ValidateUniqueJoule(DefibJoule defibJ)
        {
            if (_defibJouleRepository.GetDuplicateDefibJoules(defibJ).FirstOrDefault() != null)
            {
                throw new DuplicateNameException(defibJ.Joules.ToString() + "J is already set");
            }
        }
        private bool disposedValue = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    _defibJouleRepository.Dispose();
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