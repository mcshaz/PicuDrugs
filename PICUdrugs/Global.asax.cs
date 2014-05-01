using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using PICUdrugs2013;

namespace PICUdrugs2013
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            //below is for friendly URLs - problem is for ajax calls
            //RouteConfig.RegisterRoutes(RouteTable.Routes);
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

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }
    }
}
