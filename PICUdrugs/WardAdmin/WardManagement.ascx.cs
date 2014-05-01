using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PICUdrugs.DAL;
using PICUdrugs.BLL;
using System.Web.UI.HtmlControls;
using System.Web.Security;
using PICUdrugs.Utils;

namespace PICUdrugs.websiteAdmin
{
    public partial class WardManagement : System.Web.UI.UserControl
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            DptDetailView.EnableDynamicData(typeof(Ward));
            DptDropDownList.SelectedIndexChanged += DptDropDownList_SelectedIndexChanged;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //ensure jquery available
            SiteMaster containingMaster = Page.Master as SiteMaster;
            containingMaster.AddJQuery();

            //add css
            containingMaster.CreateStyle("~/Content/WardManagement.css");
            //add javascript file
            System.Web.UI.HtmlControls.HtmlGenericControl ucJS = new System.Web.UI.HtmlControls.HtmlGenericControl();
            containingMaster.CreateScript("~/Scripts/WardManagement.js");
        }
        protected void General_CRUD(object sender, ObjectDataSourceStatusEventArgs e)
        {
            Exception outerExcept = e.Exception;
            if (outerExcept != null)
            {
                var customVal = new CustomValidator();
                customVal.ValidationGroup = "WardVal";
                customVal.IsValid = false;
                if (outerExcept.InnerException is BLexception)
                {
                    customVal.ErrorMessage = "Cannot update as the following rule would be broken: " + outerExcept.InnerException.InnerException.Message;
                }
                else
                {
                    customVal.ErrorMessage = "Database rules prevented changes: " + PICUdrugs.Utils.Formulas.GetExceptionMessages(outerExcept);
                }
                Page.Validators.Add(customVal); //?val summary - WardValSummary
                e.ExceptionHandled = true;
            }
            else
            {
                DptDropDownList.DataBind();
                if (e.ReturnValue != null) { DptDropDownList.SelectedValue = ((Ward)e.ReturnValue).WardId.ToString(); }
            }
        }
        bool? _canModifySelectedWard;
        public bool CanModifySelectedWard 
        { 
            get
            {
                return _canModifySelectedWard.Value;
            }
            set
            {
                _canModifySelectedWard = value;
            }
        }
        UserWardDetails _currentUser;
        UserWardDetails CurrentUser
        {
            get
            {
                return _currentUser ?? (_currentUser = new UserWardDetails(Membership.GetUser().UserName));
            }
        }

        protected void DptListChanged(object sender, EventArgs e)
        {
            this.OnChanged(EventArgs.Empty);
        }
        /// <summary>
        /// Static key of all the event handlers
        /// </summary>
        private static readonly object EventChange = new object();
        /// <summary>
        /// This is the event where event handlers are collected into a evntHandlerList
        /// Page parser parses them from declarative syntax or you add them incode
        /// </summary>
        public event EventHandler WardIndexChanged
        {
            add
            {
                Events.AddHandler(EventChange, value);
                DptDropDownList.SelectedIndexChanged += new EventHandler(DptListChanged);
            }
            remove
            {
                Events.RemoveHandler(EventChange, value);
                DptDropDownList.SelectedIndexChanged -= new EventHandler(DptListChanged);
            }
        }
        private bool _changeHandled;
        /// <summary>
        /// This Description is used to raise change event. Do not *confuse* with aspx's OnChanged="method_name" syntax
        /// </summary>
        /// <param name="e"></param>
        protected virtual void OnChanged(EventArgs e)
        {
            if (!_changeHandled)
            {
                EventHandler handler = Events[EventChange] as EventHandler;
                if (handler != null) handler(this, e);
                _changeHandled = true;
            }
        }

        protected void DptDetailViewPreRender(object sender, EventArgs e)
        {
            if (DptDetailView.CurrentMode== DetailsViewMode.ReadOnly)
            {
                hiddenDetails.Attributes["class"] = "readOnlyMode";
            }
        }

        public int SelectedWardId { 
            get 
            {
                string val = DptDropDownList.Text;
                if (val=="") {return -1;}
                return int.Parse(val); 
            }
            set { DptDropDownList.Text = value.ToString(); }
        }

        protected void DptDropDownList_DataBound(object sender, EventArgs e)
        {
            //handle permissions

            if (!Page.IsPostBack && CurrentUser.HomeWardId.HasValue)
            {
                DptDropDownList.SelectedValue = CurrentUser.HomeWardId.Value.ToString();
            }
        }

        protected void DptDropDownList_PreRender(object sender, EventArgs e)
        {
            CanModifySelectedWard = CurrentUser.HasEditPermission(int.Parse(DptDropDownList.SelectedValue));
            CommandField cmdField = DptDetailView.Fields[DptDetailView.Fields.Count - 1] as CommandField;
            if (cmdField != null)
            {
                cmdField.ShowEditButton = CanModifySelectedWard;
                cmdField.ShowInsertButton = cmdField.ShowDeleteButton = CurrentUser.Roles.Contains("websiteAdmin");
            }
        }

        protected void DptDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DptDetailView.CurrentMode != DetailsViewMode.ReadOnly)
            {
                DptDetailView.ChangeMode(DetailsViewMode.ReadOnly);
            };
        }
    }
}