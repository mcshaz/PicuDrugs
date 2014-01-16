using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace PICUdrugs.personalAccount
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var legend = (HtmlGenericControl)ChangeUserPassword.ChangePasswordTemplateContainer.FindControl("legendEl");
            legend.InnerText = string.Format("Password for: {0}", Page.User.Identity.Name);
        }
    }
}
