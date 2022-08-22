using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //call SetAuthCookie method to log in. A cookie is created. 
        //Domain name in the cookie defaults to the subdomain where the application resides
        FormsAuthentication.SetAuthCookie(txtUserName.Text, false);

        //modify the Domain attribute of the cookie to the second level of domain
        System.Web.HttpCookie MyCookie = System.Web.Security.FormsAuthentication.GetAuthCookie(User.Identity.Name.ToString(), false);
        MyCookie.Domain = ConfigurationManager.AppSettings["Level2DomainName"];//like miscrosoft.com, dell.com...
        Response.AppendCookie(MyCookie);

        Response.Redirect("ProtectedPage.aspx");
    }
}