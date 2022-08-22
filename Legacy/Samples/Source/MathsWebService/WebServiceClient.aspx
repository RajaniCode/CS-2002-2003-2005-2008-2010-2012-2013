<%@ Page Language="VB" AutoEventWireup="false" CompileWith="WebServiceClient.aspx.vb" ClassName="WebServiceClient_aspx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblEnterTwoNumbers" Runat="server" Text="Enter Two Numbers"></asp:Label>
        <asp:TextBox ID="txtNumber1" Runat="server"></asp:TextBox>
        <asp:TextBox ID="txtNumber2" Runat="server"></asp:TextBox>
        <asp:Button ID="cmdCalculate" Runat="server" Text="Calculate" OnClick="cmdCalculate_Click" />
        <asp:Label ID="lblResultDisplay" Runat="server" Text="Label"></asp:Label>
    
    </div>
    </form>
</body>
</html>
