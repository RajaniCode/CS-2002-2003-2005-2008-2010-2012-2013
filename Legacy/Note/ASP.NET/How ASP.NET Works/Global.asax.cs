
using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;

using Westwind.Tools;

namespace HowAspNetWorks
{
	class App 
	{
		// *** Static property so it's globally available
		// *** anywhere as:   App.Configuration
		public static WebStoreConfig Configuration; 

		// *** Use a static constructor to load Config once
		static App() 
		{
			Configuration = new WebStoreConfig();
		}
	}

	class WebStoreConfig : wwAppConfiguration
	{
		public WebStoreConfig()
		{
			// *** Read config settings and write
			// *** them out if they don't exist 
			this.ReadKeysFromConfig();

		

		}
		
		// *** Connection String used to log each request to Sql Server
		// *** You can use the Admin ShowRequestLog page to create the log in this database
		// *** Asumming the account you specfy has rights to do this
		public string ConnectionString = "server=(local);database=pubs;uid=demo;pwd=demo;enlist=false;";
		public bool LogWebRequests = false;
		
		// *** Make sure you allow READ/WRITE access to the Web Account!
		public string ErrorLogFile = "admin/ErrorLog.xml";

		// *** Determines how error messages are displayed
		// *** 0 - ASP.Net default, 1 - Application Error, 2 - Detailed Dev message
		public int DebugMode = 0;
	}


	/// <summary>
	/// Summary description for Global.
	/// </summary>
	public class Global : System.Web.HttpApplication
	{
		/// <summary>
		///  Demonstrate Application Pool behavior
		/// </summary>
		public string ApplicationId = Guid.NewGuid().ToString();

		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		public Global()
		{
			InitializeComponent();
		}	
		
		protected void Application_Start(Object sender, EventArgs e)
		{
		}
 
		protected void Session_Start(Object sender, EventArgs e)
		{

		}

		protected void Application_BeginRequest(Object sender, EventArgs e)
		{

#if false  // *** Request Logging Example
			
			if (App.Configuration.LogWebRequests)
				Context.Items.Add("WebLog_StartTime",DateTime.Now);
#endif
		}

		protected void Application_EndRequest(Object sender, EventArgs e)
		{
	
#if false  // *** Request Logging Sample
			// *** Request Logging
			if (App.Configuration.LogWebRequests) 
			{
				try 
				{	
					Westwind.Tools.WebRequestLog.Log(App.Configuration.ConnectionString,true,(DateTime) Context.Items["WebLog_StartTime"]);
				}
				catch {;}
			}
#endif
		}

		protected void Application_AuthenticateRequest(Object sender, EventArgs e)
		{
#if false   // *** Authenticate all requests to the Admin directory programmatically
			if ( HttpContext.Current.Request.FilePath.ToLower().IndexOf( "/admin/"  ) > -1  )
			{	
				if (!HttpContext.Current.User.Identity.IsAuthenticated ) 
				{
					HttpResponse Response = HttpContext.Current.Response;

					Response.ClearHeaders();
					//Response.StatusCode = 401;
					Response.Status = "401 - Not Authorized";
					Response.AddHeader("WWW-Authenticate:","BASIC");
					Response.End();
				}
			}

// *** Other things you can do here: Create a custom principle based on your own auth scheme!
//				else if (HttpContext.Current.User.Identity.AuthenticationType == "wwPhotoAlbum") 
//				{
//					PhotoAlbumUser AuthUser =  HttpContext.Current.Session["AuthUser"] as PhotoAlbumUser;
//					if (AuthUser == null)
//					{
//						AuthUser = new PhotoAlbumUser("rstrahl","wwPhotoAlbum");
//						AuthUser.IsAdmin = true;
//						AuthUser.AllowViewing = true;
//						HttpContext.Current.Session["AuthUser"] =  AuthUser;
//					}
//
//					IPrincipal Princ = new System.Security.Principal.GenericPrincipal(AuthUser,null);
//					HttpContext.Current.User = Princ;
//				}

#endif


		}

		protected void Application_Error(Object sender, EventArgs e)
		{
			WebErrorHandler Handler = new WebErrorHandler(Server.GetLastError().InnerException);

			if (App.Configuration.ErrorLogFile != "") 
			{
				Handler.LogFileName = App.Configuration.ErrorLogFile;
				
				Handler.LogErrorToXml(true);
				//Handler.LogErrorToSql(App.Configuration.ConnectionString);
			}
	
			// *** Retrieve the detailed String information of the Error
			string ErrorDetail = Handler.ToString();
	
			// *** Optionally email it to the Admin contacts set up in WebStoreConfig
//			if (App.Configuration.SendAdminEmail)
//				WebStoreUtils.SendAdminEmail(App.Configuration.StoreName + "Error: " + Request.RawUrl,ErrorDetail);

	
			// *** Debug modes handle different error display mechanisms
			// *** 0  - default ASP.Net - depends on web.config settings
			// *** 1  - display a generic application error message with no error info
			// *** 2  - display a detailed error message with full error info independent of web.config setting
			if (App.Configuration.DebugMode == 2) 
			{
				Server.ClearError();
				MessageDisplay.DisplayMessage("Application Error","<pre style='font: normal 8pt Arial'>" + ErrorDetail + "</pre>");
				return;
			}
			else if (App.Configuration.DebugMode == 1)
			{
				//Response.Clear();
				Server.ClearError();
				MessageDisplay.DisplayMessage("Application Error",
					"We're sorry, but an unhandled error occurred on the server. " +
					"The Server Administrator has been notified and the error logged.<p>" +
					"Please continue on by either clicking the back button and retrying your request or by returning to the home page.<p>" + 
					"<center><b><a href='~/'>Web Store Home Page</a></b></center>");
				return;
			}

			return;

		}

		protected void Session_End(Object sender, EventArgs e)
		{

		}

		protected void Application_End(Object sender, EventArgs e)
		{

		}
			
		#region Web Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.components = new System.ComponentModel.Container();
		}
		#endregion
	}
}

