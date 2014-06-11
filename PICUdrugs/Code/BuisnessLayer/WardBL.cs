﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PICUdrugs.DAL;
using Westwind.Web.Utilities;
namespace PICUdrugs.BLL
{
    public class WardBL : IDisposable
    {
        private WardRepository _WardRepository;
        public WardBL()
        {
            this._WardRepository = new WardRepository();
        }
        public WardBL(WardRepository dptSortRepository)
        {
            this._WardRepository = dptSortRepository;
        }
        public void DeleteWard(Ward dpt)
        {
            _WardRepository.DeleteDepartment(dpt);
        }
        public Ward InsertWard(Ward dpt)
        {
            CleanHtml(dpt);
            try
            {
                ValidateUniqueName(dpt);
                _WardRepository.InsertDepartment(dpt);
                return dpt; // to use in afterupdate
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Ward UpdateWard(Ward ward, Ward origWard)
        {
            CleanHtml(ward);
            try
            {
                ValidateUniqueName(ward);
                _WardRepository.UpdateDepartment(ward, origWard);
                return ward;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Ward GetDepartmentByWardId(int dptId)
        {
            return _WardRepository.GetDptByWardId(dptId);
        }
        public IEnumerable<Ward> GetDepartments()
        {
            return _WardRepository.GetDepartments();
        }
        private static void CleanHtml(Ward dpt)
        {
            if ((new string[] { dpt.Fullname, dpt.Abbrev }).Any(w=>w.Contains('<') || w.Contains("&#"))) { throw new HttpRequestValidationException(); }
            dpt.BolusChartHeader = HtmlSanitizer.SanitizeHtml(dpt.BolusChartHeader);
        }
        private void ValidateUniqueName(Ward dpt)
        {
            var duplicateDpt = _WardRepository.GetDuplicateDpt(dpt).FirstOrDefault();
            if (duplicateDpt != null)
            {
                throw new DuplicateNameException(String.Format(
                    "Name or Abbreviation not unique. A Ward exists with Name:{0} and Abbreviation:{1}",
                    duplicateDpt.Fullname,
                    duplicateDpt.Abbrev));
            }
        }
        private bool disposedValue = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    _WardRepository.Dispose();
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