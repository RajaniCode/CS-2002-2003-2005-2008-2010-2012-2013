Public Class FrmInheritance
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
    Friend WithEvents txtParentDisplay As System.Windows.Forms.TextBox
    Friend WithEvents txtChildDisplay As System.Windows.Forms.TextBox
    Friend WithEvents cmdShowParentData As System.Windows.Forms.Button
    Friend WithEvents cmdChild As System.Windows.Forms.Button
    Friend WithEvents lblActualString As System.Windows.Forms.Label
    Friend WithEvents lblActualData As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.txtParentDisplay = New System.Windows.Forms.TextBox()
        Me.txtChildDisplay = New System.Windows.Forms.TextBox()
        Me.cmdShowParentData = New System.Windows.Forms.Button()
        Me.cmdChild = New System.Windows.Forms.Button()
        Me.lblActualString = New System.Windows.Forms.Label()
        Me.lblActualData = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'txtParentDisplay
        '
        Me.txtParentDisplay.Location = New System.Drawing.Point(24, 48)
        Me.txtParentDisplay.Name = "txtParentDisplay"
        Me.txtParentDisplay.Size = New System.Drawing.Size(296, 20)
        Me.txtParentDisplay.TabIndex = 0
        Me.txtParentDisplay.Text = ""
        '
        'txtChildDisplay
        '
        Me.txtChildDisplay.Location = New System.Drawing.Point(24, 112)
        Me.txtChildDisplay.Name = "txtChildDisplay"
        Me.txtChildDisplay.Size = New System.Drawing.Size(296, 20)
        Me.txtChildDisplay.TabIndex = 1
        Me.txtChildDisplay.Text = ""
        '
        'cmdShowParentData
        '
        Me.cmdShowParentData.Location = New System.Drawing.Point(24, 80)
        Me.cmdShowParentData.Name = "cmdShowParentData"
        Me.cmdShowParentData.Size = New System.Drawing.Size(80, 23)
        Me.cmdShowParentData.TabIndex = 2
        Me.cmdShowParentData.Text = "Show Parent"
        '
        'cmdChild
        '
        Me.cmdChild.Location = New System.Drawing.Point(24, 152)
        Me.cmdChild.Name = "cmdChild"
        Me.cmdChild.Size = New System.Drawing.Size(88, 23)
        Me.cmdChild.TabIndex = 3
        Me.cmdChild.Text = "Show Child"
        '
        'lblActualString
        '
        Me.lblActualString.Location = New System.Drawing.Point(40, 16)
        Me.lblActualString.Name = "lblActualString"
        Me.lblActualString.Size = New System.Drawing.Size(96, 16)
        Me.lblActualString.TabIndex = 4
        Me.lblActualString.Text = "Actual String"
        '
        'lblActualData
        '
        Me.lblActualData.Location = New System.Drawing.Point(152, 16)
        Me.lblActualData.Name = "lblActualData"
        Me.lblActualData.Size = New System.Drawing.Size(264, 16)
        Me.lblActualData.TabIndex = 5
        '
        'FrmInheritance
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(440, 266)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.lblActualData, Me.lblActualString, Me.cmdChild, Me.cmdShowParentData, Me.txtChildDisplay, Me.txtParentDisplay})
        Me.Name = "FrmInheritance"
        Me.Text = "Sample Inheritance"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub FrmInheritance_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim objClsParent As ClsParent
        objClsParent = New ClsParent()
        lblActualData.Text = objClsParent.GetActualString()
    End Sub

    Private Sub cmdShowParentData_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdShowParentData.Click
        Dim objClsParent As ClsParent
        objClsParent = New ClsParent()
        txtParentDisplay.Text = objClsParent.Parse()
    End Sub

    Private Sub cmdChild_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdChild.Click
        Dim objChild As ClsChild
        objChild = New ClsChild()
        txtChildDisplay.Text = objChild.ParseBackSlash()
    End Sub
End Class
