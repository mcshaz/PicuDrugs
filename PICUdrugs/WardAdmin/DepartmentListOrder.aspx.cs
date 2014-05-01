using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
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
            AntiforgeryToken.Text = AntiForgery.GetHtml().ToHtmlString();
            if (_templateSourceDirectory == null) { _templateSourceDirectory = Page.AppRelativeTemplateSourceDirectory; }
        }
        protected void Page_PreRenderComplete(object sender, EventArgs e)
        {
            var selectedWard = WardList.SelectedWardId;
            if (WardList.CanModifySelectedWard)
            {
                bolusHeader.MaxLength = FieldConst.maxBolusSubHeaderLength;
                bolusHeader.ClientIDMode = System.Web.UI.ClientIDMode.Static;
            }
            else
            {
                submitInfusionOps.Visible = false;
                submitBolusOps.Visible = false;
            }
            //BolusDrugs
            BolusSortingBL bolusBL = new BolusSortingBL();
            var boluses = bolusBL.GetAllDrugs(selectedWard).ToLookup(b => b.SortOrder != null);
            bolusSortOrderLV.DataSource = boluses[true].OrderBy(b => b.SortOrder);
            bolusSortOrderLV.DataBind();
            remainingBolusLV.DataSource = boluses[false].OrderBy(b=>b.DrugName);
            remainingBolusLV.DataBind();
            //InfusionDrugs
            InfusionSortingBL ISBL = new InfusionSortingBL();
            var Infusions = ISBL.GetAllVariableInfusions(selectedWard).ToLookup(b => b.SortOrder != null);
            InfusionSortOrderLV.DataSource = Infusions[true].OrderBy(b => b.SortOrder);
            InfusionSortOrderLV.DataBind();
            remainingInfusionsLV.DataSource = Infusions[false].OrderBy(b=>b.DrugName);
            remainingInfusionsLV.DataBind();
        }
        private static Boolean CanModifyWard(int wardId)
        {
            var currentUserWard = new UserWardDetails(HttpContext.Current.User.Identity.Name);
            return currentUserWard.HasEditPermission(wardId);
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
            if (!CanModifyWard(wardId))
            {
                throw new System.Security.Authentication.InvalidCredentialException("User is not authorised to alter information for this Ward"); 
            }
        }
        [WebMethod]
        public static void UpdateBolusOrder(int wardId, string[] drugIdlist)
        {
            ValidateAjaxRequest(wardId);
            try
            {
                BolusSortingBL bolusBL = new BolusSortingBL();
                if (drugIdlist.Length == 0)
                {
                    bolusBL.DeleteAllOrderingforWard(wardId);
                }
                else
                {
                    bolusBL.SetNewSortOrdering(wardId, drugIdlist);
                }
            }
            catch (Exception)
            {
                throw;
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
                li.InnerText = drugItem.DrugName;
            }
            else
            {
                li.Attributes.Add("data-id",drugItem.Id.ToString());
                li.InnerText = drugItem.DrugName;
                li.Attributes.Add("class", li.Attributes["class"] + " bolusSubHeader");
            }
        }
    }
}