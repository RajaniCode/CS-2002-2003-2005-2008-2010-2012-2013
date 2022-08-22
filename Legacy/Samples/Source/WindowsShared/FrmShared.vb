Public Class FrmSharedClasses
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents CmdInstance1 As System.Windows.Forms.Button
    Friend WithEvents CmdInstance2 As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.CmdInstance1 = New System.Windows.Forms.Button()
        Me.CmdInstance2 = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'CmdInstance1
        '
        Me.CmdInstance1.Location = New System.Drawing.Point(40, 64)
        Me.CmdInstance1.Name = "CmdInstance1"
        Me.CmdInstance1.TabIndex = 0
        Me.CmdInstance1.Text = "Instance1"
        '
        'CmdInstance2
        '
        Me.CmdInstance2.Location = New System.Drawing.Point(160, 64)
        Me.CmdInstance2.Name = "CmdInstance2"
        Me.CmdInstance2.TabIndex = 1
        Me.CmdInstance2.Text = "Instance2"
        '
        'FrmSharedClasses
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 266)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.CmdInstance2, Me.CmdInstance1})
        Me.Name = "FrmSharedClasses"
        Me.Text = "Sample of Shared Classes"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub CmdInstance1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CmdInstance1.Click
        Dim pobjClsShared As New ClsShared()
        MessageBox.Show("The count at this moment is" & pobjClsShared.AddCount.ToString())
    End Sub

    Private Sub FrmSharedClasses_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub CmdInstance2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CmdInstance2.Click
        Dim pobjClsShared As New ClsShared()
        MessageBox.Show("The count at this moment is" & pobjClsShared.AddCount.ToString())
    End Sub
End Class
