Type.registerNamespace("Sys.Extended.UI.HTMLEditor.Popups");

Sys.Extended.UI.HTMLEditor.Popups.OkCancelAttachedTemplatePopup = function(element) {
    Sys.Extended.UI.HTMLEditor.Popups.OkCancelAttachedTemplatePopup.initializeBase(this, [element]);
}

Sys.Extended.UI.HTMLEditor.Popups.OkCancelAttachedTemplatePopup.prototype = {
    
    initialize : function() {
        Sys.Extended.UI.HTMLEditor.Popups.OkCancelAttachedTemplatePopup.callBaseMethod(this, "initialize");
    },
    
    dispose : function() {
        Sys.Extended.UI.HTMLEditor.Popups.OkCancelAttachedTemplatePopup.callBaseMethod(this, "dispose");
    }
}

Sys.Extended.UI.HTMLEditor.Popups.OkCancelAttachedTemplatePopup.registerClass("Sys.Extended.UI.HTMLEditor.Popups.OkCancelAttachedTemplatePopup", Sys.Extended.UI.HTMLEditor.Popups.AttachedTemplatePopup);
