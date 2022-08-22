<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>SingingEels : Real-Time Progress Bar With ASP.NET AJAX</title>
</head>
<body>
	<form runat="server">
	<asp:ScriptManager runat="server">
		<Scripts>
			<asp:ScriptReference Path="ProgressBar.js" />
		</Scripts>
		<Services>
			<asp:ServiceReference Path="~/DoStuffWebService.asmx" />
		</Services>
	</asp:ScriptManager>
	<h1>
		SingingEels : Real-Time Progress Bar With ASP.NET AJAX</h1>
	<div>
		<p>
			Click any of the buttons below to start a process on the server.</p>
		<div>
			<button onclick="$get('progressBar1').Start();">
				Process 1</button>
			<SingingEels:ProgressBar ID="progressBar1" runat="server" PollInterval="250" ProcessName="Format Hard Drive" />
		</div>
		<div>
			<button onclick="$get('progressBar2').Start();">
				Process 2</button>
			<SingingEels:ProgressBar ID="progressBar2" runat="server" PollInterval="500" ProcessName="Defrag Computer" />
		</div>
		<div>
			<button onclick="$get('progressBar3').Start();">
				Process 3</button>
			<SingingEels:ProgressBar ID="progressBar3" runat="server" PollInterval="250" ProcessName="Email Mom" />
		</div>
	</div>
	</form>
</body>
</html>
