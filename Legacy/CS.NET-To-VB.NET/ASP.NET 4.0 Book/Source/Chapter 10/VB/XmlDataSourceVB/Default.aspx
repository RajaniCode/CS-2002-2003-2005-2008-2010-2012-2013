﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
        DataFile="~/App_Data/XMLFile.xml"></asp:XmlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="XmlDataSource1">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="RollNo" HeaderText="RollNo" 
                SortExpression="RollNo" />
            <asp:BoundField DataField="Standard" HeaderText="Standard" 
                SortExpression="Standard" />
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>