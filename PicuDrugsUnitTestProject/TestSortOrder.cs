using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PICUdrugs.BLL;

namespace PicuDrugsUnitTestProject
{
    [TestClass]
    public class TestSortOrder
    {
        [TestMethod]
        public void LogBolusSortDrugs()
        {
            using (var bs = new BolusSortingBL())
            {
                foreach (var d in bs.GetAllDrugs(1))
                {
                    Console.WriteLine("{0}:({1})",d.DrugName, d.SpecificWard);
                }
                
            }
        }
    }
}
