Public Class ClsParent
    Protected strData As String = "jksdhkj@dadad///ajkdhsjakd"
    Public Function Parse() As String
        Dim PstrData As String
        PstrData = strData
        PstrData = Replace(PstrData, "@", "")
        Return PstrData
    End Function
    Public Function GetActualString() As String
        Return strData
    End Function
End Class
