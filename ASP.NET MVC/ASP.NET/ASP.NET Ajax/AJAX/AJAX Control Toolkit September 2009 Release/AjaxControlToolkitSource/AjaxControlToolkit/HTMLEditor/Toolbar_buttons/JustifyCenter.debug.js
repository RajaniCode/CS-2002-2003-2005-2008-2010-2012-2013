Type.registerNamespace("AjaxControlToolkit.HTMLEditor.ToolbarButton");

AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyCenter = function(element) {
    AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyCenter.initializeBase(this, [element]);
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyCenter.prototype = {
    checkState : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyCenter.callBaseMethod(this, "checkState")) return false;
        return this._designPanel._textAlignState("center");
    },
    
    callMethod : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyCenter.callBaseMethod(this, "callMethod")) return false;
        this._designPanel._execCommand("JustifyCenter");
    }
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyCenter.registerClass("AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyCenter", AjaxControlToolkit.HTMLEditor.ToolbarButton.EditorToggleButton);

