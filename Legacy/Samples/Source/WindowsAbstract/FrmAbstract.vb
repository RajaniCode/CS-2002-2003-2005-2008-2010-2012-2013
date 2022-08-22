Public Class FrmAbstract
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
    Friend WithEvents txtNum1 As System.Windows.Forms.TextBox
    Friend WithEvents txtNum2 As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents cmdAdd As System.Windows.Forms.Button
    Friend WithEvents cmdMultiply As System.Windows.Forms.Button
    Friend WithEvents txtCal As System.Windows.Forms.TextBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.txtNum1 = New System.Windows.Forms.TextBox()
        Me.txtNum2 = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.txtCal = New System.Windows.Forms.TextBox()
        Me.cmdAdd = New System.Windows.Forms.Button()
        Me.cmdMultiply = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'txtNum1
        '
        Me.txtNum1.Location = New System.Drawing.Point(16, 32)
        Me.txtNum1.Name = "txtNum1"
        Me.txtNum1.Size = New System.Drawing.Size(48, 20)
        Me.txtNum1.TabIndex = 0
        Me.txtNum1.Text = ""
        '
        'txtNum2
        '
        Me.txtNum2.Location = New System.Drawing.Point(72, 32)
        Me.txtNum2.Name = "txtNum2"
        Me.txtNum2.Size = New System.Drawing.Size(56, 20)
        Me.txtNum2.TabIndex = 1
        Me.txtNum2.Text = ""
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(144, 32)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(16, 16)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "="
        '
        'txtCal
        '
        Me.txtCal.Location = New System.Drawing.Point(168, 32)
        Me.txtCal.Name = "txtCal"
        Me.txtCal.Size = New System.Drawing.Size(56, 20)
        Me.txtCal.TabIndex = 3
        Me.txtCal.Text = ""
        '
        'cmdAdd
        '
        Me.cmdAdd.Location = New System.Drawing.Point(16, 72)
        Me.cmdAdd.Name = "cmdAdd"
        Me.cmdAdd.Size = New System.Drawing.Size(48, 23)
        Me.cmdAdd.TabIndex = 4
        Me.cmdAdd.Text = "Add"
        '
        'cmdMultiply
        '
        Me.cmdMultiply.Location = New System.Drawing.Point(80, 72)
        Me.cmdMultiply.Name = "cmdMultiply"
        Me.cmdMultiply.Size = New System.Drawing.Size(56, 23)
        Me.cmdMultiply.TabIndex = 5
        Me.cmdMultiply.Text = "Multiply"
        '
        'FrmAbstract
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 266)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.cmdMultiply, Me.cmdAdd, Me.txtCal, Me.Label1, Me.txtNum2, Me.txtNum1})
        Me.Name = "FrmAbstract"
        Me.Text = "Sample Abstract"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMultiply.Click
        SetNumeric()
        If IsTextNumeric() Then
            Dim pobjClsChild As ClsChild
            pobjClsChild = New ClsChild()
            txtCal.Text = pobjClsChild.MultiplyNumber(txtNum1.Text, txtNum2.Text)
        End If
    End Sub
    Private Sub SetNumeric()
        If txtNum1.Text.Length = 0 Then
            txtNum1.Text = 0
        End If
        If txtNum2.Text.Length = 0 Then
            txtNum2.Text = 0
        End If
    End Sub
    Private Function IsTextNumeric() As Boolean

        If IsNumeric(txtNum1.Text) And IsNumeric(txtNum2.Text) Then
            Return True
        Else
            Return False
        End If
    End Function
    Private Sub cmdAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdAdd.Click
        SetNumeric()
        If IsTextNumeric() Then
            'Dim PobjClsAbstract As New ClsAbstract()
            'this sentence will fail you can not create a object of a abstract class
            Dim pobjClsChild As ClsChild
            pobjClsChild = New ClsChild()
            txtCal.Text = pobjClsChild.Add(txtNum1.Text, txtNum2.Text)
        End If
    End Sub

    Private Sub FrmAbstract_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub
End Class
