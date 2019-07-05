using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using PICUdrugs.DAL;
using PICUdrugs.BLL;
using DBToJSON.SqlEntities.Infusions;

namespace PICUdrugs.drugAdmin
{
    public partial class editInfusionDrugNames : Page
    {
        protected Dictionary<int, string> SiPrefixesList;
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddJQuery();
            SiPrefixesList = Utils.FormUtilities.SiPrefixesList();
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            InfusionListview.EnableDynamicData(typeof(InfusionDrug));
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
            if (prefixLbl != null) prefixLbl.Text = SiPrefixesList[infDrug.SiPrefix];
        }
        IEnumerable<KeyValuePair<int?, string>> _wards;
        private IEnumerable<KeyValuePair<int?, string>> Wards
        {
            get
            {
                if (_wards == null)
                {
                    using (var wbl = new WardBL())
                    {
                        _wards = (new[] { new KeyValuePair<int?, string>(null, "(default)") })
                            .Concat(wbl.GetDepartments().Select(d => new KeyValuePair<int?, string>(d.WardId, d.Abbrev))).ToList();
                    }
                }
                return _wards;
            }
        }
        protected void WardDropDown_DataBinding(object sender, EventArgs e)
        {
            ((DropDownList)sender).DataSource = Wards;
        }
    }
}