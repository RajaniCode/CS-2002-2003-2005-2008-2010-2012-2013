Public Class ClsShared
    Shared intCount As Integer
    Public Function AddCount() As Integer
        intCount = intCount + 1
        Return intCount
    End Function
End Class
