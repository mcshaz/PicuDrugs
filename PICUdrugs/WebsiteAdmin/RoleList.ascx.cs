using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using PICUdrugs.Utils;

namespace PICUdrugs.websiteAdmin
{
    public partial class RoleList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ensure jquery available
            SiteMaster containingMaster = Page.Master as SiteMaster;
            containingMaster.AddJQuery();

            //as jquery library will be in header, must place the script elements in the head rather than using RegisterStartupScript

            //add css
            //HtmlLink assdCSS = new HtmlLink();
            //assdCSS.Href = thisPath + "CSS/WardManagement.css";
            //assdCSS.Attributes.Add("type", "text/css");
            //assdCSS.Attributes.Add("rel", "stylesheet");
            //Page.Header.Controls.Add(assdCSS);
            //
            //add javascript file
            containingMaster.CreateScript("~/Scripts/roleList.js");
        }
        public string userName
        {
            set
            {
                // Determine what roles the selected user belongs to
                string[] selectedUsersRoles = Roles.GetRolesForUser(value);
                foreach (CheckBox cb in Role2Control)
                {
                    cb.Checked = selectedUsersRoles.Contains(cb.ID);
                    if (cb.ID == "wardAdmin" && cb.Checked)
                    {
                        UserProfile currentUser = UserProfile.GetUserProfile(value);
                        if (currentUser.WardId.HasValue)
                        {
                            WardList.SelectedWardId = currentUser.WardId.Value;
                        }
                        else
                        {
                            WardAdminValidator.IsValid = false;
                        }
                    }
                }
            }
        }
        public bool AutoPostBack
        {
            set
            {
                foreach (CheckBox cb in Role2Control)
                {
                    if (cb != wardAdmin) { cb.AutoPostBack = value; }
                }
                WardList.AutoPostBack = value;
            }
            get
            {
                return Role2Control.First().AutoPostBack;
            }
        }
        public bool CausesValidation
        {
            set
            {
                foreach (CheckBox cb in Role2Control)
                {
                    cb.CausesValidation = value;
                }
            }
            get
            {
                return Role2Control.First().CausesValidation;
            }
        }
        public string ValidationGroup
        {
            set
            {
                foreach (CheckBox cb in Role2Control)
                {
                    cb.ValidationGroup = value;
                }
                roleListValidator.ValidationGroup = value;
                WardAdminValidator.ValidationGroup = value;
            }
            get
            {
                return Role2Control.First().ValidationGroup;
            }
        }
        public string CssClass
        {
            set
            {
                roleDetails.Attributes.Add("class",value);
            }
        }
        public void setRoles(string userName)
        {
            var currentRoles = Roles.GetRolesForUser(userName);
            var addRoles = new List<string>();
            var removeRoles = new List<string>();
            foreach (CheckBox cb in Role2Control)
            {
                if (currentRoles.Contains(cb.ID) != cb.Checked)
                {
                    if (cb.Checked)
                    {
                        addRoles.Add(cb.ID);
                    }
                    else
                    {
                        removeRoles.Add(cb.ID);
                    }
                }
            }
            if (addRoles.Any()) { Roles.AddUserToRoles(userName, addRoles.ToArray()); }
            if (removeRoles.Any()) { Roles.RemoveUserFromRoles(userName, removeRoles.ToArray()); }
            UserProfile currentUser = UserProfile.GetUserProfile(userName);
            currentUser.WardId = (wardAdmin.Checked) ? (int?)WardList.SelectedWardId : null;
        }
        public void ClearRoles()
        {
            foreach (var cb in Role2Control)
            {
                cb.Checked = false;
            }
        }
        public int NoOfRoles
        {
            get
            {
                int returnVal=0;
                foreach (CheckBox cb in Role2Control)
                {
                    returnVal += cb.Checked ? 1 : 0;
                }
                return returnVal;
            }
        }
        protected void roleListChanged(object sender, EventArgs e)
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
        public event EventHandler Changed
        {
            add
            {
                Events.AddHandler(EventChange, value);
                foreach (CheckBox cb in Role2Control)
                {
                    cb.CheckedChanged += new EventHandler(roleListChanged);
                }
                WardList.WardIndexChanged += new EventHandler(roleListChanged);
            }
            remove
            {
                Events.RemoveHandler(EventChange, value);
                foreach (CheckBox cb in Role2Control)
                {
                    cb.CheckedChanged -= new EventHandler(roleListChanged);
                }
                WardList.WardIndexChanged -= new EventHandler(roleListChanged);
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
        protected void valOneChecked(object sender, ServerValidateEventArgs e)
        {
            e.IsValid = Role2Control.Any(r=>r.Checked);
        }
        protected void valWardAdmin(object sender, ServerValidateEventArgs e)
        {
            e.IsValid = !(wardAdmin.Checked && (WardList.SelectedWardId == -1));
        }
        private List<CheckBox> _Role2Control;
        private IEnumerable<CheckBox> Role2Control
        {
            get
            {
                if (_Role2Control == null)
                {
                    _Role2Control = new List<CheckBox>();
                    _Role2Control.Add(websiteAdmin);
                    _Role2Control.Add(drugAdmin);
                    _Role2Control.Add(wardAdmin);
                }
                return _Role2Control;
            }
        }
    }
}