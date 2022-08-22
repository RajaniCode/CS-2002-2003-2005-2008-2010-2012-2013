Public MustInherit Class ClsAbstract
    ' use the mustinherit class to declare the class as abstract
    Public Function Add(ByVal intnum1 As Integer, ByVal intnum2 As Integer) As Integer
        Return intnum1 + intnum2
    End Function
    ' left this seconf function to be completed by the inheriting class
    Public MustOverride Function MultiplyNumber(ByVal intnum1 As Integer, ByVal intnum2 As Integer) As Integer
End Class
