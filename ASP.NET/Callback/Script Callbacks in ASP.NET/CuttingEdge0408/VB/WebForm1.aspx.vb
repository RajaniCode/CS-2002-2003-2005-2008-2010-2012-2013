Imports System.Data.SqlClient

Public Class CallbackPage
    Inherits System.Web.UI.Page

    ' References to page controls
    Protected EmployeeList As DropDownList
    Protected ButtonGo As HtmlButton

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If IsCallback() Then Return

        If Not IsPostBack Then PopulateList()

        ' Button-to-callback binding
        Dim callbackRef As String = "MoreInfo()"
        ButtonGo.Attributes("onclick") = callbackRef
    End Sub

    Private Function IsCallback() As Boolean
        If Not Request.QueryString("callback") Is Nothing Then
            Dim param As String = Request.QueryString("param").ToString()
            Response.Write(RaiseCallbackEvent(param))
            Response.Flush()
            Response.End()
            Return True
        End If
        Return False
    End Function

    ' Handle the "Go Get Data" button click
    Protected Sub OnGoGetData(ByVal sender As Object, ByVal e As EventArgs)
    End Sub

    ' Populate the drop-down list with employee names
    Private Sub PopulateList()
        Dim adapter As New SqlDataAdapter( _
    "SELECT employeeid, lastname FROM employees", _
    "SERVER=(local);DATABASE=northwind;TRUSTED_CONNECTION=true;")
        Dim Table As New DataTable
        adapter.Fill(Table)

        EmployeeList.DataTextField = "lastname"
        EmployeeList.DataValueField = "employeeid"
        EmployeeList.DataSource = Table
        EmployeeList.DataBind()
    End Sub


    ' *******************************************************
    ' Implement the callback interface
    Private Function RaiseCallbackEvent(ByVal eventArgument As String) As String
        Return "You clicked: " + eventArgument
    End Function
    ' *******************************************************

End Class