Public Class ClsChild
    Inherits ClsAbstract
    ' class child overrides the Multiplynumber function 
    Public Overrides Function MultiplyNumber(ByVal intnum1 As Integer, ByVal intnum2 As Integer) As Integer
        Return intnum1 * intnum2
    End Function
End Class
