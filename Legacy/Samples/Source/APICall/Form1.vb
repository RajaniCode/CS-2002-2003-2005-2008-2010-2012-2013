Public Class Form1
    Declare Auto Sub Sleep Lib "kernel32.dll" (ByVal dwMilliseconds As Long)
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        MessageBox.Show(" start sleeping for 5000 Milli seconds.....")
        Sleep(5000)
        MessageBox.Show(" end of sleeping.....")
    End Sub
End Class
