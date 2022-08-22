Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels.Http
Imports System.Runtime.Remoting.Channels
Imports InterFaceRemoting

Public Class RemotingServer
    Inherits MarshalByRefObject
    Implements InterFaceRemoting.InterFaceRemoting
    Private strData As String
    Public Function GetValue() As String Implements InterFaceRemoting.InterFaceRemoting.GetValue
        Return strData
    End Function
    Sub New()
        strData = "testing.."
    End Sub
    Public Sub SetValue(ByVal value As String) Implements InterFaceRemoting.InterFaceRemoting.SetValue
        strData = value
    End Sub
End Class
Module ModuleRemotingStartUp
    Sub Main()
        Dim objHttpChannel As HttpChannel
        Console.WriteLine("Server Started....")
        objHttpChannel = New HttpChannel(1234)
        ChannelServices.RegisterChannel(objHttpChannel)
        RemotingConfiguration.RegisterWellKnownServiceType(GetType(RemotingServer), "RemoteObject", WellKnownObjectMode.Singleton)
        Console.WriteLine("Server registered and listening waiting for clients...")
        Console.ReadLine()

    End Sub

End Module
