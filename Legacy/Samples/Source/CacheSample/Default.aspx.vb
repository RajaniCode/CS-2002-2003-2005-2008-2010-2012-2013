
Partial Class Default_aspx
    Public Sub displayAnnouncement()
        Dim announcement As String
        If Cache("announcement") Is Nothing Then
            Dim file As New _
              System.IO.StreamReader _
             (Server.MapPath("announcement.txt"))
            announcement = file.ReadToEnd
            file.Close()
            Dim depends As New _
                System.Web.Caching.CacheDependency _
               (Server.MapPath("announcement.txt"))
            Cache.Insert("announcement", announcement, depends)
        End If
        Response.Write(CType(Cache("announcement"), String))
    End Sub
    Private Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        displayAnnouncement()

    End Sub
End Class


