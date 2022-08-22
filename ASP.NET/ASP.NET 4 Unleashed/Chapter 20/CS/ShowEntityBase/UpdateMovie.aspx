﻿<%@ Page Language="C#" %>
<%@ Register TagPrefix="custom" Namespace="Superexpert.Controls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Movie</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    <asp:GridView
        id="grdMovies"
        DataSourceId="srcMovies"
        DataKeyNames="Id,Version"
        AutoGenerateEditButton="true"
        AutoGenerateDeleteButton="true"
        AutoGenerateColumns="false"
        Runat="server">
        <Columns>
        <asp:BoundField DataField="Title" HeaderText="Title" />
        <asp:BoundField DataField="Director" HeaderText="Director" />
        <asp:BoundField DataField="DateReleased" HeaderText="Date Released" />
        </Columns>
    </asp:GridView>        
    
    <custom:EntityDataSource
        id="srcMovies"
        TypeName="Movie"
        Runat="server" />
    
    
    </div>
    </form>
</body>
</html>
