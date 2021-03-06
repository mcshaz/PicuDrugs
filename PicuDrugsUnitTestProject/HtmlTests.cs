﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PICUdrugs.Code.Utilities;
using PICUdrugs.Html.Utilities;
using System.IO;
using System.Xml;

namespace PicuDrugsUnitTestProject
{
    [TestClass]
    public class HtmlTests
    {
        [TestMethod]
        public void TestEncoding()
        {
            Assert.AreEqual("\u2013", HtmlSanitizer.SanitizeHtml("&#8211;"));
            Assert.AreEqual("\u2013", HtmlSanitizer.SanitizeHtml("&#x2013;"));
            Assert.AreEqual("\u2013", HtmlSanitizer.SanitizeHtml("&ndash;"));
            Assert.AreEqual("Adrenaline <span class=\"concentration\">(1:10 000) <span class=\"route\">IV/IO</span><br /></span><span class=\"note\">(every 2<sup>nd</sup> CPR cycle ≈ </span><span class=\"note\">every 4 mins)</span>",
                HtmlSanitizer.SanitizeHtml("Adrenaline <span class=\"concentration\">(1:10 000) <span class=\"route\">IV/IO</span><br /></span><span class=\"note\">(every 2<sup>nd</sup> CPR cycle &asymp; </span><span class=\"note\">every 4 mins)</span>"));
        }
        [TestMethod]
        public void TestHtmlToPdfDoesNotThrow()
        {
            foreach (string html in new string[] {
                "<p> some other text </p>",
                "sometext<p> some other text </p>sometext",
                "<p> some other text </p>sometext",
                "sometext<p> some other text </p>",
                "<!-- pagebreak --><div>Anaphylaxis</div>",
                "<!-- pagebreak --> <div>Anaphylaxis</div>",
                "<div>sometext<p> some <em>other</em> text </p>sometext</div>",
                "<div style=\"text-color:#FF0000\">Oxygen <span class=\"concentration\">6 L/min</span><span class=\"route\"> via hudson or non-rebreather</span></div>"
            })
            {
                Exception ex = CreatePDFReport.TestHtml(html);
                Assert.IsNull(ex,string.Format("Failed to parse html '{0}' due to error {1}",html,ex));
            }

            foreach (string html in new string[] {
                "sometext<p> some other<br> text </p>sometext",
                "<div><!-- pagebreak --></div><div>Anaphylaxis</div>",
                "&nbsp; sometext<p> some other <span>&nbsp;</span> text </p>sometext",
                "<div style=\"padding-left: 30px;\">&nbsp;Oxygen <span class=\"concentration\">6 L/min</span> <span class=\"route\">via hudson or non-rebreather mask</span></div>"
            })
            {
                Exception ex = CreatePDFReport.TestHtml(HtmlSanitizer.SanitizeHtml(html));
                Assert.IsNull(ex, string.Format("Failed to parse sanitised html '{0}' due to error {1}", html, ex));
            }
        }
    }
}
