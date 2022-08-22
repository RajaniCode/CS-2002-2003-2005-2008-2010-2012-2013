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
	/// Summary description for PageEvents.
	/// </summary>
	public class PageEvents : System.Web.UI.Page
	{
		protected HowAspNetWorks.PageEventsControl txtPlain;
		protected System.Web.UI.HtmlControls.HtmlForm Form1;
		protected System.Web.UI.WebControls.Button btnSumbit;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			this.txtPlain.ForeColor = Color.Red;

			// Put user code to initialize the page here
			Trace.Write("Page Events","Page: *** Page_Load called ***");
			
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			Trace.Write("Page Events","Page: OnInit");
			
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


		protected override void OnLoad(EventArgs e)
		{
			Trace.Write("Page Events","Page: OnLoad");
			base.OnLoad (e);
		}

		protected override void LoadViewState(object savedState)
		{
			Trace.Write("Page Events","Page: LoadViewState");
			base.LoadViewState (savedState);
		}

		protected override object LoadPageStateFromPersistenceMedium()
		{
			Trace.Write("Page Events","Page: LoadPageStateFromPersistenceMedium");
			return base.LoadPageStateFromPersistenceMedium ();
		}
		
		 protected override void OnPreRender(EventArgs e)
		{
			 Trace.Write("Page Events","Page: OnPreRender");
			 base.OnPreRender (e);
		}
		
		protected override void OnDataBinding(EventArgs e)
		{
			Trace.Write("Page Events","Page: OnDataBinding");
			base.OnDataBinding (e);
		}

		protected override void OnUnload(EventArgs e)
		{
			Trace.Write("Page Events","Page: OnUnload");
			base.OnUnload (e);
		}

		protected override void RaisePostBackEvent(IPostBackEventHandler sourceControl, string eventArgument)
		{
			Trace.Write("Page Events","Page: RaisePostBackEvent");
			base.RaisePostBackEvent (sourceControl, eventArgument);
		}

		protected override void SavePageStateToPersistenceMedium(object viewState)
		{
			Trace.Write("Page Events","Page: SavePageStateToPersistenceMedium");
			base.SavePageStateToPersistenceMedium (viewState);
		}

		protected override object SaveViewState()
		{
			Trace.Write("Page Events","Page: SaveViewState");
			return base.SaveViewState ();
		}

		protected override void Render(HtmlTextWriter writer)
		{
			Trace.Write("Page Events","Page: Render");
			base.Render (writer);
		}



		

		protected override System.Collections.Specialized.NameValueCollection DeterminePostBackMode()
		{
			Trace.Write("Page Events","Page: DeterminePostBackMode");
			return base.DeterminePostBackMode ();
		}

		protected override void AddParsedSubObject(object obj)
		{
			Trace.Write("Page Events","Page: AddParsedSubObject ");

			base.AddParsedSubObject (obj);
		}


		
		protected override void AddedControl(Control control, int index)
		{
		
			Trace.Write("Page Events","Page: Added Control");

			base.AddedControl (control, index);
		}

	}
}
