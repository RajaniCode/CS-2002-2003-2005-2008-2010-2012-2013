<%@ Page language="c#" Codebehind="MessageDisplay.aspx.cs" Inherits="HowAspNetWorks.MessageDisplay" AutoEventWireup="false" enableViewState="false" %>
<html>
   <head>
      <title>
         <%= Context.Items["ErrorMessage_Header"]  %>
      </title>
      <%= this.RedirectMetaTag %>
      <link REL="stylesheet" TYPE="text/css" HREF='<%= this.BasePath %>/wwWebstore.css'>
         <base href='<%= this.BasePath %>/' >
   </head>
   <body topmargin="0" leftmargin="0">
      <!-- West Wind Menu -->
      <table cellspacing="0" cellpadding="0" width="100%" border="0">
         <tr>
            <td><img src="images/wwtoollogo.jpg" align="left" hspace="0">
            </td>
         </tr>
         <tr>
            <td class="gridheader" valign="middle" nowrap height="22" background="images/floralbackground_sm.gif"><b style="COLOR: #ffcc00" color>
                  <%= Context.Items["ErrorMessage_Header"] %>
                  &nbsp;&nbsp;&nbsp;&nbsp;</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <font color="white"><a class="webstorebannertext" href="/">Web Site Home</a>&nbsp;|
                  <a class="webstorebannertext" href="/contact.asp">Contact us</a>&nbsp;| <a class="webstorebannertext" href="/wwThreads/">
                     Support</a>&nbsp;|&nbsp;<a class="webstorebannertext" href="/search_simple.asp">Search</a>&nbsp;|&nbsp;<a class="webstorebannertext" href="/westwindnews.wst">News</a>&nbsp;| 
                  &nbsp;</font>
            </td>
         </tr>
      </table>
      <!-- End West Wind Menu --->
      
      <table border="0" cellspacing="0" cellpadding="0" width="100%" class="body" height="100%">
         <tr>
            <td class="categorylistbackground" valign="top" width="124" nowrap><br>
            </td>

            <!-- Custom Form Stuff -->
            <td valign="top" bgcolor="#ffffff" class="body" width="*">
               <form id="form1" runat="server">
                  <br>
                  <table border="0" width="97%">
                     <tr>
                        <td class="menuband" align="center" height="35">
                           <asp:label id="lblHeader" runat="server" font-bold="True" font-size="16pt"></asp:label>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <br>
                           <blockquote>
                              <asp:label id="lblMessage" runat="server"></asp:label>
                              <br>
                              <p></p>
                           </blockquote>
                           <center><small><asp:label id="lblRedirectHyperLink" runat="server"></asp:label></small></center>
                        </td>
                     </tr>
                  </table>
               </form>
            </td>
         </tr>
         <!-- End Custom Form Stuff -->
      </table>
   </body>
</html>
