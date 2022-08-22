<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<script runat="server">

    protected void orderDetailsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        /*
         * If you want to perform some check on the data to be deleted, use
         * the RowDeleting event handler.  You can inspect the data being deleted
         * via the e.Values property.  If you want to cancel the delete, set the
         * e.Cancel property to True.
         */           
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>You Can Delete Order Detail Information for Orders that Have Included Shipments
        of the Selected Product
        </h2>
        <asp:SqlDataSource ID="productListingDataSource" ConnectionString="<%$ ConnectionStrings:NWConnectionString %>"
            SelectCommand="SELECT [ProductID], [ProductName] FROM [Products]" Runat="server">
        </asp:SqlDataSource>
        <asp:DropDownList ID="productSelector" Runat="server" DataSourceID="productListingDataSource"
            DataTextField="ProductName" DataValueField="ProductID" AutoPostBack="True">
        </asp:DropDownList>&nbsp;
        <asp:SqlDataSource ID="orderDetailsForProduct" DataSourceMode="DataReader" ConnectionString="<%$ ConnectionStrings:NWConnectionString %>"
            SelectCommand="SELECT [OrderID], [ProductID], [UnitPrice], [Quantity] FROM [Order Details] WHERE ([ProductID] = @ProductID2)"
            Runat="server" DeleteCommand="DELETE FROM [Order Details] WHERE [OrderID] = @original_OrderID AND [ProductID] = @original_ProductID">
            <DeleteParameters>
                <asp:Parameter Type="Int32" Name="OrderID"></asp:Parameter>
                <asp:Parameter Type="Int32" Name="ProductID"></asp:Parameter>
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter Name="ProductID2" Type="Int32" ControlID="productSelector"
                    PropertyName="SelectedValue"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:GridView ID="orderDetailsGridView" Runat="server" AutoGenerateColumns="False" DataSourceID="orderDetailsForProduct" DataKeyNames="OrderID,ProductID" BorderColor="Tan" CellPadding="2" BackColor="LightGoldenrodYellow" BorderWidth="1px" ForeColor="Black" GridLines="None" OnRowDeleting="orderDetailsGridView_RowDeleting">
            <FooterStyle BackColor="Tan"></FooterStyle>
            <PagerStyle ForeColor="DarkSlateBlue" HorizontalAlign="Center" BackColor="PaleGoldenrod"></PagerStyle>
            <HeaderStyle Font-Bold="True" BackColor="Tan"></HeaderStyle>
            <AlternatingRowStyle BackColor="PaleGoldenrod"></AlternatingRowStyle>
            <Columns>
                <asp:CommandField DeleteText="Delete Order Line Item" ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField HeaderText="Order ID" DataField="OrderID" SortExpression="OrderID">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField HeaderText="Quantity" DataField="Quantity" SortExpression="Quantity" DataFormatString="{0:d}">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField HeaderText="Unit Price" DataField="UnitPrice" SortExpression="UnitPrice" DataFormatString="{0:c}">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
            </Columns>
            <SelectedRowStyle ForeColor="GhostWhite" BackColor="DarkSlateBlue"></SelectedRowStyle>
        </asp:GridView>&nbsp;</div>
    </form>
</body>
</html>