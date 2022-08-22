Imports System.Data.OleDb


Partial Public Class frmOLEDB
    Inherits System.Windows.Forms.Form

    <System.Diagnostics.DebuggerNonUserCode()> _
    Public Sub New()
        MyBase.New()


        'This call is required by the Windows Form Designer.
        InitializeComponent()

    End Sub

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.lstNorthwinds = New System.Windows.Forms.ListBox
        Me.SuspendLayout()
        '
        'lstNorthwinds
        '
        Me.lstNorthwinds.FormattingEnabled = True
        Me.lstNorthwinds.Location = New System.Drawing.Point(102, 28)
        Me.lstNorthwinds.Name = "lstNorthwinds"
        Me.lstNorthwinds.Size = New System.Drawing.Size(120, 95)
        Me.lstNorthwinds.TabIndex = 0
        '
        'frmOLEDB
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 266)
        Me.Controls.Add(Me.lstNorthwinds)
        Me.Name = "frmOLEDB"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub
    Private Sub loadData()
        Dim strPath As String
        strPath = AppDomain.CurrentDomain.BaseDirectory
        Dim objOLEDBCon As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source =" & strPath & "Nwind.mdb")
        Dim objOLEDBCommand As OleDbCommand
        Dim objOLEDBReader As OleDbDataReader
        Try

            objOLEDBCommand = New OleDbCommand("Select FirstName from Employees")
            'objOLEDBCon = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source =C:\Program Files\MicrosoftOffice\Office\Samples\Northwind.mdb")
            objOLEDBCon.Open()
            objOLEDBCommand.Connection = objOLEDBCon
            objOLEDBReader = objOLEDBCommand.ExecuteReader()
            Do While objOLEDBReader.Read()
                lstNorthwinds.Items.Add(objOLEDBReader.GetString(0))
            Loop
        Catch ex As Exception
            Throw ex
        Finally
            objOLEDBCon.Close()
        End Try

    End Sub



    Friend WithEvents lstNorthwinds As System.Windows.Forms.ListBox

End Class
