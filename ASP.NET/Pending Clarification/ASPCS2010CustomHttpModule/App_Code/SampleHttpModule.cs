using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SampleHttpModule
/// </summary>
public class SampleHttpModule : IHttpModule
{
	public SampleHttpModule()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public String ModuleName
    {
        get { return "SampleHttpModule"; }
    }

    // In the Init function, register for HttpApplication 
    // events by adding your handlers.
    public void Init(HttpApplication application)
    {
        application.BeginRequest +=
            (new EventHandler(this.Application_BeginRequest));
        application.EndRequest +=
            (new EventHandler(this.Application_EndRequest));
    }

    private void Application_BeginRequest(Object source, EventArgs e)
    {
        // Create HttpApplication and HttpContext objects to access
        // request and response properties.
        HttpApplication application = (HttpApplication)source;
        HttpContext context = application.Context;
        string filePath = context.Request.FilePath;
        string fileExtension =
            VirtualPathUtility.GetExtension(filePath);
        if (fileExtension.Equals(".aspx"))
        {
            context.Response.Write("<h1><font color=red>" +
                "SampleHttpModule: Beginning of Request" +
                "</font></h1><hr>");
        }
    }

    private void Application_EndRequest(Object source, EventArgs e)
    {
        HttpApplication application = (HttpApplication)source;
        HttpContext context = application.Context;
        string filePath = context.Request.FilePath;
        string fileExtension =
            VirtualPathUtility.GetExtension(filePath);
        if (fileExtension.Equals(".aspx"))
        {
            context.Response.Write("<hr><h1><font color=red>" +
                "SampleHttpModule: End of Request</font></h1>");
        }
    }

    public void Dispose() { }
}