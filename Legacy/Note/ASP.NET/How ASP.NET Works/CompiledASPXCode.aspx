<%@ Page Language="c#" AutoEventWireup="false" Codebehind="CompiledASPXCode.aspx.cs" Inherits="Westwind.WebStore.CompiledASPXCode" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<html>
   <head>
      <title>Simple ASP.Net Compiler Sample</title>
      <link href="..\wwWebstore.css" type="text/css" rel="stylesheet">
      <script runat="server">
protected int TestProperty = 10;

protected string SayHello()
{
   return "Hello World, it's " + DateTime.Now.ToString();
}
      </script>
   </head>
   <body>
      <h1>Simple ASP.Net Compiler Sample</h1>
      <form id="form1" runat="server">
         The time is:
         <%= DateTime.Now %>
         ...
         <% for (int x=0; x< 10; x++) { %>
         Expression is true<br>
         <% } %>
         <p>
            Please enter your name:
            <asp:textbox id="txtName" runat="server" text="Some Text"></asp:textbox>
         <p>
            Say Hello: <%= this.xSayHello() %>
            <hr>
      </form>
      </body>
</html>
<script runat=server>
protected string SayHelloBottomOfPage()
{
   return "Hello World, it's " + DateTime.Now.ToString();
}

</script>