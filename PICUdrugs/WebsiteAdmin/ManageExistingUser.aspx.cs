using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PICUdrugs.websiteAdmin
{
    public partial class manageExistingUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddJQuery();
            if (!Page.IsPostBack)
            {
                // Bind the users and roles
                var users = Membership.GetAllUsers();
                UserList.DataSource = users;
                UserList.DataBind();
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            var selectedUser = UserList.Text;
            currentRoleList.userName = selectedUser;
            unlockUserButton.Enabled = Membership.GetUser(selectedUser).IsLockedOut;
            DeleteUserButton.Enabled = Page.User.Identity.Name.ToLower() != selectedUser.ToLower(); // running logical comparison here + Remove, as selectedUser may change after Remove
        }
        protected void UserList_SelectedIndexChanged(object sender, EventArgs e)
        {
            currentRoleList.userName = UserList.Text;
        }
        protected void DeleteClick(object sender, EventArgs e)
        {
            var DeleteItem = UserList.SelectedItem;
            if (Page.User.Identity.Name.ToLower() != DeleteItem.Value.ToLower()) 
            {
                Membership.DeleteUser(DeleteItem.Value);
                UserList.Items.Remove(DeleteItem);
            }
        }
        protected void unlockClick(object sender, EventArgs e)
        {
            Membership.GetUser(UserList.Text).UnlockUser();
            unlockUserButton.Enabled = false;
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                currentRoleList.setRoles(UserList.Text);
                successNotification.Visible = true;
            }
        }
    }
}