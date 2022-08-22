<%@ Page language="c#" Codebehind="ResponseEndTest.aspx.cs" AutoEventWireup="false" Inherits="HowAspNetWorks.ResponseEndTest" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
   <head>
      <title>ResponseEndTest</title>
      <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
      <meta name="CODE_LANGUAGE" content="C#">
      <meta name="vs_defaultClientScript" content="JavaScript">
      <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
   </head>
   <body ms_positioning="FlowLayout">
      <form id="Form1" method="post" runat="server">
         <asp:checkbox id="chkResponseEnd" runat="server" text="Call Response.End in the page" autopostback="True"></asp:checkbox>
      </form>
   </body>
</html>
