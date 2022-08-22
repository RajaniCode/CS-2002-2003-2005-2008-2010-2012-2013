Partial Public Class FrmSqlClientCommand
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
        Me.lstData = New System.Windows.Forms.ListBox
        Me.txtEmployeeName = New System.Windows.Forms.TextBox
        Me.cmdSearch = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'lstData
        '
        Me.lstData.FormattingEnabled = True
        Me.lstData.Location = New System.Drawing.Point(13, 13)
        Me.lstData.Name = "lstData"
        Me.lstData.Size = New System.Drawing.Size(120, 95)
        Me.lstData.TabIndex = 0
        '
        'txtEmployeeName
        '
        Me.txtEmployeeName.Location = New System.Drawing.Point(140, 13)
        Me.txtEmployeeName.Name = "txtEmployeeName"
        Me.txtEmployeeName.Size = New System.Drawing.Size(180, 20)
        Me.txtEmployeeName.TabIndex = 1
        '
        'cmdSearch
        '
        Me.cmdSearch.Location = New System.Drawing.Point(140, 40)
        Me.cmdSearch.Name = "cmdSearch"
        Me.cmdSearch.TabIndex = 2
        Me.cmdSearch.Text = "Search"
        '
        'FrmSqlClientCommand
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(359, 137)
        Me.Controls.Add(Me.cmdSearch)
        Me.Controls.Add(Me.txtEmployeeName)
        Me.Controls.Add(Me.lstData)
        Me.Name = "FrmSqlClientCommand"
        Me.Text = "SQLCLIENT sample using Stored Procedures"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lstData As System.Windows.Forms.ListBox
    Friend WithEvents txtEmployeeName As System.Windows.Forms.TextBox
    Friend WithEvents cmdSearch As System.Windows.Forms.Button

End Class
