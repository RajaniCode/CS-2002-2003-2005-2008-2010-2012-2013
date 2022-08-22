﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Page2.aspx.cs" Inherits="Page2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SiteMapPath Control Example</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label1" runat="server" Text="SiteMapDataSource 
 			Example"></asp:Label><br />
			<br />
			<asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Names="Verdana" 
 			Font-Size="0.8em"
			PathSeparator=" : ">
			<PathSeparatorStyle Font-Bold="True" ForeColor="#5D7B9D" />
			<CurrentNodeStyle ForeColor="#333333" />
			<NodeStyle Font-Bold="True" ForeColor="#7C6F57" />
			<RootNodeStyle Font-Bold="True" ForeColor="#5D7B9D" />
			</asp:SiteMapPath>
			<br />
			<br />
			<asp:HyperLink ID="HyperLink1" runat="server" 
 			 NavigateUrl="~/Page1.aspx">Go 
 			 to Page 1</asp:HyperLink>&nbsp;<br />

    </div>
    </form>
</body>
</html>
