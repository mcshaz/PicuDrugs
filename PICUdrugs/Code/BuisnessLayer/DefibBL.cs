using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBToJSON.SqlEntities.BolusDrugs;
using PICUdrugs.DAL;
namespace PICUdrugs.BLL
{
    public class DefibBL : IDisposable
    {
        private DefibRepository _defibRepository;
        public DefibBL()
        {
            _defibRepository = new DefibRepository();
        }
        public DefibBL(DefibRepository defibRepository)
        {
            _defibRepository = defibRepository;
        }
        public void DeleteDefib(DefibModel defib)
        {
            try
            {
                _defibRepository.DeleteDefib(defib);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public DefibModel InsertDefib(DefibModel defib)
        {
            try
            {
                ValidateUniqueName(defib);
                _defibRepository.InsertDefib(defib);
            }
            catch (Exception)
            {
                throw;
            }
            return defib; // to use in afterupdate
        }
        public void UpdateDefib(DefibModel Defib, DefibModel origDefib)
        {
            try
            {
                ValidateUniqueName(Defib);
                _defibRepository.UpdateDefib(Defib, origDefib);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public DefibModel GetDefibModelById(int defibId)
        {
            return _defibRepository.GetDefibModelById(defibId);
        }
        public IEnumerable<DefibModel> GetDefibs()
        {
            return _defibRepository.GetDefibs();
        }
        private void ValidateUniqueName(DefibModel defib)
        {

            if (_defibRepository.GetDuplicateDefibs(defib).FirstOrDefault() != null)
            {
                throw new DuplicateNameException("A defib with the name " + defib.Name + " already exists");
            }
        }
        private bool disposedValue = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    _defibRepository.Dispose();
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