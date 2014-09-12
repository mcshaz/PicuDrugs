using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PICUdrugs.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginUser_LoggedIn(object sender, EventArgs e)
        {
            string returnUrl = System.Web.Security.FormsAuthentication.GetRedirectUrl(LoginUser.UserName, LoginUser.RememberMeSet);
            if (returnUrl.EndsWith("ChangePasswordSuccess.aspx") || returnUrl.EndsWith("PasswordRecovery.aspx"))
            {
                Response.Redirect("/EnterPtData.aspx");
            }
        }

        protected void LoginUser_LoginError(object sender, EventArgs e)
        {
            MembershipUser usr = Membership.GetUser(LoginUser.UserName);
            if (usr != null && usr.IsLockedOut)
            {
                LoginUser.FailureText = string.Format("Your account has been locked. Please contact your <a href='mailto:brentm@adhb.govt.nz?subject=Locked Account - {0}'>system administrator</a>.", LoginUser.UserName);
            }
        }
    }
}
