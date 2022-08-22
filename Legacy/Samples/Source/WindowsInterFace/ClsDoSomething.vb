Public Class ClsDoSomething
    Implements IInterFace
    Public Sub DoSomething() Implements WindowsInterFace.IInterFace.DoSomething
        MsgBox("Interface implemented")
    End Sub
End Class
