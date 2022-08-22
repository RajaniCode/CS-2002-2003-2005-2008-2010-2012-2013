Imports System.Runtime.Remoting
Module Module1
    Sub Main()
        RemotingConfiguration.Configure(AppDomain.CurrentDomain.SetupInformation.ApplicationBase & "Server.config")
        Console.WriteLine("Server ready and listening")
        Console.ReadLine()
    End Sub
End Module
