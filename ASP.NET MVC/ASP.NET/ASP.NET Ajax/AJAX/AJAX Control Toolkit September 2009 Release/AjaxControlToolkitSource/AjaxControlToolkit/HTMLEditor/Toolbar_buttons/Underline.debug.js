Type.registerNamespace("AjaxControlToolkit.HTMLEditor.ToolbarButton");

AjaxControlToolkit.HTMLEditor.ToolbarButton.Underline = function(element) {
    AjaxControlToolkit.HTMLEditor.ToolbarButton.Underline.initializeBase(this, [element]);
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.Underline.prototype = {
    callMethod : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.Underline.callBaseMethod(this, "callMethod")) return false;
        this._designPanel._execCommand("underline", false, null);
    },
    
    checkState : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.Underline.callBaseMethod(this, "checkState")) return false;
        return this._designPanel._queryCommandState("underline");
    }
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.Underline.registerClass("AjaxControlToolkit.HTMLEditor.ToolbarButton.Underline", AjaxControlToolkit.HTMLEditor.ToolbarButton.EditorToggleButton);


