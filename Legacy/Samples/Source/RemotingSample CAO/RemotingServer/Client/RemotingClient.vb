Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels.Http
Imports System.Runtime.Remoting.Channels
Imports InterFaceRemoting

Module ModuleStartClient
    Sub Main()
        Dim objHttpChannel As New HttpChannel
        Dim objRemoting As InterFaceRemoting.InterFaceRemoting
        ChannelServices.RegisterChannel(objHttpChannel)
        objRemoting = CType(Activator.GetObject(GetType(InterFaceRemoting.InterFaceRemoting), "http://localhost:1234/RemoteObject"), InterFaceRemoting.InterFaceRemoting)
        Console.WriteLine("Referenced the main object.... Now displaying Data")
        Console.WriteLine("Value on server :-  " & objRemoting.GetValue.ToString())
        Console.WriteLine("Press enter to Terminate")
        Console.ReadLine()
    End Sub

End Module