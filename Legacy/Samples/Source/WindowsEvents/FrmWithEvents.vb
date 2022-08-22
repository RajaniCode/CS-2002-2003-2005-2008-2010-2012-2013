Public Class FrmWithEvents
    Inherits System.Windows.Forms.Form
    Private WithEvents mobjClsWithEvents As New ClsWithEvents()
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
    Friend WithEvents CmdRunEvents As System.Windows.Forms.Button
    Friend WithEvents LstData As System.Windows.Forms.ListBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.CmdRunEvents = New System.Windows.Forms.Button()
        Me.LstData = New System.Windows.Forms.ListBox()
        Me.SuspendLayout()
        '
        'CmdRunEvents
        '
        Me.CmdRunEvents.Location = New System.Drawing.Point(32, 48)
        Me.CmdRunEvents.Name = "CmdRunEvents"
        Me.CmdRunEvents.TabIndex = 0
        Me.CmdRunEvents.Text = "Run Events"
        '
        'LstData
        '
        Me.LstData.Location = New System.Drawing.Point(144, 24)
        Me.LstData.Name = "LstData"
        Me.LstData.Size = New System.Drawing.Size(200, 173)
        Me.LstData.TabIndex = 1
        '
        'FrmWithEvents
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(368, 266)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.LstData, Me.CmdRunEvents})
        Me.Name = "FrmWithEvents"
        Me.Text = "Sample of WithEvents"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub FrmWithEvents_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub mobjClsWithEvents_EventAddString(ByVal Value As String) Handles mobjClsWithEvents.EventAddString
        LstData.Items.Add(Value)
    End Sub

    Private Sub CmdRunEvents_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CmdRunEvents.Click
        mobjClsWithEvents.AddString()
    End Sub
End Class
