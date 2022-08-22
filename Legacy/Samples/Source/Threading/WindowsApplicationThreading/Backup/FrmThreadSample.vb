Imports System.Threading
Public Class Form1
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
    Friend WithEvents lstThreadDisplay As System.Windows.Forms.ListBox
    Friend WithEvents cmdChangePrority As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.lstThreadDisplay = New System.Windows.Forms.ListBox
        Me.cmdChangePrority = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'lstThreadDisplay
        '
        Me.lstThreadDisplay.Location = New System.Drawing.Point(8, 8)
        Me.lstThreadDisplay.Name = "lstThreadDisplay"
        Me.lstThreadDisplay.Size = New System.Drawing.Size(256, 212)
        Me.lstThreadDisplay.TabIndex = 0
        '
        'cmdChangePrority
        '
        Me.cmdChangePrority.Location = New System.Drawing.Point(272, 16)
        Me.cmdChangePrority.Name = "cmdChangePrority"
        Me.cmdChangePrority.Size = New System.Drawing.Size(80, 64)
        Me.cmdChangePrority.TabIndex = 1
        Me.cmdChangePrority.Text = "Run Second thread with High Prority"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(440, 245)
        Me.Controls.Add(Me.cmdChangePrority)
        Me.Controls.Add(Me.lstThreadDisplay)
        Me.Name = "Form1"
        Me.Text = "Thread Sample"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim pthread1 As New Thread(AddressOf Thread1)
        Dim pthread2 As New Thread(AddressOf Thread2)
        pthread1.Start()
        pthread2.Start()
    End Sub
    Public Sub Thread1()
        Dim pintcount As Integer
        Dim pstr As String
        pstr = "This is first  thread"
        Do Until pintcount > 5
            lstThreadDisplay.Items.Add(pstr)
            pintcount = pintcount + 1

        Loop
    End Sub
    Public Sub Thread2()
        Dim pintcount As Integer
        Dim pstr As String
        pstr = "This is second thread"
        Do Until pintcount > 5
            lstThreadDisplay.Items.Add(pstr)
            pintcount = pintcount + 1
        Loop
    End Sub
    Private Sub cmdChangePrority_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdChangePrority.Click
        Dim pthread1 As New Thread(AddressOf Thread1)
        Dim pthread2 As New Thread(AddressOf Thread2)
        ' clearing the list grid
        lstThreadDisplay.Items.Clear()
        pthread1.Start()
        ' want to run the second thread as high prority
        pthread2.Priority = ThreadPriority.Highest
        pthread2.Start()
    End Sub

    
End Class
