<%@ Page language="c#" Codebehind="ShowRequestLog.aspx.cs" AutoEventWireup="false" Inherits="HowAspNetWorks.ShowLog" enableviewstate="false" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
   <head>
      <title>Web Request Log</title>
      <link href="../wwWebstore.css" type="text/css" rel="stylesheet">
         <style>
         TD { FONT-SIZE: 8pt }
         PRE { FONT-SIZE: 8pt; FONT-FAMILY: Arial }
         .gridheader { HEIGHT: 20px }
         </style>
   </head>
   <body ms_positioning="FlowLayout">
      <form id="Form1" method="post" runat="server">
         <h1>Web Application Request Log</h1>
         <p><a href="..\default.aspx">Demo&nbsp;Page</a> |
            <asp:linkbutton id="btnRefresh" runat="server"> Refresh</asp:linkbutton>| <a href="ShowRequestLog.aspx">
               Show Entire Log</a> &nbsp;|&nbsp;
            <asp:linkbutton id="btnClearLog" runat="server">Clear log</asp:linkbutton>&nbsp;|&nbsp;
            <asp:linkbutton id="btnCreateLog" runat="server">Create Log File</asp:linkbutton>&nbsp;| 
            Show:
            <asp:dropdownlist id="lstTypes" runat="server" width="224px" autopostback="True">
               <asp:listitem value="0">Web Request Log</asp:listitem>
               <asp:listitem value="1">Error Log</asp:listitem>
               <asp:listitem value="2">Application Message Log</asp:listitem>
            </asp:dropdownlist>
            <hr>
            <small>Total Entries in the log:
               <%= this.TotalEntries %>
               | Entries shown:
               <%= this.EntriesShown %>
               <%= this.LoggingDisabledMessage %>
            </small>
         <p><asp:label id="lblErrorMessage" runat="server" cssclass="errormessage" enableviewstate="False"></asp:label></p>
         <p><asp:datagrid id="oGrid" runat="server" cellpadding="2" autogeneratecolumns="False" align="center"
               width="96%" allowpaging="True" pagesize="250" onpageindexchanged="oGrid_OnPageIndexChanged"
               enableviewstate="False">
               <alternatingitemstyle cssclass="gridalternate"></alternatingitemstyle>
               <itemstyle cssclass="gridnormal"></itemstyle>
               <headerstyle cssclass="gridheader"></headerstyle>
               <columns>
                  <asp:templatecolumn headertext="Time">
                     <headerstyle horizontalalign="Center"></headerstyle>
                     <itemstyle verticalalign="Top"></itemstyle>
                     <itemtemplate>
                        <%# DataBinder.Eval(Container, "DataItem.Time").ToString().ToLower() %>
                     </itemtemplate>
                     <edititemtemplate>
                        <asp:TextBox runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Time", "{0:F}") %>'>
                        </asp:textbox>
                     </edititemtemplate>
                  </asp:templatecolumn>
                  <asp:templatecolumn headertext="Url">
                     <headerstyle horizontalalign="Center"></headerstyle>
                     <itemtemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Url") %>'>
                        </asp:label><br>
                        <%# DataBinder.Eval( Container,"DataItem.CustomMessage") %>
                     </itemtemplate>
                     <edititemtemplate>
                        <asp:TextBox runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Url") %>'>
                        </asp:textbox>
                     </edititemtemplate>
                  </asp:templatecolumn>
                  <asp:boundcolumn datafield="QueryString" headertext="Query String">
                     <headerstyle horizontalalign="Center"></headerstyle>
                  </asp:boundcolumn>
                  <asp:boundcolumn datafield="ip" headertext="Ip Address">
                     <headerstyle horizontalalign="Center"></headerstyle>
                  </asp:boundcolumn>
                  <asp:boundcolumn datafield="Duration" headertext="Duration (ms)">
                     <headerstyle horizontalalign="Center"></headerstyle>
                     <itemstyle horizontalalign="Right"></itemstyle>
                  </asp:boundcolumn>
               </columns>
               <pagerstyle horizontalalign="Right" forecolor="White" cssclass="gridheader" mode="NumericPages"></pagerstyle>
            </asp:datagrid></p>
      </form>
      <p><a href="default.aspx">Admin Page</a> |</p>
   </body>
</html>
