Type.registerNamespace("AjaxControlToolkit.HTMLEditor.ToolbarButton");

AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyFull = function(element) {
    AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyFull.initializeBase(this, [element]);
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyFull.prototype = {
    checkState : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyFull.callBaseMethod(this, "checkState")) return false;
        return this._designPanel._textAlignState("justify");
    },
    
    callMethod : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyFull.callBaseMethod(this, "callMethod")) return false;
        this._designPanel._execCommand("JustifyFull");
    }
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyFull.registerClass("AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyFull", AjaxControlToolkit.HTMLEditor.ToolbarButton.EditorToggleButton);

