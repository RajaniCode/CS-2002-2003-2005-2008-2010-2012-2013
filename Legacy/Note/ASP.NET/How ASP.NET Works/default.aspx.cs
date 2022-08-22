using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace HowAspNetWorks
{
	/// <summary>
	/// Summary description for _default.
	/// </summary>
	public class _default : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.LinkButton btnMessage;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.btnMessage.Click += new System.EventHandler(this.btnMessage_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnMessage_Click(object sender, System.EventArgs e)
		{
			MessageDisplay.DisplayMessage("Message Display Sample",
@"This page is dynamically generated with this simple code:<P>
<pre>
   MessageDisplay.DisplayMessage(""Message Display Sample"",
                                 ""This pages is..."",
                                 ""default.aspx"",10);
</pre>
<p>
Note this display page has been stripped of its user controls and is left in very basic state.
You can customize this page as needed to look fit your application's theme.
<p>
This page will redirect in 10 seconds to default.aspx

","default.aspx",10);

		}

		private void btnLogViewer_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("Admin/ShowRequestLog.aspx");
		}
	}
}
