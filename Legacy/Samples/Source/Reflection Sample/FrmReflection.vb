Public Class FrmReflection

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim Pobjtype As Type
        Dim PobjObject As Object
        Dim PobjButtons As New Windows.Forms.Button()
        Pobjtype = PobjButtons.GetType()
        For Each PobjObject In Pobjtype.GetMembers
            LstDisplay.Items.Add(PobjObject.ToString())
        Next
    End Sub
End Class
