﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Xml" %>

<script runat="server" language="C#">  
	public void Page_Load(object source, EventArgs e)
	{
		Label1.Visible = false;
		ConfigSections.Visible = false;
	}
	void Enumerate(ConfigurationSectionGroup grp, XmlWriter writeXML)
	{
		ConfigurationSectionCollection configsection = grp.Sections;
		for (int x = 0; x < configsection.Count; x++)
		{
			writeXML.WriteStartElement(configsection[x].SectionInformation.Name);
			writeXML.WriteEndElement();
		}
	}
	protected void Button1_Click(object sender, EventArgs e)
	{
		Label1.Text = TextBox1.Text;
		Configuration con = WebConfigurationManager.OpenWebConfiguration(TextBox1.Text);
		StringWriter textwriter = new StringWriter();
		XmlTextWriter textXml = new XmlTextWriter(textwriter);
		textXml.Formatting = Formatting.Indented;
		textXml.WriteStartElement("configuration");
		Enumerate(con.RootSectionGroup, textXml);
		textXml.WriteFullEndElement();
		textXml.Flush();
		ConfigSections.Text = "\r\n" + Server.HtmlEncode(textwriter.ToString());
		Label1.Visible = true;
		ConfigSections.Visible = true;
		try
		{
			PagesSection section = (PagesSection)con.GetSection("system.web/pages");
			Label2.Text = section.SectionInformation.ToString();
			Label3.Text = section.EnableViewState.ToString();
			String sec = TextBox2.Text;
			ConfigurationSection Settings = con.GetSection(sec);
			Label6.Text = "\r\n" + 
 			Server.HtmlEncode(Settings.SectionInformation.GetRawXml());
			Label5.Text = TextBox2.Text;
		}
		catch
		{
			TextBox1.Text = "invalid section name";
		}
	}
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Configuration Sections</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>
			Enter the Virtual Path of the WebSite:</h2>
			<p>
			&nbsp;<asp:TextBox ID="TextBox1" runat="server" BorderStyle="Double" 
 			Width="464px"></asp:TextBox></p>
			<p>
			Enter section you need to verify &nbsp; &nbsp; &nbsp; &nbsp;<asp:TextBox 
 			ID="TextBox2"
			runat="server" BorderStyle="Double" Width="201px"></asp:TextBox>
			</p>
			<p>
			<asp:Button ID="Button1" runat="server" Text="Verify Settings" 
 			OnClick="Button1_Click" />&nbsp;</p>
			<h2>
			<asp:Label runat="server" ID="Label1" />&nbsp;</h2>
			<p>
			SectionInformation:&nbsp; &nbsp;<asp:Label runat="server" ID="Label2" 
 			/>&nbsp;</p>
			<p>
			EnableViewState: &nbsp; &nbsp; &nbsp;<asp:Label runat="server" 
 			ID="Label3" /></p>
			<p>
				<asp:Label runat="server" ID="Label5" Width="111px" />&nbsp;
				<asp:Label runat="server" ID="Label6" /></p>
			<p>
				_____________________________________________</p>
			<p>
				&nbsp;<asp:Label runat="server" ID="ConfigSections" /></p>
			<pre>            
			</pre>

    </div>
    </form>
</body>
</html>