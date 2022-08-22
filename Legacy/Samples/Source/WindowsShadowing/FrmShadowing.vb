Public Class Form1
    Inherits System.Windows.Forms.Form
    Private objClsParent As New ClsParent()
    Private objClsShadows As New ClsShadowedParent()
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
    Friend WithEvents cmdParent As System.Windows.Forms.Button
    Friend WithEvents cmdShadows As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.cmdParent = New System.Windows.Forms.Button()
        Me.cmdShadows = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'cmdParent
        '
        Me.cmdParent.Location = New System.Drawing.Point(32, 40)
        Me.cmdParent.Name = "cmdParent"
        Me.cmdParent.TabIndex = 0
        Me.cmdParent.Text = "Main class"
        '
        'cmdShadows
        '
        Me.cmdShadows.Location = New System.Drawing.Point(128, 40)
        Me.cmdShadows.Name = "cmdShadows"
        Me.cmdShadows.TabIndex = 1
        Me.cmdShadows.Text = "Shadows"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(256, 174)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.cmdShadows, Me.cmdParent})
        Me.Name = "Form1"
        Me.Text = "Sample of Shadowing"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub cmdParent_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdParent.Click
        objClsParent.x = 122
        MsgBox(objClsParent.x.ToString())
    End Sub

    Private Sub cmdShadows_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdShadows.Click
        objClsShadows.x = "hell there"
        MsgBox(objClsShadows.x)
    End Sub
End Class
