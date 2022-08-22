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
	public class ImageSampleModule : IHttpModule
	{

		#region IHttpModule Members


		public void Init(HttpApplication application)
		{
			application.PreRequestHandlerExecute +=new EventHandler(application_PreRequestHandlerExecute);
		}

		public void Dispose()
		{
		}

		#endregion

		private void application_PreRequestHandlerExecute(object sender, EventArgs e)
		{
			HttpApplication app = (HttpApplication) sender;
			HttpRequest Request = app.Request;

			string PhysicalPath = Request.PhysicalPath.ToLower();
			FileInfo fi = new FileInfo(PhysicalPath);
			string Extension = fi.Extension.ToLower();

			// *** Draw Sample onto each JPG image loaded from the 
			if (Extension == ".jpg" && 
				PhysicalPath.ToLower().IndexOf("\\sampleimages\\") > -1)
				
			{
				HttpResponse Response = app.Response;
				
				string FileName = fi.Name.ToLower();
				
				// *** Try to retrieve image from cache
				byte[] BitmapBytes = app.Context.Cache[FileName] as byte[];
				
				if (BitmapBytes != null)
				{
					Response.ContentType = "image/jpeg";
					Response.BinaryWrite( BitmapBytes );
					Response.End();
				}

				// *** Make sure we return standard response on file not found
				if (!fi.Exists) 
				{
					Response.Clear();
					Response.StatusCode = 404; 
					Response.Status = "404 - File not found";
					Response.End();
					//return;
				}
				
				Bitmap bmp = new Bitmap(PhysicalPath);

				using(bmp) 
				{
					Graphics g = Graphics.FromImage(bmp);
					g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
					g.TextRenderingHint = TextRenderingHint.AntiAlias;
					
					int FontSize = bmp.Width / 5;

					g.TranslateTransform(200,-120);  //Fudged value
					g.RotateTransform(35);

					SizeF size = g.MeasureString ("Sample",
						new Font("Arial Black",FontSize,FontStyle.Bold,GraphicsUnit.Pixel));

					int Y = (int) ((bmp.Height - size.Height) / 2);
					int X = (int) ((bmp.Width - size.Width) / 2);

					g.DrawString("Sample",
						new Font("Arial Black",FontSize,FontStyle.Bold,GraphicsUnit.Pixel),
						new SolidBrush( Color.FromArgb(150,Color.LightGray)),X,Y);

		
					// *** Write the bitmap into a Memory Stream
					MemoryStream ms = new MemoryStream();
					bmp.Save(ms,ImageFormat.Jpeg);
					ms.Close();

					// *** Send it back to the browser
					Response.Clear();
					Response.ContentType = "image/jpeg";	
					Response.BinaryWrite(ms.GetBuffer());
			
					// *** Also write it into the Cache
					app.Context.Cache.Add(FileName,ms.GetBuffer(),null,
						                  DateTime.Now.AddMinutes(10),TimeSpan.Zero,
										System.Web.Caching.CacheItemPriority.Normal,
						null);
				
					// *** Our work here is done!
					Response.End();
				}
			}
		}

		static public void ImageRemovedCallback(String key, Object item, 
			CacheItemRemovedReason reason) 
		{
			((Bitmap)item).Dispose();
		}
	}
}

