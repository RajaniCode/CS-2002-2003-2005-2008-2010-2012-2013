Imports System.Data
Imports System.Xml
Imports System.Data.SqlClient
Imports System.Configuration.ConfigurationSettings
Public Class FrmDataSetSample

    Private Sub FrmDataSetSample_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        LoadData()
    End Sub
    Private Sub LoadData()
        Dim strConnectionString As String
        strConnectionString = AppSettings.Item("ConnectionString")
        Dim objConn As New SqlConnection(strConnectionString)
        objConn.Open()
        Dim objCommand As New SqlCommand("Select FirstName from Employees")
        objCommand.Connection = objConn
        Dim objDataAdapter As New SqlDataAdapter()
        objDataAdapter.SelectCommand = objCommand
        Dim objDataSet As New DataSet
        objDataAdapter.Fill(objDataSet)
        lstData.DataSource = objDataSet.Tables(0).DefaultView
        lstData.DisplayMember = "FirstName"
        lstData.ValueMember = "FirstName"
    End Sub
End Class
