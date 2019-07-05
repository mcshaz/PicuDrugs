using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace PICUdrugs
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {

        protected const string AntiXsrfTokenKey = "__AntiXsrfToken";
        protected const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;
        private List<ScriptReference> _waitingScripts = new List<ScriptReference>();
        bool _validateXsrfToken = true; 
        public bool ValidateXsrfToken 
        {
            get { return _validateXsrfToken; } 
            set { _validateXsrfToken = value; }
        }            
        protected void Page_Init(object sender, EventArgs e)
        {
            if (ValidateXsrfToken)
            {
                //First, check for the existence of the Anti-XSS cookie
                var requestCookie = Request.Cookies[AntiXsrfTokenKey];
                Guid requestCookieGuidValue;

                //If the CSRF cookie is found, parse the token from the cookie.
                //Then, set the global page variable and view state user
                //key. The global variable will be used to validate that it matches in the view state form field in the Page.PreLoad
                //method.

                if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
                {
                    //Set the global token variable so the cookie value can be
                    //validated against the value in the view state form field in
                    //the Page.PreLoad method.
                    _antiXsrfTokenValue = requestCookie.Value;

                    //Set the view state user key, which will be validated by the
                    //framework during each request
                    Page.ViewStateUserKey = _antiXsrfTokenValue;
                }
                //If the CSRF cookie is not found, then this is a new session.
                else
                {
                    //Generate a new Anti-XSRF token
                    _antiXsrfTokenValue = Guid.NewGuid().ToString("N");

                    //Set the view state user key, which will be validated by the
                    //framework during each request
                    Page.ViewStateUserKey = _antiXsrfTokenValue;

                    //Create the non-persistent CSRF cookie
                    var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                    {
                        //Set the HttpOnly property to prevent the cookie from
                        //being accessed by client side script
                        HttpOnly = true,

                        //Add the Anti-XSRF token to the cookie value
                        Value = _antiXsrfTokenValue
                    };

                    //If we are using SSL, the cookie should be set to secure to
                    //prevent it from being sent over HTTP connections
                    if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                    {
                        responseCookie.Secure = true;
                    }

                    //Add the CSRF cookie to the response
                    Response.Cookies.Set(responseCookie);
                }

                Page.PreLoad += master_Page_PreLoad;
            }
        }
        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            //During the initial page load, add the Anti-XSRF token and user
            //name to the ViewState
            if (!IsPostBack)
            {
                //Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;

                //If a user name is assigned, set the user name
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            //During all subsequent post backs to the page, the token value from
            //the cookie should be validated against the token in the view state
            //form field. Additionally user name should be compared to the
            //authenticated users name
            else
            {
                //Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new System.Security.Authentication.AuthenticationException("Validation of Anti-XSRF token failed.");
                }
            }
        }
        private static string GetCurrentUserName()
        {
            var currentUser = HttpContext.Current.User.Identity;
            return (currentUser == null) ? string.Empty : currentUser.Name;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string thisPath = Request.PhysicalPath;
            //dateFileMod.Text = System.IO.File.GetLastWriteTime(thisPath).ToString("d");
            Page.Header.DataBind();
            //sideMenu.StaticSelectedStyle.CssClass = "activeMenuItem";
        }
        private bool _jHtmlAreaIncluded;
        private bool _jQueryScriptIncluded;
        private bool _jQueryUIScriptIncluded;
        public void AddTinyMce()
        {
            if (_jHtmlAreaIncluded) { return; }
#if DEBUG
            CreateScript("/Scripts/tinymce/tinymce.js");
#else
            CreateScript("/Scripts/tinymce/tinymce.min.js", false);
#endif
            //CreateScript("/Scripts/jHtmlArea.ColorPickerMenu-0.8.min.js", false);
            //CreateStyle("/Content/jHtmlArea/jHtmlArea.css");
            //CreateStyle("/Content/jHtmlArea/ColorPickerMenu.css");
            _jHtmlAreaIncluded = true;
        }
        public void AddJQuery()
        {
            if (_jQueryScriptIncluded) { return; }
            if (IncludesCurrentBrowser(BrowserType.IeLegacy))
            {
#if DEBUG
                CreateScript("/Scripts/jquery-1.12.4.min.js");
#else
                CreateScript("//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js", true);
#endif
            }
            else 
            {
#if DEBUG
                CreateScript("/Scripts/jquery-2.2.4.min.js");
#else
                CreateScript("//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js", true);
#endif
            }
            _jQueryScriptIncluded = true;
        }
        public void AddJQueryUi()
        {
            if (_jQueryUIScriptIncluded) { return; }
            AddJQuery();
            if (IncludesCurrentBrowser(BrowserType.Ie6))
            {
#if DEBUG
                CreateScript("/Scripts/jquery-ui-1.9.2.js");
#else
                CreateScript("//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js", true);
#endif
            }
            else
            {
#if DEBUG
                CreateScript("/Scripts/jquery-ui-1.10.4.js");
#else
                CreateScript("//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js", true);
#endif
            }
            CreateStyle("//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/ui-lightness/jquery-ui.min.css");
            _jQueryUIScriptIncluded = true;
        }
        public ScriptReference CreateScript(string src)
        {
            if (src[0] == '/')
            {
                src = '~' + src;
            }
            else if (src[0] != '~')
            {
                src = "~/" + src;
            }
            var ctrl = new ScriptReference(src);
            if (ScriptManager1 != null)
            {
                InsertScript(ctrl);
            }
            else
            {
                _waitingScripts.Add(ctrl);
            }
            return ctrl;
        }
        private void InsertScript(ScriptReference src)
        {
            if (Regex.IsMatch(src.Path, @"/jquery-\d+\.\d+\.\d+(\.min)?.js$"))
            {
                ScriptManager1.Scripts.Insert(0, src);
            }
            else
            {
                ScriptManager1.Scripts.Add(src);
            }
        }
        public HtmlLink CreateStyle(string src)
        {
            var ctrl = new HtmlLink();
            ctrl.Attributes.Add("type", @"text/css");
            ctrl.Attributes.Add("rel", "stylesheet");
            ctrl.Attributes.Add("href", ResolveUrl(src));
            masterStyles.Controls.Add(ctrl);
            return ctrl;
        }
        [Flags]
        private enum BrowserType { Ie6 = 0x1, Ie7 = 0x2, Ie8 = 0x4, IeLegacy = 0x7, W3cCompliant = 0x8, All = 0x17 }
        private BrowserType _requestingBrowser;
        private BrowserType RequestingBrowser
        {
            get
            {
                if (_requestingBrowser == 0)
                {
                    var browser = HttpContext.Current.Request.Browser.Type;
                    if (browser.Length > 2 && browser.Substring(0, 2) == "IE")
                    {
                        switch (browser[2])
                        {
                            case '6':
                                _requestingBrowser = BrowserType.Ie6;
                                break;
                            case '7':
                                _requestingBrowser = BrowserType.Ie7;
                                break;
                            case '8':
                                _requestingBrowser = BrowserType.Ie8;
                                break;
                            default:
                                _requestingBrowser = BrowserType.W3cCompliant;
                                break;
                        }
                    }
                    else
                    {
                        _requestingBrowser = BrowserType.W3cCompliant;
                    }
                }
                return _requestingBrowser;
            }
        }
        private bool IncludesCurrentBrowser(BrowserType browserType)
        {
            if (browserType == BrowserType.All) { return true; }
            return browserType.HasFlag(RequestingBrowser);
        }

        protected void ScriptManager1_Load(object sender, EventArgs e)
        {
            foreach (var w in _waitingScripts)
            {
                InsertScript(w);
            }
        }
    }
}
