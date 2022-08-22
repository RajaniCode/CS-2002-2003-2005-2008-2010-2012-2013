using System;
using System.IO;
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
	/// Summary description for ResponseFilter.
	/// </summary>
	public class ResponseFilter : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblText;
		protected System.Web.UI.HtmlControls.HtmlForm Form1;
		protected System.Web.UI.WebControls.CheckBox chkEnableFilter;
		protected System.Web.UI.WebControls.TextBox TextBox1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			if (this.chkEnableFilter.Checked)
				Response.Filter = new UpperCaseFilter(Response.Filter);
		}

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
	}

	public class UpperCaseFilter : Stream
		// This filter changes all characters passed through it to uppercase.
	{
		private Stream _sink;
		private long _position;

		public UpperCaseFilter(Stream sink)
		{
			_sink = sink;
		}

		// The following members of Stream must be overriden.
		public override bool CanRead
		{
			get { return true; }
		}

		public override bool CanSeek
		{
			get { return true; }
		}

		public override bool CanWrite
		{
			get { return true; }
		}

		public override long Length
		{
			get { return 0; }
		}

		public override long Position
		{
			get { return _position; }
			set { _position = value; }
		}

		public override long Seek(long offset, System.IO.SeekOrigin direction)
		{
			return _sink.Seek(offset, direction);
		}

		public override void SetLength(long length)
		{
			_sink.SetLength(length);
		}

		public override void Close()
		{
			_sink.Close();
		}

		public override void Flush()
		{
			_sink.Flush();
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			return _sink.Read(buffer, offset, count);
		}

		// The Write method actually does the filtering.
		public override void Write(byte[] buffer, int offset, int count)
		{
			for (int i = 0; i < count; i++)
			{
				// *** Change each byte into UPPER CASE
				if (buffer[i] >= 'a' && buffer[i] <= 'z')
					buffer[i] -= ('a'-'A');
			}

			_sink.Write(buffer, 0, count);
       
		}
	}
}


