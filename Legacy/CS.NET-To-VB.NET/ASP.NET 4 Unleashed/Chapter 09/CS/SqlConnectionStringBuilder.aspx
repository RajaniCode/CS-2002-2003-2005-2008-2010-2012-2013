<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<script runat="server">
    
    protected void btnConvert_Click(object sender, EventArgs e)
    {
        SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(txtConnectionString.Text);
        lblResult.Text = builder.ConnectionString;
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>SQL Connection String Builder</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:TextBox
        id="txtConnectionString"
        Columns="60"
        Runat="Server" />
    <asp:Button
        id="btnConvert"
        Text="Convert"
        OnClick="btnConvert_Click"
        Runat="Server" />    
    
    <hr />
    
    <asp:Label
        id="lblResult"
        Runat="server" />
    
    </div>
    </form>
</body>
</html>
