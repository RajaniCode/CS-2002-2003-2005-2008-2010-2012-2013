<%@Register TagPrefix="ww" Namespace="HowAspNetWorks" Assembly="HowAspNetWorks" %>
<%@ Page language="c#" Codebehind="PageEvents.aspx.cs" AutoEventWireup="false" Inherits="HowAspNetWorks.PageEvents" trace=true %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
   <head>
      <title>Page Event Firing Order</title>
      <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
      <meta name="CODE_LANGUAGE" content="C#">
      <meta name="vs_defaultClientScript" content="JavaScript">
      <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
      <link rel="stylesheet" type="text/css" href="http://localhost/projects/AspNetTricks/wwWebstore.css">
   </head>
   <body ms_positioning="FlowLayout">
      <h1>Page Event Firing Order</h1>
      <hr height="1">
      <a href="default.aspx">Back to Home Page</a>
      <p>
         <form id="Form1" method="post" runat="server">
            <ww:pageeventscontrol id="txtPlain" runat="server"></ww:pageeventscontrol>
            <asp:button id="btnSumbit" runat="server" text="PostBack"></asp:button>
         </form>
         <hr>
      This page contains overrides for most of the overridable methods and writes out 
      the call into the Trace object. The page contains a custom control (inherited 
      from TextBox) which also echos events fired to demonstrate interaction between 
      page and control.
      <p>
         Take a look at the Trace data to see the event firing order...
         <hr>
   </body>
</html>
