Partial Public Class FrmWindowsXML
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
        Me.CmdLoadXML = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'CmdLoadXML
        '
        Me.CmdLoadXML.Location = New System.Drawing.Point(71, 57)
        Me.CmdLoadXML.Name = "CmdLoadXML"
        Me.CmdLoadXML.Size = New System.Drawing.Size(132, 38)
        Me.CmdLoadXML.TabIndex = 0
        Me.CmdLoadXML.Text = "Load XML File"
        '
        'FrmWindowsXML
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(267, 177)
        Me.Controls.Add(Me.CmdLoadXML)
        Me.Name = "FrmWindowsXML"
        Me.Text = "XML Testing"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents CmdLoadXML As System.Windows.Forms.Button

End Class
