<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="ZedGraph.Web" namespace="ZedGraph.Web" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:DropDownList ID="cboGraphType" runat="server" AutoPostBack="True">
        <asp:ListItem>Clustered Column</asp:ListItem>
        <asp:ListItem>Stacked</asp:ListItem>
        <asp:ListItem>Clustered Bar</asp:ListItem>
        <asp:ListItem>Stacked Bar</asp:ListItem>
        <asp:ListItem>Line</asp:ListItem>
        <asp:ListItem>Pie</asp:ListItem>
    </asp:DropDownList>
    <div>
    
        <cc1:ZedGraphWeb ID="ZedGraphWeb1" runat="server">
        </cc1:ZedGraphWeb>
    
    </div>
    </form>
</body>
</html>
