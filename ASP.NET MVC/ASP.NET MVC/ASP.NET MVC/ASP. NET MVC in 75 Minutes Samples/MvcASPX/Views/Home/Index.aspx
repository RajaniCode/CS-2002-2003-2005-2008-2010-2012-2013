<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: ViewBag.Message %></h2>
    <p>
        To learn more about ASP.NET MVC visit <a href="http://asp.net/mvc" title="ASP.NET MVC Website">http://asp.net/mvc</a>.
    </p>
    <%if (String.IsNullOrWhiteSpace(ViewBag.Message)) %>
    empty
    <%else %>
    not empty
    <% %>
    <ul>
        <% for (int i = 8;i<28;i++){%>
        <li style="font-size: <%:i%>pt">
            <%:i %>
            at
            <%:DateTime.Now %></li>
        <%}%>
    </ul>
</asp:Content>
