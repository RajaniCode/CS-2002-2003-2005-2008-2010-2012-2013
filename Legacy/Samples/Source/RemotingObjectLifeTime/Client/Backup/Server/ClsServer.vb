Imports CommonInterFace
Public Class ClsServer
    Inherits MarshalByRefObject
    Implements CommonInterFace.Icommon

    Private strData As String
    Public Function GetValue() As String Implements CommonInterFace.Icommon.GetValue
        Return strData
    End Function
    Public Sub SetValue(ByVal Value As String) Implements CommonInterFace.Icommon.SetValue
        strData = Value
    End Sub
    Sub New()
        strData = "This is server side set message ...."
    End Sub
End Class
