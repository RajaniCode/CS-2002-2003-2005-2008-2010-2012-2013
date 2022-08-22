using System;
using System.Collections;
using System.ComponentModel;
using System.Data;

using System.Drawing;
using System.Drawing.Imaging;

using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Westwind.WebStore.Demos
{
	/// <summary>
	/// Sample page that generates thumbnail images. Pass the name of the image to dynamically
	/// thumbnail as a querystraing parameter named Image:
	/// 
	/// http://localhost/projects/howaspnetworks/CreateThumbNail.aspx?image=images\wwWebstore.gif
	/// </summary>
	public class CreateThumbNail : System.Web.UI.Page
	{
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

		private void Page_Load(object sender, System.EventArgs e)
		{

	
			string Image = Request.QueryString["Image"];
			if (Image == null)  
			{
				this.ErrorResult();
				return;
			}

			string sSize = Request["Size"]; 
			int Size = 120;
			if (sSize != null)
				Size = Int32.Parse(sSize);

			string Path = Server.MapPath(Request.ApplicationPath) + "\\" + Image;
			Bitmap bmp = CreateThumbnail(Path,Size,Size);

			if (bmp == null) 
			{
				this.ErrorResult();
				return;
			}

			string OutputFilename = null;
			OutputFilename = Request.QueryString["OutputFilename"];

			if (OutputFilename != null) 
			{
				if (this.User.Identity.Name == "")  
				{
					// *** Custom error display here
					bmp.Dispose();
					this.ErrorResult();
				}
				try 
				{
					bmp.Save(OutputFilename);
				}
				catch 
				{
					bmp.Dispose();
					this.ErrorResult();
					return;
				}
			}

			// Put user code to initialize the page here
			Response.ContentType = "image/jpeg";
			bmp.Save(Response.OutputStream,System.Drawing.Imaging.ImageFormat.Jpeg);
			bmp.Dispose();
		}

		private void ErrorResult()
		{
			Response.Clear();
			Response.StatusCode = 404; 
			Response.End();
		}

		/// <summary>
		/// Creates a resized bitmap from an existing image on disk.
		/// Call Dispose on the returned Bitmap object
		/// </summary>
		/// <param name="lcFilename"></param>
		/// <param name="lnWidth"></param>
		/// <param name="lnHeight"></param>
		/// <returns>Bitmap or null</returns>
		public static Bitmap CreateThumbnail(string lcFilename,int lnWidth, int lnHeight)
		{
	
			System.Drawing.Bitmap bmpOut = null;
			try 
			{
				Bitmap loBMP = new Bitmap(lcFilename);
				ImageFormat loFormat = loBMP.RawFormat;

				decimal lnRatio;
				int lnNewWidth = 0;
				int lnNewHeight = 0;

				//*** If the image is smaller than a thumbnail just return it
				if (loBMP.Width < lnWidth && loBMP.Height < lnHeight) 
					return loBMP;
		

				if (loBMP.Width > loBMP.Height)
				{
					lnRatio = (decimal) lnWidth / loBMP.Width;
					lnNewWidth = lnWidth;
					decimal lnTemp = loBMP.Height * lnRatio;
					lnNewHeight = (int)lnTemp;
				}
				else 
				{
					lnRatio = (decimal) lnHeight / loBMP.Height;
					lnNewHeight = lnHeight;
					decimal lnTemp = loBMP.Width * lnRatio;
					lnNewWidth = (int) lnTemp;
				}

				// System.Drawing.Image imgOut = loBMP.GetThumbnailImage(lnNewWidth,lnNewHeight,null,IntPtr.Zero);
			
				// *** This code creates cleaner (though bigger) thumbnails and properly
				// *** and handles GIF files better by generating a white background for
				// *** transparent images (as opposed to black)
				bmpOut = new Bitmap(lnNewWidth, lnNewHeight);
				Graphics g = Graphics.FromImage(bmpOut);
				g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
				g.FillRectangle( Brushes.White,0,0,lnNewWidth,lnNewHeight);
				g.DrawImage(loBMP,0,0,lnNewWidth,lnNewHeight);

				loBMP.Dispose();
			}
			catch 
			{
				return null;
			}
	
			return bmpOut;
		}


	}
}
