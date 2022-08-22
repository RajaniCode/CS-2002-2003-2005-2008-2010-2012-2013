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

using Westwind.Tools;

namespace HowAspNetWorks
{
	/// <summary>
	/// Summary description for ShowLog.
	/// </summary>
	public class ShowLog : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblErrorMessage;
		protected System.Web.UI.WebControls.LinkButton btnClearLog;

		protected int EntriesShown = 0;
		protected System.Web.UI.WebControls.DataGrid oGrid;
		protected int TotalEntries = 0;
		protected System.Web.UI.WebControls.DropDownList lstTypes;
		protected System.Web.UI.WebControls.LinkButton btnRefresh;
		protected System.Web.UI.WebControls.LinkButton btnCreateLog;
		protected string LoggingDisabledMessage = "";
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// *** Allow page to select how many to show
			int ShowCount = 0;
			try 
			{
				ShowCount = Int32.Parse(Request.QueryString["ShowCount"]);	
			}
			catch {;}

			string LogType = this.lstTypes.SelectedValue; //string LogType = Request.Form["lstTypes"];
			
			DataTable LogEntries = null;
	
			// *** Regular entries are the default
			if (LogType == null || LogType.Length == 0 || LogType == "0") 
			{

				if (ShowCount == 0)
					LogEntries = WebRequestLog.RetrieveLogTable(App.Configuration.ConnectionString);
				else
					LogEntries = WebRequestLog.RetrieveLogTable(App.Configuration.ConnectionString,ShowCount);

				this.TotalEntries = WebRequestLog.GetLogCount(App.Configuration.ConnectionString);
			}
			else if (LogType == "1")   // Errors 
			{
				LogEntries = WebRequestLog.RetrieveErrors(App.Configuration.ConnectionString);
				TotalEntries = LogEntries.Rows.Count;
			}
			else if (LogType == "2")  // Application Messages
			{
				LogEntries = WebRequestLog.RetrieveApplicationMessages(App.Configuration.ConnectionString);
				TotalEntries = LogEntries.Rows.Count;
			}

			if (LogEntries == null) 
			{
					this.lblErrorMessage.Text = "Couldn't get log items.";
					return;
			}

			// *** Update the counters
			this.EntriesShown = LogEntries.Rows.Count;

			this.oGrid.DataSource = LogEntries.DefaultView;
			this.oGrid.DataBind();


			if (!App.Configuration.LogWebRequests)
				this.LoggingDisabledMessage = "<br><span style='color:red'><b>Logging is currently disabled. Use the <a href='Configuration.aspx'>Configuration Page</a> to enabled it.<b></span>";
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
			this.btnRefresh.Click += new System.EventHandler(this.btnRefresh_Click);
			this.btnClearLog.Click += new System.EventHandler(this.btnClearLog_Click);
			this.btnCreateLog.Click += new System.EventHandler(this.btnCreateLog_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnClearLog_Click(object sender, System.EventArgs e)
		{
			Westwind.Tools.WebRequestLog.ClearLog(App.Configuration.ConnectionString);
			Response.Redirect("ShowRequestLog.aspx");

		}
		
		protected void oGrid_OnPageIndexChanged(object sender, DataGridPageChangedEventArgs e) 
		{
			this.oGrid.CurrentPageIndex = e.NewPageIndex;
			this.oGrid.DataBind();
		}

		private void btnRefresh_Click(object sender, System.EventArgs e)
		{
			// *** Do nothing - just force to reload 
		}

		private void btnCreateLog_Click(object sender, System.EventArgs e)
		{
			Westwind.Tools.WebRequestLog.CreateLogTable(App.Configuration.ConnectionString);
			Response.Redirect("ShowRequestLog.aspx");
		}
	}
}
