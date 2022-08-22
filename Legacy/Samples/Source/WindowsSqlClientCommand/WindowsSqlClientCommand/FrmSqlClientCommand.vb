Imports System.Data.SqlClient
Imports System.Configuration.ConfigurationSettings
Public Class FrmSqlClientCommand

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        LoadData()
    End Sub
    Private Sub LoadData()
        ' note :- with and end with makes your code more readable
        Dim strConnectionString As String
        Dim objConnection As New SqlConnection
        Dim objCommand As New SqlCommand
        Dim objReader As SqlDataReader
        Try
            lstData.Items.Clear()
            ' this gets the connectionstring from the app.config file.
            ' note if this gives error see where the MDB file is stored in your pc and point to that
            strConnectionString = AppSettings.Item("ConnectionString")
            ' take the connectiostring and initialize the connection object
            With objConnection
                .ConnectionString = strConnectionString
                .Open()
            End With
            If txtEmployeeName.Text.Length = 0 Then
                objCommand = New SqlCommand("SelectEmployee")
            Else
                objCommand = New SqlCommand("SelectByEmployee")
                objCommand.Parameters.Add("@FirstName", Data.SqlDbType.NVarChar, 200)
                objCommand.Parameters.Item("@FirstName").Value = txtEmployeeName.Text.Trim()
            End If

            objCommand.CommandType = Data.CommandType.StoredProcedure
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

    Private Sub cmdSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSearch.Click
        LoadData()
    End Sub
End Class
