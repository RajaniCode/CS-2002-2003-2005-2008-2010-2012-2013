<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style type="text/css">
        .style1
        {
            width: 600px;
        }
    </style>
</head>
<body>
    <p>
        <br />
        <br />
        Program does not verify credentials. Enter any UserName and Password and then 
        click Login button.</p>
    <form id="form1" runat="server">
        <div>
            <table class="style1">
                <tr>
                    <td>
                        UserName</td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server">MyUserName</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password">Password</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" 
                            Text="Login" />
                    </td>
                </tr>
            </table>
            <br />
        </div>
    </form>
</body>
</html>
