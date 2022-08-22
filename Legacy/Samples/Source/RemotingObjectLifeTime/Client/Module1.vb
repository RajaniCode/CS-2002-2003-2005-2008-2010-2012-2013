Imports System.Runtime.Remoting
Imports CommonInterFace
Module Module1
    Sub Main()
        Dim IobjCommon As CommonInterFace.Icommon
        Dim StrData As String
        Dim objServiceEntries As WellKnownClientTypeEntry()
        RemotingConfiguration.Configure(AppDomain.CurrentDomain.SetupInformation.ApplicationBase & "Client.config")
        objServiceEntries = RemotingConfiguration.GetRegisteredWellKnownClientTypes()
        IobjCommon = Activator.GetObject(GetType(Icommon), objServiceEntries(0).ObjectUrl.ToString())
        StrData = IobjCommon.GetValue()
        Console.WriteLine(" Serve side Data is " & StrData)
        Console.ReadLine()
    End Sub

End Module
