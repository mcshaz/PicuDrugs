using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PICUdrugs.DAL;
using PICUdrugs.Utils;
namespace PICUdrugs.BLL
{
    public class referenceBL : IDisposable
    {
        private DrugReferenceRepository DrugRefRepository;
        public referenceBL():this(new DrugReferenceRepository())
        {
        }
        public referenceBL(DrugReferenceRepository DrugRefRepository)
        {
            this.DrugRefRepository = DrugRefRepository;
        }
        public ReferenceModel GetReference(int refId)
        {
            return DrugRefRepository.GetReference(refId).MapToModel();
        }
        public IEnumerable<ReferenceModel> GetReferences()
        {
            return DrugRefRepository.GetReferences().Select(r => r.MapToModel());
        }
        public void InsertReference(ReferenceModel drugRef)
        {
            try
            {
                DrugRefRepository.InsertReference(drugRef.MapToRecord());
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void DeleteReference(ReferenceModel drugRef)
        {
            try
            {
                DrugRefRepository.DeleteReference(drugRef.MapToRecord());
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void UpdateReference(ReferenceModel drugRef)
        {
            try
            {
                DrugRefRepository.UpdateReference(drugRef.MapToRecord());
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
                    DrugRefRepository.Dispose();
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