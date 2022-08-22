
Partial Class WebServiceClient_aspx

    Sub cmdCalculate_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim pobjMaths As New localhost.ClsMaths
        lblResultDisplay.Text = Convert.ToString(pobjMaths.AddTwoNumbers(Convert.ToInt16(txtNumber1.Text), Convert.ToInt16(txtNumber2.Text)))
    End Sub

    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
