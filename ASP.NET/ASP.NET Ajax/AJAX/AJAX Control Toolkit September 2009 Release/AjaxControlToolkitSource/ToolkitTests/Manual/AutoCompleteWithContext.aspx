<%@ Page Language="C#" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        // Fake a delay so you notice the color animation...
        System.Threading.Thread.Sleep(1000);

        return new string[] { "a", "b", "c", "d", contextKey ?? "null" };
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AutoComplete with Context</title>
</head>
<body><form runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" />
        You should see the user specific context at the end of the completion list...<br />
        User specific context: <asp:TextBox ID="UserContext" runat="server" /><br />
        AutoComplete: <asp:TextBox ID="Address" runat="server" />
        <ajaxToolkit:AutoCompleteExtender ID="AutoComplete" BehaviorID="AutoCompleteBehavior" runat="server"
            TargetControlID="Address" ServiceMethod="GetCompletionList" />
        <ajaxToolkit:AnimationExtender runat="server" TargetControlID="Address" />
        
        <script type="text/javascript">
            // Hook up to the AutoComplete populating/populated events
            function pageLoad() {
                var autoComplete = $find('AutoCompleteBehavior');
                if (!autoComplete) return;
                var target = autoComplete.get_element();
                if (!target) return;
                var userContext = $get('UserContext');
                if (!userContext) return;
                
                // Dynamically assign the context and change the color when processing
                autoComplete.add_populating(function()
                    {
                        autoComplete.set_contextKey(userContext.value);
                        AjaxControlToolkit.Animation.ColorAnimation.play(target, 1, 20, 'style', 'backgroundColor', '#FFFFFF', '#EFC4C1');
                    });
                autoComplete.add_populated(function()
                    {
                        AjaxControlToolkit.Animation.ColorAnimation.play(target, 1, 20, 'style', 'backgroundColor', '#EFC4C1', '#FFFFFF');
                    });
            }
        </script>
</form></body>
</html>