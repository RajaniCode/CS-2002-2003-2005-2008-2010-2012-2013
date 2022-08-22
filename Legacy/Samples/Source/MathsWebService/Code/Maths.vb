Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols

<WebServiceBinding(ConformanceClaims:=WsiClaims.BP10, EmitConformanceClaims:=True)> _
Public Class ClsMaths
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function AddTwoNumbers(ByVal Number1 As Integer, ByVal Number2 As Integer) As Integer
        Return Number1 + Number2
    End Function

End Class
