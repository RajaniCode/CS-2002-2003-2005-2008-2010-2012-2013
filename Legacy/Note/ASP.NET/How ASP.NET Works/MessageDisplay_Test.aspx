<%@ Page language="c#" Codebehind="MessageDisplay_Test.aspx.cs" AutoEventWireup="false" 
    Inherits="HowAspNetWorks.MessageDisplay_Test" validateRequest="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
   <head>
      <title>MessageDisplay_Test</title>
      <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
      <meta name="CODE_LANGUAGE" content="C#">
      <meta name="vs_defaultClientScript" content="JavaScript">
      <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
      <link href="wwWebstore.css" type="text/css" rel="stylesheet">
      <link href="wwWebstore.css" type="text/css" rel="stylesheet">
   </head>
   <body ms_positioning="FlowLayout">
      <form id="Form1" method="post" runat="server">
         <h1>MessageDisplay Demo</h1>
         <p>
         
         
            <table style="collapse-border:collapse" border="1" cellpadding="5" align="center">
               <tr>
                  <td colspan="2"><h3>Create a message Page to display</h3>
                  </td>
               </tr>
               <tr>
                  <td>Header:</td>
                  <td><asp:textbox id="txtHeader" runat="server" width="439px"></asp:textbox></td>
               </tr>
               <tr>
                  <td>Message:</td>
                  <td>&nbsp;</td>
               </tr>
               <tr>
                  <td colspan="2">
                     <asp:textbox id="txtMessage" runat="server" textmode="MultiLine" width="520px" height="160px"></asp:textbox></td>
               </tr>
               <tr>
                  <td colspan="2" align="center">
                     <asp:button id="btnSubmit" runat="server" width="212px" text="Create Message Page"></asp:button></td>
               </tr>
            </table>
         <p>
            <br>
      </form>
      &nbsp;</P>
   </body>
</html>
