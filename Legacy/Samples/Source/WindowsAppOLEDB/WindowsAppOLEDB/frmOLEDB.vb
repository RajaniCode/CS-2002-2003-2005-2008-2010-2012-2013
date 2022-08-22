Imports System.Data.OleDb
Public Class frmOLEDB

    Private Sub lstNorthwinds_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstNorthwinds.SelectedIndexChanged

    End Sub

    Private Sub frmOLEDB_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        loadData()
    End Sub
End Class
