///
// *** Example taken from Anatoly Lubarsky Blog and slightly modified
//     http://gensystem.europe.webmatrixhosting.net/al/articles/146.aspx
//
//   Recommend you override this class and implement the AuthenticateUser
//   method to provide your custom user validation.

/*
####################################################################
#    Components/AuthBasic.cs
#
#
####################################################################
*/

using System;
using System.Collections;
using System.Configuration;
using System.Security.Principal;
using System.Text;
using System.Web;


namespace HowAspNetWorks
{
	// Implementation of IHttpModule interface
	// class AuthBasic

public class BasicAuthCustomModule : IHttpModule
{
		public BasicAuthCustomModule() { }
		public void Dispose() { }


		public void Init(HttpApplication application)
		{
			application.AuthenticateRequest += new EventHandler(this.OnAuthenticateRequest);
			application.EndRequest += new EventHandler(this.OnEndRequest);
		}

		protected virtual  bool AuthenticateUser(string username,string password) 
		{
			if (username == "rstrahl")
				return true;

			return false;
		}


		// First method OnAuthenticateRequest, that implements authentication logic step 1

		/*
		####################################################################
		# OnAuthenticateRequest
		# 
		#
		# 
		####################################################################
		*/
		public void OnAuthenticateRequest(object source, EventArgs eventArgs)
		{
			HttpApplication app = (HttpApplication) source;

			// then follow authentication logic
			// get Http header "Authorization"
			// check if not empty

			string authorization = app.Request.Headers["Authorization"];
			if ((authorization == null) || (authorization.Length == 0))
			{
				//AccessDenied(app);
				return;
			}

			// check if Http header has the syntax of basic
			authorization = authorization.Trim();
			if ( !authorization.StartsWith("Basic") )
			{
				// *** Not validating
				return;
			}

			// cut the word "basic" and decode from base64
			// get "username:password"

			byte[] tempConverted = Convert.FromBase64String(authorization.Substring(6));
			string userInfo = new ASCIIEncoding().GetString(tempConverted);

			// get "username"
			// get "password"

			string[] usernamePassword = userInfo.Split(new char[] {':'});
			string username = usernamePassword[0];
			string password = usernamePassword[1];

			// compare username, password against the values, stored in the database
			// if everything is fine, get user group list from the database
			// and create an instance of GenericPrincipal

			string[] groups;
			if (this.AuthenticateUser( username, password) )
			{
				app.Context.User = new GenericPrincipal(new GenericIdentity(username, 
					"Custom Basic Authentication"),null);
			}

				// else, AccessDenied

			else
			{
				AccessDenied(app);
				return;
			}
		}



		// Second method OnEndRequest, that implements authentication logic step 2

		/*
		##########################################################################
		# OnEndRequest
		# < summary>
		#
		# 
		##########################################################################
		*/
		public void OnEndRequest(object source, EventArgs eventArgs)
		{
			HttpApplication app = (HttpApplication) source;
			if (app.Response.StatusCode == 401)
			{

				// Show modal window, realm string is saved in web.config

				string realm = String.Format("Basic");
//				Realm=\"{0}\"", 
//					ConfigurationSettings.AppSettings["HTTPAuth.Components.AuthBasic_Realm"]);
				app.Response.AppendHeader("WWW-Authenticate", realm);
			}
		}


		// Restrict access - Unauthorized

		/*
		##########################################################################
		# AccessDenied
		# 401 - Access Denied
		# < summary>
		# app      in ;  HttpApplication
		# 
		##########################################################################
		*/
		private void AccessDenied(HttpApplication app)
		{
			app.Response.StatusCode = 401;
			app.Response.StatusDescription = "Access Denied";

			// write to browser

			app.Response.Write("401 Access Denied");
			app.CompleteRequest();
		}


		
		
	}
}

