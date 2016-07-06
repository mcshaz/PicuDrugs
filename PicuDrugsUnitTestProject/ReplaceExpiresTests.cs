using System;
using System.Text;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PICUdrugs.Code.Utilities;

namespace PicuDrugsUnitTestProject
{
    /// <summary>
    /// Summary description for ReplaceExpiresTests
    /// </summary>
    [TestClass]
    public class ReplaceExpiresTests
    {
        public ReplaceExpiresTests()
        {
            //
            // TODO: Add constructor logic here
            //
        }


        [TestMethod]
        public void ReplaceExpires()
        {
            string testStr = "abc expires:[expires+7] def";
            Assert.AreEqual(testStr.Replace("[expires+7]", DateTime.Today.AddDays(7).ToString()), CreatePDFReport.ReplaceExpires(testStr));

            testStr = "abc expires:[expires+7:dd/mm/yy] def";
            Assert.AreEqual(testStr.Replace("[expires+7:dd/mm/yy]", DateTime.Today.AddDays(7).ToString("dd/mm/yy")), CreatePDFReport.ReplaceExpires(testStr));

            testStr = "abc def";
            Assert.AreEqual(testStr, CreatePDFReport.ReplaceExpires(testStr));
        }

    }
}
