<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateMachineKey.aspx.cs" Inherits="GenerateMachineKey" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MachineKey</title>
</head>
<body>
    <p>
        Generate
        Machine Keys:</p>
    <form id="form1" runat="server">
    <p>
        <asp:Label ID="lblValidationKey" runat="server" Width="800px"></asp:Label>
        <br />
        <asp:Label ID="lblDecryptionKey" runat="server" Width="800px"></asp:Label>
        <asp:Label ID="lblValidation" runat="server" Width="800px"></asp:Label>
        <br />
    </p>
    <div>
    
    </div>
    </form>
</body>
</html>
