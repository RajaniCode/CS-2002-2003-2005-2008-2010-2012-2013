Type.registerNamespace("AjaxControlToolkit.HTMLEditor.ToolbarButton");

AjaxControlToolkit.HTMLEditor.ToolbarButton.Undo = function(element) {
    AjaxControlToolkit.HTMLEditor.ToolbarButton.Undo.initializeBase(this, [element]);
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.Undo.prototype = {
    callMethod : function() {
        if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.Undo.callBaseMethod(this, "callMethod")) return false;
        this._designPanel.undo();
    }
}

AjaxControlToolkit.HTMLEditor.ToolbarButton.Undo.registerClass("AjaxControlToolkit.HTMLEditor.ToolbarButton.Undo", AjaxControlToolkit.HTMLEditor.ToolbarButton.MethodButton);

