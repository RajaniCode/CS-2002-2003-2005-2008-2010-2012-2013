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
        Response.Redirect("ProtectedPage.aspx");
    }
}