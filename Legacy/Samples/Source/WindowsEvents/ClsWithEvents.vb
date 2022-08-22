Public Class ClsWithEvents
    Event EventAddString(ByVal Value As String)
    Public Sub AddString()
        RaiseEvent EventAddString("String added by Event")
    End Sub
End Class
