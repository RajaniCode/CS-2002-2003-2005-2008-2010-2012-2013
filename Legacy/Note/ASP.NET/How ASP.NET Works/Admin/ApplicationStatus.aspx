<%@ Page language="c#" Codebehind="ApplicationStatus.aspx.cs" AutoEventWireup="false" Inherits="HowAspNetWorks.ApplicationStatus" trace="true" enablesessionstate="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
   <head>
      <title>ApplicationStatus</title>
      <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
      <meta content="C#" name="CODE_LANGUAGE">
      <meta content="JavaScript" name="vs_defaultClientScript">
      <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
      <link href="../wwWebstore.css" type="text/css" rel="stylesheet">
   </head>
   <body ms_positioning="FlowLayout">
      <h1>Web Store Application Status</h1>
      <small><a href="default.aspx">Back to Admin</a> </small>
      <p>
         <form id="Form1" method="post" runat="server">
            <p></p>
            <p>
               <table id="Table1" style="WIDTH: 888px; HEIGHT: 431px" cellpadding="6" align="center" bgcolor="#eeeeee"
                  border="1">
                  <tr>
                     <td valign="top" colspan="3">
                        <h2>Web Store Application Status</h2>
                        <hr>
                        <asp:label id="lblErrorMessage" runat="server" cssclass="ErrorMessage"></asp:label></td>
                  </tr>
                  <tr>
                     <td valign="top"><img height="88" hspace="5" src="../images/wwWebstore_small.gif" width="205" border="0"></td>
                     <td style="WIDTH: 221px" valign="top" width="221">
                        <h3>Management</h3>
                        <ul>
                           <li>
                              <a href="ShowRequestLog.aspx?ShowCount=250">Request and Error Log</a>
                           <li>
                              <asp:linkbutton id="btnXMLErrorLog" runat="server">Show XML Error Log</asp:linkbutton><a href="ErrorLog.xml"></a>
                           <li>
                              <asp:linkbutton id="btnClearXmlLog" runat="server">Clear XML Error Log</asp:linkbutton>
                           <li>
                           </li>
                        </ul>
                        <br>
                        <h3>Error Testing</h3>
                        <ul>
                           <li>
                              <asp:linkbutton id="btnThrowError" runat="server">Throw an Error</asp:linkbutton>
                           <li>
                              <a href="missingpage.aspx">Missing Page Error</a></li></ul>
                        <p><br>
                           <br>
                        </p>
                     </td>
                     <td valign="top">
                        <p>
                           <h3>Performance Counters</h3>
                           <blockquote><asp:datagrid id="CounterList" runat="server" enableviewstate="False" showheader="False" border="0"
                                 width="336px"></asp:datagrid>
                              <p></p>
                           </blockquote>
                           <ul>
                           </ul>
                           <hr>
                        <p><b>.Net Framework Version: </b>
                           <br>
                           <%= Environment.Version.ToString() %>
                        </p>
                        <p><b>System Account running App:</b><br>
                           <%= Environment.UserName %>
                        <p><b>Logged on User:</b><br>
                           <%= User.Identity.Name == "" ? "Anonymous User" : User.Identity.Name %>
                        </p>
                     </td>
                  </tr>
               </table>
         </form>
         <br>
      <p></p>
   </body>
</html>
