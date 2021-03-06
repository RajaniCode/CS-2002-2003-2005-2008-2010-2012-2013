Type.registerNamespace("AjaxControlToolkit.HTMLEditor.ToolbarButton");

AjaxControlToolkit.HTMLEditor.ToolbarButton.SubScript = function(element) {
    AjaxControlToolkit.HTMLEditor.ToolbarButton.SubScript.initializeBase(this, [element]);
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.SubScript.prototype = {
    callMethod : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.SubScript.callBaseMethod(this, "callMethod")) return false;
        this._designPanel._execCommand("subScript", false, null);
    },
    
    checkState : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.SubScript.callBaseMethod(this, "checkState")) return false;
        return this._designPanel._queryCommandState("subScript");
    }
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.SubScript.registerClass("AjaxControlToolkit.HTMLEditor.ToolbarButton.SubScript", AjaxControlToolkit.HTMLEditor.ToolbarButton.EditorToggleButton);

