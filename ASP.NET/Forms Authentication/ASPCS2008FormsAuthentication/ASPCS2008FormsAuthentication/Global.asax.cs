using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Xml.Linq;

using System.Security.Principal;
using System.Threading;

namespace ASPCS2008FormsAuthentication
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

        private void Application_OnPostAuthenticateRequest(object sender, EventArgs e)
        {
            // Get a reference to the current User
            IPrincipal usr = HttpContext.Current.User;

            // If we are dealing with an authenticated forms authentication request
            if (usr.Identity.IsAuthenticated && usr.Identity.AuthenticationType == "Forms")
            {
                FormsIdentity fIdent = usr.Identity as FormsIdentity;

                // Create a CustomIdentity based on the FormsAuthenticationTicket           
                CustomIdentity ci = new CustomIdentity(fIdent.Ticket);

                // Create the CustomPrincipal
                CustomPrincipal p = new CustomPrincipal(ci);

                // Attach the CustomPrincipal to HttpContext.User and Thread.CurrentPrincipal
                HttpContext.Current.User = p;
                Thread.CurrentPrincipal = p;
            }
        }
    }
}