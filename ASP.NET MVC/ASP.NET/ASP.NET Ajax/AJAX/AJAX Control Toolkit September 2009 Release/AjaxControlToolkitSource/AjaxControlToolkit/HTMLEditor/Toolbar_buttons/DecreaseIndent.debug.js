Type.registerNamespace("AjaxControlToolkit.HTMLEditor.ToolbarButton");

AjaxControlToolkit.HTMLEditor.ToolbarButton.DecreaseIndent = function(element) {
    AjaxControlToolkit.HTMLEditor.ToolbarButton.DecreaseIndent.initializeBase(this, [element]);
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.DecreaseIndent.prototype = {
    callMethod : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.DecreaseIndent.callBaseMethod(this, "callMethod")) return false;
        this._designPanel._execCommand("Outdent");
    }
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.DecreaseIndent.registerClass("AjaxControlToolkit.HTMLEditor.ToolbarButton.DecreaseIndent", AjaxControlToolkit.HTMLEditor.ToolbarButton.MethodButton);

