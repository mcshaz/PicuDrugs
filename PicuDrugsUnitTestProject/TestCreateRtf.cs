using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PICUdrugs.Code.Utilities;

namespace PicuDrugsUnitTestProject
{
    [TestClass]
    public class TestCreateRtf
    {
        [TestMethod]
        public void CreateRtfBolusTable()
        {
            CreatePDFReport.CreateRtf(new PICUdrugs.DAL.PatientDrugChartDetails { ActualWeight = 3.2, Age = new PICUdrugs.Utils.ChildAge(0, 1, 1), IsMale = false, WardId = 1, Centile=string.Empty, Name=string.Empty, NHI=string.Empty}, PICUdrugs.DAL.SelectedChart.bolusOnly);

        }
    }
}
