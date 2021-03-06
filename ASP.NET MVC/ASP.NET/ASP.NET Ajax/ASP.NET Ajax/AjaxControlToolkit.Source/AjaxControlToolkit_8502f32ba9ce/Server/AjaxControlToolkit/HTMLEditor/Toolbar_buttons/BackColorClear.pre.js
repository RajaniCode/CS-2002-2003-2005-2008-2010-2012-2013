Type.registerNamespace("Sys.Extended.UI.HTMLEditor.ToolbarButton");

Sys.Extended.UI.HTMLEditor.ToolbarButton.BackColorClear = function(element) {
    Sys.Extended.UI.HTMLEditor.ToolbarButton.BackColorClear.initializeBase(this, [element]);
}

Sys.Extended.UI.HTMLEditor.ToolbarButton.BackColorClear.prototype = {
    callMethod : function() {
        if(!Sys.Extended.UI.HTMLEditor.ToolbarButton.BackColorClear.callBaseMethod(this, "callMethod")) return false;
        this._designPanel._execCommand("backcolor", false, "");
    }
}

Sys.Extended.UI.HTMLEditor.ToolbarButton.BackColorClear.registerClass("Sys.Extended.UI.HTMLEditor.ToolbarButton.BackColorClear", Sys.Extended.UI.HTMLEditor.ToolbarButton.MethodButton);

