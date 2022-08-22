Public Class FrmDelegates
    Inherits System.Windows.Forms.Form
    Public Delegate Sub DelegateAddString()
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
    Friend WithEvents cmdDelegates As System.Windows.Forms.Button
    Friend WithEvents lstDelegates As System.Windows.Forms.ListBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.cmdDelegates = New System.Windows.Forms.Button()
        Me.lstDelegates = New System.Windows.Forms.ListBox()
        Me.SuspendLayout()
        '
        'cmdDelegates
        '
        Me.cmdDelegates.Location = New System.Drawing.Point(24, 16)
        Me.cmdDelegates.Name = "cmdDelegates"
        Me.cmdDelegates.Size = New System.Drawing.Size(112, 23)
        Me.cmdDelegates.TabIndex = 0
        Me.cmdDelegates.Text = "Run Delegates"
        '
        'lstDelegates
        '
        Me.lstDelegates.Location = New System.Drawing.Point(176, 16)
        Me.lstDelegates.Name = "lstDelegates"
        Me.lstDelegates.Size = New System.Drawing.Size(272, 186)
        Me.lstDelegates.TabIndex = 1
        '
        'FrmDelegates
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(472, 238)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.lstDelegates, Me.cmdDelegates})
        Me.Name = "FrmDelegates"
        Me.Text = "Sample Event handling"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub FrmDelegates_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub
    Private Sub AddString()
        lstDelegates.Items.Add("Running AddString() method")
    End Sub
    Private Sub cmdDelegates_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDelegates.Click
        Dim objDelegateAddString As DelegateAddString
        objDelegateAddString = AddressOf AddString
        objDelegateAddString.Invoke()
    End Sub
End Class
