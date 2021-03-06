Type.registerNamespace("Sys.Extended.UI.HTMLEditor.ToolbarButton");

Sys.Extended.UI.HTMLEditor.ToolbarButton.StrikeThrough = function(element) {
    Sys.Extended.UI.HTMLEditor.ToolbarButton.StrikeThrough.initializeBase(this, [element]);
}

Sys.Extended.UI.HTMLEditor.ToolbarButton.StrikeThrough.prototype = {
    callMethod : function() {
        if(!Sys.Extended.UI.HTMLEditor.ToolbarButton.StrikeThrough.callBaseMethod(this, "callMethod")) return false;
        this._designPanel._execCommand("strikeThrough", false, null);
    },
    
    checkState : function() {
        if(!Sys.Extended.UI.HTMLEditor.ToolbarButton.StrikeThrough.callBaseMethod(this, "checkState")) return false;
        return this._designPanel._queryCommandState("strikeThrough");
    }
}

Sys.Extended.UI.HTMLEditor.ToolbarButton.StrikeThrough.registerClass("Sys.Extended.UI.HTMLEditor.ToolbarButton.StrikeThrough", Sys.Extended.UI.HTMLEditor.ToolbarButton.EditorToggleButton);

