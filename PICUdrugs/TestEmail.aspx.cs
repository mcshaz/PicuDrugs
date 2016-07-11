using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PICUdrugs2013
{
    public partial class TestEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                using (var msg = new MailMessage())
                {
                    msg.To.Add(email.Text);
                    msg.Body = msg.Subject = "Test From PaediatricDrugs website";
                    using (var smtp = new SmtpClient())
                    {
                        smtp.Send(msg);
                    }
                }
                ResultLiteral.Text = "Success";
            } else
            {
                ResultLiteral.Text = "Errors on page";
            }


        }
    }
}