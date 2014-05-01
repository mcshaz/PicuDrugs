using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Net.Mail;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PICUdrugs.websiteAdmin
{
    public partial class RegisterNewUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddJQuery();
            Type csType = this.GetType();
            if (!Page.ClientScript.IsStartupScriptRegistered(csType, "newUserControlNames"))
            {
                string nameStr = string.Format("var PICU={{}};PICU.userNameId='{0}';PICU.emailId='{1}';",
                                                UserName.ClientID,
                                                Email.ClientID);
                Page.ClientScript.RegisterStartupScript(csType, "newUserControlNames", nameStr, true);
            }
        }
        protected void submitClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MembershipCreateStatus createStatus;
                string pwd = Membership.GeneratePassword(9, 2);
                MembershipUser newUser = Membership.CreateUser(username: UserName.Text,
                                                               password: pwd,
                                                               email: Email.Text,
                                                               passwordQuestion: null,
                                                               passwordAnswer: null,
                                                               isApproved: true,
                                                               status: out createStatus);
                if (createStatus == MembershipCreateStatus.Success)
                {
                    currentRoleList.setRoles(newUser.UserName);
                    successNotification.Visible = true;
                    ErrorMessage.Text = "";
                    UserName.Text = "";
                    Email.Text = "";
                    currentRoleList.ClearRoles();

                    MailDefinition mail = new MailDefinition();
                    ListDictionary replacements = new ListDictionary();
                    replacements.Add("<% UserName %>", newUser.UserName);
                    replacements.Add("<% Password %>", pwd);
                    replacements.Add("<% changePasswordUrl %>", ConvertRelativeUrlToAbsoluteUrl("~/personalAccount/ChangePassword.aspx") );
                    replacements.Add("<% adminGuideUrl %>", ConvertRelativeUrlToAbsoluteUrl("~/Administrators%20Guide%20to%20the%20Starship%20PICU%20Drug%20Calculator.pdf"));
                    mail.BodyFileName = "~/App_Data/newUserConfirmation.txt";
                    //mail.From = Membership.GetUser().Email; use the web.config
                    mail.Subject = "Your new PICU drug calculator account";
                    mail.IsBodyHtml = true;

                    MailMessage message = mail.CreateMailMessage(newUser.Email, replacements, this);
                    message.ReplyToList.Add(Membership.GetUser().Email);

                    SmtpClient picuClient = new SmtpClient();
                    picuClient.Send(message);
                }
                else
                {
                    ErrorMessage.Text = GetErrorMessage(createStatus);
                    successNotification.Visible = false;
                }
            }
        }
        private string GetErrorMessage(MembershipCreateStatus status)
        {
            switch (status)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "Username already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A username for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
        private string ConvertRelativeUrlToAbsoluteUrl(string relativeUrl) {
            return string.Format("http{0}://{1}{2}",
                (Request.IsSecureConnection) ? "s" : "", 
                Request.Headers["Host"],
                Page.ResolveUrl(relativeUrl));
        }
    }
}
