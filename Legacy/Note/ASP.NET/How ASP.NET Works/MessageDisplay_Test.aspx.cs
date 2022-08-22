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
	/// Summary description for MessageDisplay_Test.
	/// </summary>
	public class MessageDisplay_Test : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button btnSubmit;
		protected System.Web.UI.WebControls.TextBox txtHeader;
		protected System.Web.UI.WebControls.TextBox txtMessage;
	
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
			this.btnSubmit.Click += new System.EventHandler(this.btnSubmit_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnSubmit_Click(object sender, System.EventArgs e)
		{
			MessageDisplay.DisplayMessage(this.txtHeader.Text,this.txtMessage.Text,Request.Url.AbsoluteUri,10);
		}
	}
}
