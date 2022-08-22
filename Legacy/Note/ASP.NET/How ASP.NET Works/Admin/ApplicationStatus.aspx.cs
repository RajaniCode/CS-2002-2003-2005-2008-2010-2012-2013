using System;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Diagnostics;
using System.Globalization;

using Westwind.Tools;

namespace HowAspNetWorks
{
	/// <summary>
	/// Summary description for ApplicationStatus.
	/// </summary>
	public class ApplicationStatus : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblErrorMessage;
		protected System.Web.UI.WebControls.LinkButton btnClearXmlLog;
		protected System.Web.UI.WebControls.LinkButton btnXMLErrorLog;
		
		protected PerformanceCounter Counter = null;
		protected long SqlConnections = 0;
		protected long SqlLocks = 0;
		protected long ASPNetUsers = 0;
		protected System.Web.UI.WebControls.DataGrid CounterList;
		protected System.Web.UI.HtmlControls.HtmlForm Form1;
		protected System.Web.UI.WebControls.LinkButton btnThrowError;

		protected DataTable dt = null;

		private void Page_Load(object sender, System.EventArgs e)
		{


			dt = new DataTable();
			dt.Columns.Add("Counter",typeof(string));
			dt.Columns.Add("Value",typeof(float));

			this.AddCounter("Processor", "% Processor Time", "_Total","CPU Utilization",100);

			this.AddCounter("SQLServer:General Statistics", "User Connections",null,
                            "Sql User Connections");
			
//			this.AddCounter(".NET CLR Data", "SqlClient: Current # pooled connections","_global_");
//			this.AddCounter(".NET CLR Data", "SqlClient: Current # connection pools","_global_");
			this.AddCounter(".NET CLR Data", "SqlClient: Total # failed connects","_global_");
		
			this.AddCounter("ASP.NET", "Request Wait Time",null,
				"ASP.Net Request Wait Time");

			this.AddCounter("ASP.NET","Requests Current",null,
				"ASP.Net Current Requests");

			this.AddCounter("ASP.NET", "State Server Sessions Active",null,
				"State Server Sessions");

			this.CounterList.DataSource = this.dt;
			this.CounterList.DataBind();
		}

		protected void AddCounter(string Counter,string SubCounter) 
		{
			 this.AddCounter(Counter,SubCounter,null,null);
		}		
		protected void AddCounter(string Counter,string SubCounter, string Instance) 
		{
			this.AddCounter(Counter,SubCounter,Instance,null);
		}
		protected void AddCounter(string Counter,string SubCounter, string Instance, 
			string Key) 
		{
			this.AddCounter(Counter,SubCounter,Instance,Key,1);
		}
		
		protected void AddCounter(string Counter,string SubCounter, string Instance, 
			                      string Key,int Samples) 
		{
			float Value = 0.00F;
			try 
			{
				if (Instance != null)
					this.Counter = new PerformanceCounter(Counter,SubCounter,Instance);
				else
					this.Counter = new PerformanceCounter(Counter,SubCounter);
				
				if (Samples > 1)  
				{
					for (int x=0; x < Samples; x++) 
					{
						Value = Value + this.Counter.NextValue();
						System.Threading.Thread.Sleep(5);
					}
					Value = Value / (float) Samples;
				}
				else 
					Value = this.Counter.NextValue();

//
//				for (int x = 0; x < Samples; x++)
//					Value =  Value + this.Counter.NextValue();
//				
//				Value = Value / Samples;
			}
			catch
			{
				Value =  -1.00F;
			}

			DataRow dr = this.dt.NewRow();
			if (Key == null)
				Key = SubCounter;

			dr["Counter"] = Key;
			dr["Value"] = Value;
			dt.Rows.Add(dr);
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
			this.btnXMLErrorLog.Click += new System.EventHandler(this.btnXMLErrorLog_Click);
			this.btnClearXmlLog.Click += new System.EventHandler(this.btnClearXmlLog_Click);
			this.btnThrowError.Click += new System.EventHandler(this.btnThrowError_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnClearXmlLog_Click(object sender, System.EventArgs e)
		{
			WebErrorHandler Handler = new WebErrorHandler(); 
			Handler.LogFileName = App.Configuration.ErrorLogFile;
			if (Handler.ClearXmlLog())
				this.lblErrorMessage.Text = "Log Cleared.";
			else
				this.lblErrorMessage.Text = "Log could not be cleared.";
		}

		private void btnXMLErrorLog_Click(object sender, System.EventArgs e)
		{
			WebErrorHandler Handler = new WebErrorHandler(); 
			Handler.LogFileName = App.Configuration.ErrorLogFile;
			Handler.ShowXmlLog();		
		}

		private void btnEraseTrace_Click(object sender, System.EventArgs e)
		{
			string TraceFile = Request.PhysicalApplicationPath + "admin\\traceLog.txt";

			if (File.Exists(TraceFile)) 
			{
				try 
				{
					File.Delete( TraceFile );
				}
				catch(Exception ex)
				{
					this.lblErrorMessage.Text = "Couldn't delete Trace Log file: " + ex.Message;
					return;
				}
			}
			this.lblErrorMessage.Text = "Trace Log deleted.";
		}

		private void btnThrowError_Click(object sender, System.EventArgs e)
		{
			Bitmap bmp = null;

			int Width = bmp.Width;

		}	
	}
}
