Type.registerNamespace("AjaxControlToolkit.HTMLEditor.ToolbarButton");

AjaxControlToolkit.HTMLEditor.ToolbarButton.Italic = function(element) {
    AjaxControlToolkit.HTMLEditor.ToolbarButton.Italic.initializeBase(this, [element]);
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.Italic.prototype = {
    callMethod : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.Italic.callBaseMethod(this, "callMethod")) return false;
        this._designPanel._execCommand("italic", false, null);
    },
    
    checkState : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.Italic.callBaseMethod(this, "checkState")) return false;
        return this._designPanel._queryCommandState("italic");
    }
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.Italic.registerClass("AjaxControlToolkit.HTMLEditor.ToolbarButton.Italic", AjaxControlToolkit.HTMLEditor.ToolbarButton.EditorToggleButton);

