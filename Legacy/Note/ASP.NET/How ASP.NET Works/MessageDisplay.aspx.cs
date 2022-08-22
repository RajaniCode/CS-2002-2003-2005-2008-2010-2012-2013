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
	/// This is a standard error page which is used for application error messages.
	/// Generally this page is called from WebStoreUtils::ErrorMessage.
	/// 'Parameters' are passed to this page via Context items:
	/// ErrorMessage_Header
	/// ErrorMessage_Message
	/// ErrorMessage_Timeout
	/// ErrorMessage_RedirectUrl
	/// </summary>
	public class MessageDisplay : Westwind.Web.Controls.wwMessageDisplay
	{
		protected System.Web.UI.WebControls.Label lblHeader;
		protected System.Web.UI.WebControls.Label lblMessage;
		protected System.Web.UI.WebControls.Label lblRedirectHyperLink;

		protected System.Web.UI.HtmlControls.HtmlForm form1;

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
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Page_Load(object sender, System.EventArgs e)
		{
			// *** Set the display properties and pass down
			this.DisplayPage(this.lblHeader,this.lblMessage,this.lblRedirectHyperLink);
		}
	}
}
