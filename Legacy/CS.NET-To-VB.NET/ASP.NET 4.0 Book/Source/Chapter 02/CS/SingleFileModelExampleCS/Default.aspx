﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
void Button1_Click(Object sender, EventArgs e)
{
	Label1.Text = "Clicked at " + DateTime.Now.ToString();
}
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Single File Page Model</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label id="Label1" 
			runat="server"></asp:Label>
			<br />
			<asp:Button id="Button1" 
				runat="server" 
				onclick="Button1_Click" 
				Text="Click Me!">
			</asp:Button>

    </div>
    </form>
</body>
</html>
