using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
    }
}
