<%@ Page Language="C#" %>
<%@ Register TagPrefix="custom" Namespace="myControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Show ColorTable</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <custom:ColorTable
        id="ColorTable1"
        Runat="Server" />
    
    </div>
    </form>
</body>
</html>
