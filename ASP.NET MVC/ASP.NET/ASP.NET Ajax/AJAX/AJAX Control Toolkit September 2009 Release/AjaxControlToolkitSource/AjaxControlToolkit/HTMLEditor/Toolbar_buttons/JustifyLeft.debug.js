Type.registerNamespace("AjaxControlToolkit.HTMLEditor.ToolbarButton");

AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyLeft = function(element) {
    AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyLeft.initializeBase(this, [element]);
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyLeft.prototype = {
    checkState : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyLeft.callBaseMethod(this, "checkState")) return false;
        return this._designPanel._textAlignState("left");
    },
    
    callMethod : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyLeft.callBaseMethod(this, "callMethod")) return false;
        this._designPanel._execCommand("JustifyLeft");
    }
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyLeft.registerClass("AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyLeft", AjaxControlToolkit.HTMLEditor.ToolbarButton.EditorToggleButton);

