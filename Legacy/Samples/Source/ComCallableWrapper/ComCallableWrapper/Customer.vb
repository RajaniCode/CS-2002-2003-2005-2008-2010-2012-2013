Public Interface ICustomer
    Property CustomerName() As String
    Property CustomerCode() As String
    Sub AddCustomer()
End Interface
Public Class Customer
    Implements ICustomer
    Private PstrCustomerName As String
    Private PstrCustomerCode As String

    Public Sub AddCustomer() Implements ICustomer.AddCustomer
        Try
            ' addin of database code can go here
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Property CustomerCode() As String Implements ICustomer.CustomerCode
        Get
            Return PstrCustomerCode
        End Get
        Set(ByVal value As String)
            PstrCustomerCode = value
        End Set
    End Property

    Public Property CustomerName() As String Implements ICustomer.CustomerName
        Get
            Return PstrCustomerName
        End Get
        Set(ByVal value As String)
            PstrCustomerName = value
        End Set
    End Property

    Public Sub New()

    End Sub
End Class
