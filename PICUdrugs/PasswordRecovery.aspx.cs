using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PICUdrugs.personalAccount
{
    public partial class PasswordRecovery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PasswordRecovery1_VerifyingUser(object sender, LoginCancelEventArgs e)
        {
            MembershipUser usr = Membership.GetUser(PasswordRecovery1.UserName);
            if (usr != null && usr.IsLockedOut)
            {
                PasswordRecovery1.UserNameFailureText = string.Format("Your account has been locked. Please contact your <a href='mailto:brentm@adhb.govt.nz?subject=Locked Account - {0}'>system administrator</a>.",PasswordRecovery1.UserName);
            }
        }
    }
}