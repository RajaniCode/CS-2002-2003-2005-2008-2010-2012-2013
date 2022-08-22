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
	/// Summary description for PageEventsControl.
	/// </summary>
	[ToolboxBitmap(typeof(TextBox)),DefaultProperty("Text"),
	ToolboxData("<{0}:PageEventsControl runat='server' width='400px' height='22px'></{0}:PageEventsControl>")]
	public class PageEventsControl : TextBox
	{
		TraceContext Trace = null;
		
		public PageEventsControl()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		override protected void OnInit(EventArgs e)
		{
			this.Trace = this.Page.Trace;

			Trace.Write("Control Events","..." + this.ID + " Control Events: OnInit");
			
			base.OnInit(e);
		}
		protected override void OnLoad(EventArgs e)
		{
			Trace.Write("Control Events","..." + this.ID + " Control Events: OnLoad");
			base.OnLoad (e);
		}

		protected override void LoadViewState(object savedState)
		{
			Trace.Write("Control Events","..." + this.ID + "Control Events: LoadViewState");
			base.LoadViewState (savedState);
		}


		
		protected override void OnPreRender(EventArgs e)
		{
			Trace.Write("Control Events","...Control" + this.ID + " Events: OnPreRender");
			base.OnPreRender (e);
		}
		
		protected override void OnDataBinding(EventArgs e)
		{
			Trace.Write("Control Events","..." + this.ID + "Control Events: OnDataBinding");
			base.OnDataBinding (e);
		}

		protected override void OnUnload(EventArgs e)
		{
			Trace.Write("Control Events","..." + this.ID + " Control Events: OnUnload");
			base.OnUnload (e);
		}


		protected override object SaveViewState()
		{
			Trace.Write("Control Events","..." + this.ID + " Control Events: SaveViewState");
			return base.SaveViewState ();
		}

		protected override void Render(HtmlTextWriter writer)
		{
			Trace.Write("Control Events","..." + this.ID + " Control Events: Render");
			base.Render (writer);
		}
	}
}
