
using System;
using System.IO;
using System.Web;
using System.Web.Caching;

using System.Text;

using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Text;

namespace HowAspNetWorks
{
	/// <summary>
	/// Summary description for SharewareModule.
	/// </summary>
	public class SharewareMessageModule : IHttpModule
	{
		private const string SharewareMessage = 
			@"<br clear='all'><p><table align='center' width='100%' cellpadding='6' bgcolor='darkblue'>
<tr><td><img src='images/poweredbywwstore.gif'></td>
<td style='color:white;font-weight:bold' valign='center'>This is a <b>non-registered version</b> of the
<a href='http://www.west-wind.com/WestwindWebStore/' style='font-weight:bold;color:yellow;text-decoration:none'>West Wind Web Store</a>.
If you are running in a production environment, please <a href='http://www.west-wind.com/WestwindWebStore/' style='font-weight:bold;color:yellow;text-decoration:none'>register</a> this copy.
</td></tr></table>";


		#region IHttpModule Members


		public void Init(HttpApplication application)
		{
			application.PostRequestHandlerExecute += new EventHandler(application_PostRequestHandlerExecute);
		}

		public void Dispose()
		{
		}

		#endregion


		private void application_PostRequestHandlerExecute(object sender, EventArgs e)
		{
			HttpApplication app = (HttpApplication) sender;
			
			// *** Must make sure we don't add this to data responses!!!
			if (app.Context.Response.ContentType.ToLower() == "text/html")
				app.Context.Response.Write(SharewareMessage);

		}

	}
}

