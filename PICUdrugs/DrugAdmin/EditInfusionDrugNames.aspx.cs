using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PICUdrugs.DAL;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Core;

namespace PICUdrugs.drugAdmin
{
    public partial class editInfusionDrugNames : System.Web.UI.Page
    {
        protected Dictionary<int, string> SiPrefixesList;
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddJQuery();
            SiPrefixesList = PICUdrugs.Utils.FormUtilities.SiPrefixesList();
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            InfusionListview.EnableDynamicData(typeof(PICUdrugs.DAL.InfusionDrug));
        }
        protected void InfusionLV_dataBound(object sender, ListViewItemEventArgs e)
        {
            HyperLink InfusionHL = e.Item.FindControl("InfusionHyperlink") as HyperLink;
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;
            //set select parameter on objectdatasource
            InfusionDrug infDrug = (InfusionDrug)dataItem.DataItem;
            if (InfusionHL != null)
            {
                InfusionHL.NavigateUrl = string.Format("~/DrugAdmin/EditInfusions.aspx?drugId={0}&InfusionDuration={1}",
                        infDrug.InfusionDrugId,
                        (infDrug.IsTitratable) ? "variable" : "fixed");
            }
            Label nameLbl = e.Item.FindControl("fullnameLabel") as Label;
            if (nameLbl!=null) nameLbl.Text=infDrug.Fullname.Replace("/","/<br>");
            Label prefixLbl = e.Item.FindControl("SiPrefixValLabel") as Label;
            if (prefixLbl != null) prefixLbl.Text = SiPrefixesList[infDrug.SiPrefixVal];
        }

    }
}