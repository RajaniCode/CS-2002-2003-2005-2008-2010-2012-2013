<%@ Page language="c#" Codebehind="ResponseFilter.aspx.cs" AutoEventWireup="false" Inherits="HowAspNetWorks.ResponseFilter" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
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
      <form runat="server">
         <h1 designtimedragdrop="28">Upper Casing of content via Response Filter</h1>
         <hr height="1">
         <a href="default.aspx">Back to Home Page</a>
         <p>
            <asp:label id="lblText" runat="server">This text lives in a Label</asp:label></p>
         <p>
            <asp:checkbox id="chkEnableFilter" runat="server" text="Enable Response Filter" autopostback="True"></asp:checkbox></p>
         <p>
            <hr height="1">
         Welcome to the sample page that turns everything to upper case using a simple 
         response filter. This is a silly and useless example, but it demonstrates how 
         you can change the document using a ResponseFilter as the data is written. This 
         allows to perform tasks like automatic encryption or compression for example.
         <p></p>
      </form>
   </body>
</html>
