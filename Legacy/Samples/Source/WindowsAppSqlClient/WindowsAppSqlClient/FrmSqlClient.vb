
Imports System.Data.SqlClient
Imports System.Configuration.ConfigurationSettings
Public Class FrmSqlClient

    Private Sub FrmSqlClient_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        LoadData()
    End Sub

    Private Sub lstData_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstData.SelectedIndexChanged

    End Sub

    Private Sub DataNavigator1_RefreshItems(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub
    Private Sub LoadData()
        ' note :- with and end with makes your code more readable
        Dim strConnectionString As String
        Dim objConnection As New SqlConnection
        Dim objCommand As New SqlCommand
        Dim objReader As SqlDataReader
        Try
            ' this gets the connectionstring from the app.config file.
            ' note if this gives error see where the MDB file is stored in your pc and point to that
            strConnectionString = AppSettings.Item("ConnectionString")
            ' take the connectiostring and initialize the connection object
            With objConnection
                .ConnectionString = strConnectionString
                .Open()
            End With
            objCommand = New SqlCommand("Select FirstName from Employees")
            With objCommand
                .Connection = objConnection
                objReader = .ExecuteReader()
            End With
            ' looping through the reader to fill the list box
            Do While objReader.Read()
                lstData.Items.Add(objReader.Item("FirstName"))
            Loop
        Catch ex As Exception
            Throw ex
        Finally
            objConnection.Close()
        End Try

    End Sub

    Private Sub DataConnector1_CurrentChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub
End Class
