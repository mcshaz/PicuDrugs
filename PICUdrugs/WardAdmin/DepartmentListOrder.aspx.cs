using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using PICUdrugs.DAL;
using PICUdrugs.BLL;
using PICUdrugs.Utils;
using System.Web.UI.HtmlControls;
using System.Web.Helpers;

namespace PICUdrugs.WardAdmin
{
    public partial class DepartmentListOrder : System.Web.UI.Page
    {
        private static string _validationTokenName = "__RequestVerificationToken";
        private static string _templateSourceDirectory;
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddJQueryUi();
            Master.AddTinyMce();
            AntiforgeryToken.Text = AntiForgery.GetHtml().ToHtmlString();
            if (_templateSourceDirectory == null) { _templateSourceDirectory = Page.AppRelativeTemplateSourceDirectory; }
        }
        protected void Page_PreRenderComplete(object sender, EventArgs e)
        {
            var selectedWard = WardList.SelectedWardId;
            if (WardList.CanModifySelectedWard)
            {
                bolusHeader.MaxLength = BolusSortOrdering.maxBolusSubHeaderLength;
                bolusHeader.ClientIDMode = System.Web.UI.ClientIDMode.Static;
            }
            else
            {
                submitInfusionOps.Visible = false;
                submitBolusOps.Visible = false;
            }
            int[] emptywards;
            ILookup<bool, SortingDrugItem> sortingDrugs;
            //BolusDrugs
            using (BolusSortingBL bolusBL = new BolusSortingBL())
            {
                sortingDrugs = bolusBL.GetAllDrugs(selectedWard).ToLookup(b => b.SortOrder != null);
                emptywards = bolusBL.GetWardsWithoutBoluses();
            }
            bolusSortOrderLV.DataSource = sortingDrugs[true].ToArray().IndexBy(b => b.SortOrder.Value);
            bolusSortOrderLV.DataBind();
            remainingBolusLV.DataSource = sortingDrugs[false];
            remainingBolusLV.DataBind();


            var currentUserWard = new UserWardDetails(HttpContext.Current.User.Identity.Name);
            using (WardBL wardBl = new WardBL())
            {
                var wardList = wardBl.GetDepartments().Where(w => w.WardId != selectedWard && emptywards.Contains(w.WardId) && currentUserWard.HasEditPermission(w.WardId)).ToList();
                if (wardList.Any())
                {
                    cloneBolusSelect.DataSource = wardList;
                    cloneBolusSelect.DataTextField = "Abbrev";
                    cloneBolusSelect.DataValueField = "WardId";
                    cloneBolusSelect.DataBind();
                    cloneBolusGo.Attributes.Add("data-clone-from", selectedWard.ToString());
                }
                else
                {
                    cloneBolusLabel.Visible = cloneBolusGo.Visible = cloneBolusSelect.Visible = false;
                }
            }
            //InfusionDrugs
            using (InfusionSortingBL ISBL = new InfusionSortingBL())
            {
                sortingDrugs = ISBL.GetAllVariableInfusions(selectedWard).ToLookup(b => b.SortOrder != null);
            }
            InfusionSortOrderLV.DataSource = sortingDrugs[true].OrderBy(b => b.SortOrder);
            InfusionSortOrderLV.DataBind();
            remainingInfusionsLV.DataSource = sortingDrugs[false].OrderBy(b => b.DrugName);
            remainingInfusionsLV.DataBind();
        }

        [WebMethod]
        public static void UpdateInfusionOrder(int wardId, int[] drugIdlist)
        {
            ValidateAjaxRequest(wardId);
            try
            {
                InfusionSortingBL ISBL = new InfusionSortingBL();
                if (drugIdlist.Length == 0)
                {
                    ISBL.DeleteAllOrderingforWard(wardId);
                }
                else
                {
                    ISBL.SetNewSortOrdering(wardId, drugIdlist);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        private static void ValidateAjaxRequest(int wardId)
        {
            var request = HttpContext.Current.Request;
            AntiForgery.Validate(request.Cookies[_validationTokenName].Value, request.Headers[_validationTokenName]);
            var currentUserWard = new UserWardDetails(HttpContext.Current.User.Identity.Name);
            if (!currentUserWard.HasEditPermission(wardId))
            {
                throw new System.Security.Authentication.InvalidCredentialException("User is not authorised to alter information for this Ward"); 
            }
        }
        [WebMethod]
        public static void UpdateBolusOrder(int wardId, string[] drugIdlist)
        {
            ValidateAjaxRequest(wardId);
            using (BolusSortingBL bolusBL = new BolusSortingBL())
            {
                if (drugIdlist.Length == 0)
                {
                    bolusBL.DeleteAllOrderingforWard(wardId);
                }
                else
                {
                    bolusBL.SetNewSortOrdering(wardId, drugIdlist);
                }
            }
        }
        [WebMethod]
        public static void CloneWardBoluses(int cloneFromId, int cloneToId)
        {
            ValidateAjaxRequest(cloneToId);
            using (BolusSortingBL bolusBL = new BolusSortingBL())
            {
                bolusBL.CloneWard(cloneFromId, cloneToId);
            }
        }
        protected void bolusLV_itemDataBound(object sender, ListViewItemEventArgs e)
        {
            var dataItem = (ListViewDataItem)e.Item;
            var drugItem = (SortingDrugItem)dataItem.DataItem;
            
            var li = (HtmlGenericControl)e.Item.FindControl("bolusItem");
            if (drugItem.Id.HasValue)
            {
                li.Attributes.Add("data-id",drugItem.Id.ToString());
                var route = drugItem.DrugName;
                li.InnerHtml = drugItem.DrugName;
            }
            else
            {
                li.Attributes.Add("data-id",drugItem.Id.ToString());
                li.InnerHtml = drugItem.DrugName;
                li.Attributes.Add("class", li.Attributes["class"] + " bolusSubHeader");
            }
        }
    }
}