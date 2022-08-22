using System.Web;
//using System.Web.Hosting;

using System;

namespace HowAspNetWorks
{
	/// <summary>
	/// Http Handler used to redirect URLs from old Web store apps to 
	/// our application. For example, I point the .wws extension 
	/// at this 
	/// </summary>
	public class PageRedirector_HTTPHandler : IHttpHandler,System.Web.SessionState.IRequiresSessionState
	{

		public bool IsReusable
		{
			get
			{
				return true;
			}
		}

		public void ProcessRequest(HttpContext context)
		{
			HttpRequest  Request = context.Request;

			string OldPath = Request.FilePath.ToLower();
			int LastDot = OldPath.LastIndexOf(".");
			string Extension = null;
			if (LastDot > 0) 
				Extension = OldPath.Substring(LastDot);
			else
				throw new Exception("Invalid Page Name");

			// *** Transfer to the related .aspx page
			context.Server.Transfer( OldPath.Replace(Extension,".aspx") );
		}


	}
}
