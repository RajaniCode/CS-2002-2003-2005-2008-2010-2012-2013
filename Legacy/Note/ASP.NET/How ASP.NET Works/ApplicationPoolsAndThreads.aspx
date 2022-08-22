<%@ Page language="c#" ASPCOMPAT="false" Codebehind="ApplicationPoolsAndThreads.aspx.cs" AutoEventWireup="false" Inherits="HowAspNetWorks.ApplicationPoolsAndThreads" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<HTML>
	<HEAD>
		<title>Application Pools and Thread Affinity</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link rel="stylesheet" type="text/css" href="http://localhost/projects/AspNetTricks/wwWebstore.css">
	</HEAD>
	<body ms_positioning="FlowLayout">
		<h1>Application Pools and Threads</h1>
		<hr height="1">
		<a href="default.aspx">Back to Home Page</a>
		<p>
			<form id="Form1" method="post" runat="server">
<table border="1" cellpadding="5" style="WIDTH: 480px" align="center">
	<tr>
		<td style="WIDTH: 121px"><strong>Application Id: </strong>
		</td>
		<td>
			<%= this.ApplicationId %>
		</td>
	</tr>
	<tr>
		<td style="WIDTH: 121px"><strong>Thread Id:</strong>
		</td>
		<td>
			<%= this.ThreadId %>
		</td>
	</tr>
	<tr>
		<td style="WIDTH: 121px"><strong>Domain Id:</strong>
		</td>
		<td>
			<%= this.DomainId %>
		</td>
	</tr>
	<tr>
		<td style="WIDTH: 121px"><strong>Thread Info:</strong>
		</td>
		<td>
			<%= this.ThreadInfo %>
		</td>
	</tr>
</table>
</form>
		</p>
		<hr>
		To run this demo fire up two browser instances of this URL and run the links 
		simultaneously. Notice the Http Application Id which is assigned to the Global 
		(Global.asax) application object in the constructor. The IDs stay the same, but 
		they are thrown onto different threads. There's no thread affinity.
		<p>
			Note that you may see funky results if you use two instances of IE as there 
			appears to be some browser affinity between IE and IIS. It's best to test with 
			two completely separate browsers or browsers on separate machines.
			<hr>
	</body>
</HTML>
