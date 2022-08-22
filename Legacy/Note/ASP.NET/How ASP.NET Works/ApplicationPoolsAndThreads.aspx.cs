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
	/// Summary description for ApplicationPoolsAndThreads.
	/// </summary>
public class ApplicationPoolsAndThreads : System.Web.UI.Page
{
	protected System.Web.UI.HtmlControls.HtmlForm Form1;

	protected string ApplicationId = "";
	protected int ThreadId = 0;
	protected string DomainId = "";
	protected string ThreadInfo = "";

	private void Page_Load(object sender, System.EventArgs e)
	{
		// Put user code to initialize the page here
		this.ApplicationId = ((HowAspNetWorks.Global) 
				HttpContext.Current.ApplicationInstance).ApplicationId ; 
		this.ThreadId = AppDomain.GetCurrentThreadId();

		this.DomainId = AppDomain.CurrentDomain.FriendlyName; 

		this.ThreadInfo = "ThreadPool Thread: " + System.Threading.Thread.CurrentThread.IsThreadPoolThread.ToString() +
							"<br>Thread Apartment: " + System.Threading.Thread.CurrentThread.ApartmentState.ToString();

		bool IsThreadPoolThread = System.Threading.Thread.CurrentThread.IsThreadPoolThread;

		// *** Simulate a slow request so we can see multiple
		//     requests side by side.
		System.Threading.Thread.Sleep(3000);
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
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
