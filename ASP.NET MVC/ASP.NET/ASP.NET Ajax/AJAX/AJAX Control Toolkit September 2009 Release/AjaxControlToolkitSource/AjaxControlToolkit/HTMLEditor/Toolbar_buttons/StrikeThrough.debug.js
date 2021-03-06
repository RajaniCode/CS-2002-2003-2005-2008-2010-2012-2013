Type.registerNamespace("AjaxControlToolkit.HTMLEditor.ToolbarButton");

AjaxControlToolkit.HTMLEditor.ToolbarButton.StrikeThrough = function(element) {
    AjaxControlToolkit.HTMLEditor.ToolbarButton.StrikeThrough.initializeBase(this, [element]);
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.StrikeThrough.prototype = {
    callMethod : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.StrikeThrough.callBaseMethod(this, "callMethod")) return false;
        this._designPanel._execCommand("strikeThrough", false, null);
    },
    
    checkState : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.StrikeThrough.callBaseMethod(this, "checkState")) return false;
        return this._designPanel._queryCommandState("strikeThrough");
    }
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.StrikeThrough.registerClass("AjaxControlToolkit.HTMLEditor.ToolbarButton.StrikeThrough", AjaxControlToolkit.HTMLEditor.ToolbarButton.EditorToggleButton);

