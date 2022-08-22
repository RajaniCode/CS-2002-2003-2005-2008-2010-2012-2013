using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
 

namespace Westwind.Web.Controls
{
 
	/// <summary>
	/// This class is used to display messages with a single command via the 
	/// DisplayMessage() method. This class also has the ability to automatically 
	/// redirect to another page which allows moving to new pages and still be able
	///  to set Cookies if required.
	/// 
	/// This class is abstract and requires an application specific subclass - 
	/// generally MessageDisplay.aspx that must follow a few simple but 
	/// <see>Creating a custom MessageDisplay page</see>.
	/// 
	/// <<b>>Namespace:<</b>> Westwind.Web.Controls
	/// <<b>>Inherits:<</b>> Page
	/// </summary>
public class wwMessageDisplay : System.Web.UI.Page
{
		
		/// <summary>
		/// Static member that determines the name of the MessageDisplay page.
		/// </summary>
		public static string Pagename = "MessageDisplay.aspx";


		/// <summary>
		/// Internal. Used for setting the META tag in the ASPX HTML document. 
		/// </summary>
		protected string RedirectMetaTag = null;

		/// <summary>
		/// This property is set during the loading of the page and can be used
		/// inside of the page to allow relative links to be found.
		/// </summary>
		protected string BasePath = "";

		/// <summary>
		/// The Header to be displayed on the page. Used only in the 'display' code.
		/// </summary>
		protected string Header 
		{
			get {  return  (string) Context.Items["ErrorMessage_Header"]; }
		}

		/// <summary>
		/// The message to be displayed on the page. This text may be in HTML format. Used only in the display code.
		/// </summary>
		protected string Message 
		{
			get 
			{	return (string) Context.Items["ErrorMessage_Message"]; }
		}

		/// <summary>
		/// The Url to redirect to. Optional. Used only in the display code
		/// </summary>
		protected string RedirectUrl
		{
			get {	return (string) Context.Items["ErrorMessage_RedirectUrl"]; }
		}

		/// <summary>
		/// Displays the page with the appropriate controls filled in.
		/// </summary>
		/// <remarks>Assumes that lblHeader, lblMessage, lblRedirectHyperLink are defined.</remarks>
		public void DisplayPage(Label Header,Label Message,Label RedirectHyperLink) 
		{
			
			Header.Text = this.Header;
			Message.Text = this.Message;

			string Port = Request.ServerVariables["SERVER_PORT"];
			if (Port == null || Port == "80" || Port == "443")
				Port = "";
			else
				Port = ":" + Port;

			string Protocol = Request.ServerVariables["SERVER_PORT_SECURE"];
			if (Protocol == null || Protocol == "0")
				Protocol = "http://";
			else
				Protocol = "https://";

			// *** Figure out the base Url which points at the application's root
			this.BasePath =  Protocol + Request.ServerVariables["SERVER_NAME"] + 
				Port + this.ResolveUrl(Request.ApplicationPath);


			if (this.RedirectUrl != null) 
			{
				string NewUrl = this.RedirectUrl;

				/// *** Must fix up the path in case we're in a separate sub-dir
				/// *** because the page is using <base> we must include the full relative path
				if (NewUrl.StartsWith("~") || NewUrl.StartsWith("/") )
					NewUrl = this.ResolveUrl(NewUrl);
				else if ( !NewUrl.ToLower().StartsWith("http:") && !NewUrl.ToLower().StartsWith("https:") ) 
				{
					// *** It's a relative Path. Must use current server path  + relative path
					string t = this.TemplateSourceDirectory;
					NewUrl = Request.FilePath.Substring( 0, Request.FilePath.LastIndexOf("/") + 1) +  NewUrl;
				}

				this.RedirectMetaTag = 
					string.Format("<META HTTP-EQUIV='Refresh' CONTENT='{0}; URL={1}'>\r\n",
					              this.Context.Items["ErrorMessage_Timeout"],NewUrl);
			
				RedirectHyperLink.Text = "<a href='" + NewUrl +  "'>Click here</a> if your browser is not automatically continuing.";
			}
		}
		
		/// <summary>
		/// Displays the page by setting the lblHeader, lblMessage and lblRedirectHyperLink controls
		/// </summary>
		public void DisplayPage() 
		{
			this.DisplayPage((Label) this.FindControl("lblHeader"),
							 (Label) this.FindControl("lblMessage"),
							 (Label) this.FindControl("lblRedirectHyperLink"));
		}


		/// <summary>
		/// Generates a self-contained error message display page that issues a 
		/// Server.Transfer to the MessageDisplay.aspx page in your application root.
		/// <seealso>Class wwMessageDisplay</seealso>
		/// </summary>
		/// <param name="Header">
		/// Header message and title of the page
		/// </param>
		/// <param name="Message">
		/// The body of the message - this is HTML
		/// </param>
		/// <param name="RedirectUrl">
		/// Url to redirect to
		/// </param>
		/// <param name="Timeout">
		/// Timeout for the page before redirecting
		/// </param>
		/// <returns>Void</returns>
		/// <example>
		/// MessageDisplay.DisplayMessage("Clearing Profile",
		/// 	"We're clearing out your profile to log you out of the "+
		/// 	App.Configuration.StoreName + " for this computer.",
		/// 	"/default.aspx",4);
		/// </example>
		public static void DisplayMessage(string TemplatePageName, 
			string Header, string Message, string RedirectUrl, int Timeout)
		{
			HttpContext Context = HttpContext.Current;
			Context.Items.Add("ErrorMessage_Header",Header);
			Context.Items.Add("ErrorMessage_Message",Message);
			Context.Items.Add("ErrorMessage_Timeout",Timeout);
			Context.Items.Add("ErrorMessage_RedirectUrl",RedirectUrl);
			
			Context.Server.Transfer(Context.Request.ApplicationPath + "/" + TemplatePageName);
		}

		/// <summary>
		/// Generates a self-contained error message display page that issues a 
		/// Server.Transfer to the MessageDisplay.aspx page in your application root.
		/// <seealso>Class wwMessageDisplay</seealso>
		/// </summary>
		/// <param name="Header">
		/// Header message and title of the page
		/// </param>
		/// <param name="Message">
		/// The body of the message - this is HTML
		/// </param>
		/// <param name="RedirectUrl">
		/// Url to redirect to
		/// </param>
		/// <param name="Timeout">
		/// Timeout for the page before redirecting
		/// </param>
		/// <returns>Void</returns>
		/// <example>
		/// MessageDisplay.DisplayMessage("Clearing Profile",
		/// 	"We're clearing out your profile to log you out of the "+
		/// 	App.Configuration.StoreName + " for this computer.",
		/// 	"/default.aspx",4);
		/// </example>		
		public static void DisplayMessage(string Header, string Message, string RedirectUrl, int Timeout) 
		{
			DisplayMessage(Pagename,Header,Message,RedirectUrl,Timeout);
		}

		/// <summary>
		/// Generates a self-contained error message display page that issues a 
		/// Server.Transfer to the MessageDisplay.aspx page in your application root.
		/// <seealso>Class wwMessageDisplay</seealso>
		/// </summary>
		/// <param name="Header">
		/// Header message and title of the page
		/// </param>
		/// <param name="Message">
		/// The body of the message - this is HTML
		/// </param>
		/// <returns>Void</returns>
		/// <example>
		/// MessageDisplay.DisplayMessage("Clearing Profile",
		/// 	"We're clearing out your profile to log you out of the "+
		/// 	App.Configuration.StoreName + " for this computer.",
		/// 	"/default.aspx",4);
		/// </example>
		public static void DisplayMessage(string Header, string Message)
		{
			DisplayMessage(Header,Message,null,0);
		}
	}


}
