Partial Public Class FrmReflection
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
        Me.LstDisplay = New System.Windows.Forms.ListBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'LstDisplay
        '
        Me.LstDisplay.FormattingEnabled = True
        Me.LstDisplay.Location = New System.Drawing.Point(13, 34)
        Me.LstDisplay.Margin = New System.Windows.Forms.Padding(3, 2, 3, 3)
        Me.LstDisplay.Name = "LstDisplay"
        Me.LstDisplay.Size = New System.Drawing.Size(485, 212)
        Me.LstDisplay.TabIndex = 0
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(188, 13)
        Me.Label1.Margin = New System.Windows.Forms.Padding(3, 3, 3, 1)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(180, 17)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "Reflection Display of a Button"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(501, 273)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.LstDisplay)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents LstDisplay As System.Windows.Forms.ListBox
    Friend WithEvents Label1 As System.Windows.Forms.Label

End Class
