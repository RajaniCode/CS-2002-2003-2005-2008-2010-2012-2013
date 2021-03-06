using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace ASPCS2008FormsAuthentication
{
    public class CustomPrincipal : System.Security.Principal.IPrincipal
    {
        private CustomIdentity _identity;

        public CustomPrincipal(CustomIdentity identity)
        {
            _identity = identity;
        }

        public System.Security.Principal.IIdentity Identity
        {
            get { return _identity; }
        }

        public bool IsInRole(string role)
        {
            return false;
        }
    }
}
