﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridViewData.aspx.cs" Inherits="GridViewData" %>

<form id="form1" runat="server">
<div id="divGridView">
    <asp:gridview id="GridView1" runat="server" enableviewstate="False" width="100%" BorderWidth="1"
        cellpadding="4" forecolor="#333333" gridlines="None" autogeneratecolumns="false"
        datakeynames="AutoId" autogeneratedeletebutton="false" EmptyDataText="No records found" >
            <HeaderStyle BackColor="#507CD1" HorizontalAlign="Left" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="AutoId" HeaderText="AutoId" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <a href="javascript:void(0)" onclick="ShowEditBox(<%# Eval("AutoId") %>)" title="Edit">Edit</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <span id="PName<%# Eval("AutoId") %>"><%# Eval("Name") %></span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Address" DataField="Address" />
                <asp:BoundField HeaderText="City" DataField="City" />
                <asp:BoundField HeaderText="Phone" DataField="Phone" />
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <span onclick="return confirm('Are you sure?')">
                            <a href="javascript:DeleteRecord(<%# Eval("AutoId") %>)" title="Delete"><font color="red">Delete?</font></a>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:gridview>
        <asp:Literal runat="server" ID="litPaging" EnableViewState="False" />
    <p>
        <asp:label id="lblMessage" runat="server" enableviewstate="false" />
    </p>
</div>
</form>
<script language="javascript" type="text/javascript" src="jquery-1.4.min.js" />
<script language="javascript" type="text/javascript">
    // highlight the row when clicked
    $(document).ready(function () {
        $("#divGridView table tbody tr").mouseover(function () {
            $(this).addClass("highlightRow"); 
        }).mouseout(function () { $(this).removeClass('highlightRow'); })
    });

    // highlight row by clicking it
    $(document).ready(function () {
        $("#divGridView table tbody tr").click(function () {
            $(this).addClass("select");
        })
    });

    // double click delete rows
    $(document).ready(function () {
        $("#divGridView table tbody tr").dblclick(function () {
            // find the id first
            var v = confirm('Are you sure to delete?');
            if (v) {
                var autoId = $(this).find("td:first").text();
                // remove the row from server side (the database)
                DeleteRecord(autoId);
                // remove from the clien side
                $(this).remove(); 
            }
        })
    });
</script>
