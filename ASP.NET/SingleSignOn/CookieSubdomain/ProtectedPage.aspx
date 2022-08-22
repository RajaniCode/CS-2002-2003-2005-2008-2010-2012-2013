<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtectedPage.aspx.cs" Inherits="ProtectedPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ProtectedPage</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    You have been successfully authenticated in the asp.net application CookieSubDomain. Otherwise, you 
        are not able to see this page.
        <br />
        Please type the URL to the ProtectedPage.aspx of another asp.net application into your browser's addres box 
to see if you need to log in again.</div>
    </form>
</body>
</html>
