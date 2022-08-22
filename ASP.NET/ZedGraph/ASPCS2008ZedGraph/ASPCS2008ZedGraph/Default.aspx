<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPCS2008ZedGraph._Default" %>

<%@ Register assembly="ZedGraph.Web" namespace="ZedGraph.Web" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1" />
    
    <div>
    
    <br />
    
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:DropDownList ID="cboGraphType" runat="server" AutoPostBack="True">
                    <asp:ListItem>Clustered Column</asp:ListItem>
                    <asp:ListItem>Stacked</asp:ListItem>
                    <asp:ListItem>Clustered Bar</asp:ListItem>
                    <asp:ListItem>Stacked Bar</asp:ListItem>
                    <asp:ListItem>Line</asp:ListItem>
                    <asp:ListItem>Pie</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <cc1:ZedGraphWeb ID="ZedGraphWeb1" runat="server">
                </cc1:ZedGraphWeb>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
        
    <br />

    </div>
      
    </form>
</body>
</html>
