using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Net.Mail;

namespace PICUdrugs
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup

        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        static readonly string[] CacheableFileExtensions = new string[] { ".js", ".css", ".gif", ".png" };
#if !DEBUG
        void Application_AuthorizeRequest(object sender, EventArgs e)
        {
            string path = Request.Path;
            if (path.IndexOf("ScriptResource.axd") > -1 || path.IndexOf("WebResource.axd") > -1 || CacheableFileExtensions.Any(c=>path.EndsWith(c)))
            {
                Response.Cache.SetCacheability(HttpCacheability.Public);
            }
        }
#endif

        //void Application_Error(object sender, EventArgs e)
        //{
            // Code that runs when an unhandled error occurs
        //    if (HttpContext.Current.Server.GetLastError() != null)
         //   {
         //       Exception currentException = HttpContext.Current.Server.GetLastError().GetBaseException();
         //       string mailSubject = "Error in page" + Request.Url.ToString();
         //       string message = "<strong>Message</strong><br />" + currentException.Message + "<br />" +
         //           "<strong>StackTrace</strong><br />" + currentException.StackTrace + "<br />" +
         //           "<strong>Query String</strong><br />" + Request.QueryString.ToString() + "<br />";
         //       MailMessage thisMessage = new MailMessage("brentm@adhb.govt.nz", "brentm@adhb.govt.nz", mailSubject, message);
         //       thisMessage.IsBodyHtml = true;
         //       SmtpClient thisSmtpClient = new SmtpClient();
         //       thisSmtpClient.Send(thisMessage);
         //   }
        // }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}
