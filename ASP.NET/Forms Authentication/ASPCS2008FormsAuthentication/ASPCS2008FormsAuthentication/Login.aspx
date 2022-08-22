<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ASPCS2008FormsAuthentication.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        Login</h1>
    <p>
        Username:
        <asp:TextBox ID="UserName" runat="server"></asp:TextBox></p>
    <p>
        Password:
        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox></p>
    <p>
        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember Me" />&nbsp;</p>
    <p>
        <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />&nbsp;</p>
    <p>
        <asp:Label ID="InvalidCredentialsMessage" runat="server" ForeColor="Red" Text="Your username or password is invalid. Please try again."
            Visible="False"></asp:Label>&nbsp;</p>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LoginContent">
</asp:Content>