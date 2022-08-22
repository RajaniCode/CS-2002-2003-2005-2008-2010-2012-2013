Public Class ClsChild
    Inherits ClsParent

    ' this is child and a special parse function is added which will also parse "/"
    Public Function ParseBackSlash()
        Dim PstrData As String
        PstrData = Me.Parse()
        PstrData = Replace(PstrData, "/", "")
        Return PstrData
    End Function

End Class
