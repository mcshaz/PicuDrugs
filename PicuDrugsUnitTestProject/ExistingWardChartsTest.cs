using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PICUdrugs.Code.Utilities;
using PICUdrugs.DAL;
using PICUdrugs.Utils;
using System.Collections.Generic;
using System.Linq;
using DBToJSON.SqlEntities;

namespace PicuDrugsUnitTestProject
{
    [TestClass]
    public class ExistingWardChartsTest
    {
        [TestMethod]
        public void BolusAndInfusionTables()
        {
            PatientDrugChartDetails[] patients = GetDummyPatientDetails();
            IEnumerable<Ward> wards;
            using (var db = new WardRepository())
            {
                wards = db.GetDepartments();
            }
            foreach (var ward in wards)
            {
                foreach (var pt in patients)
                {
                    pt.WardId = ward.WardId;
//                    try
//                    {
                    CreatePDFReport.CreatePdf(pt, SelectedChart.bolusPlusInfusion);
//                    }
//                    catch (Exception ex)
//                    {
//                        Assert.Fail(string.Format("Unable to create chart for ward {0} (Age:{1}) with exception '{2}'",ward.Abbrev,pt.Age.ToShortString(),ex));
//                    }
                }
            }
        }
        PatientDrugChartDetails[] GetDummyPatientDetails()
        {
            return new PatientDrugChartDetails[] {
                new PatientDrugChartDetails{ 
                    ActualWeight = 2.5,
                    Age = new ChildAge (0,0,0),
                    Name = "",
                    Centile = "", 
                    NHI = ""
                },
                new PatientDrugChartDetails{ 
                    ActualWeight = 5,
                    Age = new ChildAge (1,0,0),
                    Name = "",
                    Centile = "", 
                    NHI = ""
                },
                new PatientDrugChartDetails{ 
                    ActualWeight = 30,
                    Age = new ChildAge (7,0,0),
                    Name = "",
                    Centile = "", 
                    NHI = ""
                },
                new PatientDrugChartDetails{ 
                    ActualWeight = 120,
                    Age = new ChildAge (15,0,0),
                    Name = "",
                    Centile = "", 
                    NHI = ""
                },
            };
        }
    }
}
