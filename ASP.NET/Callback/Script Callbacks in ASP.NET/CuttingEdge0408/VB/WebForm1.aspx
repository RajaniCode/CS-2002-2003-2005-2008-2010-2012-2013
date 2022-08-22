<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebForm1.aspx.vb" Inherits="MsdnMag.CallbackPage"%>

<SCRIPT language="javascript">
    function DoCallback(url, params)
    {
		var pageUrl = url + "?callback=true&param=" + params;
		var xmlRequest = new ActiveXObject("Microsoft.XMLHTTP");
		xmlRequest.open("POST", pageUrl, false);
        xmlRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlRequest.send(null);
        return xmlRequest;
    }
    
    function MoreInfo()
    {
        var selectedEmpID = document.all["EmployeeList"].value;
		var xmlRequest = DoCallback("webform1.aspx", selectedEmpID);

		// sync updates
		Msg.innerHTML = xmlRequest.responseText;
    }
</SCRIPT>


<HTML>
	<HEAD>
		<title>Script Callbacks</title>
	</HEAD>
	<body>
		<form runat="server" ID="Form1">
			<h1>Demonstrate Out-of-band Calls</h1>
			<h2><%=Request.Url%></h2>
			<hr>
			
			<asp:DropDownList Runat="server" ID="EmployeeList" />
			<Button Runat="server" ID="ButtonGo">Go Get Data</Button>

			<hr>
			<span ID="Msg" />
		</form>
	</body>
</HTML>