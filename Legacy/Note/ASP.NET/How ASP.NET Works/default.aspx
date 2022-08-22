<%@ Page language="c#" Codebehind="default.aspx.cs" AutoEventWireup="false" Inherits="HowAspNetWorks._default" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>How ASP.Net works Samples</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/nav4-0" name="vs_targetSchema">
		<link href="http://localhost/projects/AspNetTricks/wwWebstore.css" type="text/css" rel="stylesheet">
	</head>
	<body ms_positioning="FlowLayout">
		<table width="100%">
			<tr>
			<tr>
				<td bgcolor="#000041" valign="middle">
					<br>
					<h1 style="BACKGROUND:none transparent scroll repeat 0% 0%; COLOR:white">How 
						ASP.NET works Sample Page</h1>
				</td>
			</tr>
		</table>
		<hr clear="all">
		<br>
		<form id="Form1" method="post" runat="server">
			<table>
				<tr>
					<td valign="top">
						<ul>
							<li>
								<a href="ApplicationPoolsAndThreads.aspx"><strong>ASP.Net Application Pools and Threads 
										Sample</strong></a><br>
								Demonstrates multiple Application instances and how they run on multiple 
								threads.<p></p>
							<li>
								<a href="default.wws"><strong>Url Rewriting Sample</strong> (HttpHandler)</a><br>
								Demonstrates accessing old Urls and automatically redirecting to a new 
								location. Maps .wws requests to .aspx requests. Requires that .wws is mapped to 
								aspnet_isapi.dll<p></p>
							<li>
								<a href="sampleimageDisplay.htm"><strong>Water Marked Images</strong> (Http Module)</a><br>
								Demonstrates how to use an HTTP Module to water mark images in a specific 
								directory. Requires that the CustomHttpModule HttpModule is registered in 
								web.config.
								<p></p>
							<li>
								<a href="ResponseFilter.aspx"><strong>ResponseFilter</strong></a><br>
								Demonstrates re-writing content as it comes in. Takes an Html Page and converts 
								it all to upper case.<br>
								<br>
							<li>
								<p><a href="ResponseEndTest.aspx"><strong>Response.End()</strong></a><br>
									Demonstrates some issues you need to watch out for with Response.End() shutting 
									off the HTTP Pipeline events. Also shows how Server.Transfer() implicitly calls 
									Response.End().<br>
								</p>
							</li>
						</ul>
						<br>
					</td>
					<td valign="top">
						<ul>
							<li>
								<a href="admin/ApplicationStatus.aspx"><strong>Applications Status, 
										Error&nbsp;Handling&nbsp;and Log&nbsp;Sample</strong></a><br>
								Sample that demonstrates Application events like Application_Error, 
								Application_BeginRequest/EndRequest to perform logging operations.
								<p></p>
							<li>
								<a href="CompiledAspxCode.aspx"><strong>ASP.Net generated Web Form Source Code Demo</strong></a><br>
								Demonstrates generated code for a simple ASP.Net page.
								<p></p>
							<li>
								<a href="PageEvents.aspx"><strong>ASP.Net Web Form Event Firing Order Sample</strong></a><br>
								Simple page that contains page and a custom control that fire the most common 
								events to show event firing order
								<p></p>
							<li>
								<asp:linkbutton id="btnMessage" runat="server" font-bold="True">Message Display Sample</asp:linkbutton><br>
								<a href="MessageDisplay_test.aspx"><strong>Create your own Message</strong></a><br>
								Demonstrates the generic MessageDisplay routine that uses HttpContext to pass 
								data from one request to another using Server.Transfer().<br>
								<br>
							<li>
								<a href="photoalbum.xml"><strong>Display PhotoAlbum XML File</strong></a><strong>
									<br>
								</strong>Demonstrate Forbidden Handlers</li></ul>
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<table width="99%">
			<tr>
				<td valign="top">
					<img src="images/wwtoollogo.jpg" border="0" align="left"> © Rick Strahl, <a href="http://www.west-wind.com/">
						West Wind Technologies</a>
				</td>
				<td align="right" valign="top">
					<img src="images/help.gif"> <a href="_readme.htm">Sample Configuration</a>
				</td>
			</tr>
			</TD></table>
	</body>
</html>
