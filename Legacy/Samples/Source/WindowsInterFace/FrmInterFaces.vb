Public Class FrmInterFaces
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
    Friend WithEvents CmdTestInterFace As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.CmdTestInterFace = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'CmdTestInterFace
        '
        Me.CmdTestInterFace.Location = New System.Drawing.Point(128, 72)
        Me.CmdTestInterFace.Name = "CmdTestInterFace"
        Me.CmdTestInterFace.Size = New System.Drawing.Size(128, 23)
        Me.CmdTestInterFace.TabIndex = 0
        Me.CmdTestInterFace.Text = "Test InterFace"
        '
        'FrmInterFaces
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 266)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.CmdTestInterFace})
        Me.Name = "FrmInterFaces"
        Me.Text = "FrmInterFaces"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub FrmInterFaces_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
       
    End Sub

    Private Sub CmdTestInterFace_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CmdTestInterFace.Click
        Dim pobjIInterFace As IInterFace
        Dim pobjClsDoSomething As New ClsDoSomething()
        pobjIInterFace = pobjClsDoSomething
        pobjIInterFace.DoSomething()
    End Sub
End Class
