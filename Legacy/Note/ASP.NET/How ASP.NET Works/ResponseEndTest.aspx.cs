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
using System.Text;
using System.IO;

namespace HowAspNetWorks
{
	/// <summary>
	/// Summary description for ResponseEndTest.
	/// </summary>
	public class ResponseEndTest : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.CheckBox chkResponseEnd;


	private void Page_Load(object sender, System.EventArgs e)
	{
		Response.Write("<h1>Hello Cruel World</h1>");
		
		if (this.chkResponseEnd.Checked)
			Response.End();
		//Server.Transfer("default.aspx",false);

#if false   // *** Use Server.Execute to embed content
		// *** Now call the other page and load into StringWriter
		string MergedText = null;
		StringWriter sw = new StringWriter();
		try 
		{
			// *** IMPORTANT: Child page's FilePath still points at current page
			//                QueryString provided is mapped into new page and then reset
			Context.Server.Execute("default.aspx",sw); 
			MergedText =  sw.ToString();
		}
		catch 
		{
			MergedText = null;
		}

		Response.Write(MergedText);
#endif

		Response.Write("<h1>Goodbye Cruel World</h1>");
	}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
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
