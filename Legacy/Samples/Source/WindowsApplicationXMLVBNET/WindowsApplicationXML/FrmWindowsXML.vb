Imports System.xml
Public Class FrmWindowsXML
    Private Sub CmdLoadXML_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CmdLoadXML.Click
        Dim pstr As String = "Following is the Data in this XML file"

        Dim obj As New XmlTextReader("TestingXML.xml")
        While obj.Read()

            If obj.Value.Trim.Length <> 0 Then
                pstr = pstr & vbCrLf & obj.Value
            End If

        End While
        MsgBox(pstr)
    End Sub
End Class
