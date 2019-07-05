using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PICUdrugs.Utils;

namespace PICUdrugs
{
    public partial class CurrentDrugList : System.Web.UI.Page
    {
        private const string colHeadFmtConst = "<span class='colHeader'><a href='{0}' class='colHeaderInner'>{1}</a></span>";
        protected void Page_Load(object sender, EventArgs e)
        {
            BooleanTable bolusTbl;
            BooleanTable infusionTbl;
            string[] selectInfusions;
            using (var d = new DrugUseTables())
            {
                bolusTbl = d.BolusTable();
                infusionTbl = d.InfusionTable();
                selectInfusions = d.SelectableInfusions();
            }
            string thisUrl = ResolveUrl("~/EnterPtData.aspx");
            bolusGrid.Text = bolusTbl.ToHtml(thead: bolusGrid.Text, id: "bolusGrid", colHeadFormat: string.Format(colHeadFmtConst, thisUrl + "?ward={0}&amp;bolusOnly=true", "{1}"));
            titratableInfusionGrid.Text = infusionTbl.ToHtml(thead: titratableInfusionGrid.Text, id: "titratableInfusionGrid", colHeadFormat: string.Format(colHeadFmtConst, thisUrl + "?ward={0}", "{1}"));
            selectDrugList.DataSource = selectInfusions.Select(s => new { Name = s, EncodedName = HttpUtility.UrlPathEncode(s) });
            selectDrugList.DataBind();
        }
        
    }
}