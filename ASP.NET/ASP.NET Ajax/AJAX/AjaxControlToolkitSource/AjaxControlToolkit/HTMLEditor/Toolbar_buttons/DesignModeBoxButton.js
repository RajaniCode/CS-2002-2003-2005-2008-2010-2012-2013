Type.registerNamespace("AjaxControlToolkit.HTMLEditor.ToolbarButton");AjaxControlToolkit.HTMLEditor.ToolbarButton.DesignModeBoxButton=function(a){AjaxControlToolkit.HTMLEditor.ToolbarButton.DesignModeBoxButton.initializeBase(this,[a]);this._designPanel=null};AjaxControlToolkit.HTMLEditor.ToolbarButton.DesignModeBoxButton.prototype={_onmousedown:function(c){var a=false,b=this;if(b._designPanel==null)return a;if(b._designPanel.isPopup())return a;if(AjaxControlToolkit.HTMLEditor.ToolbarButton.DesignModeBoxButton.callBaseMethod(b,"_onmousedown",[c])===null)return a;b.callMethod();return a},onEditPanelActivity:function(){this._designPanel=this._editPanel.get_activePanel()},callMethod:function(){if(this._designPanel==null)return false;if(this._designPanel.isPopup())return false;return true},initialize:function(){var b=this;AjaxControlToolkit.HTMLEditor.ToolbarButton.DesignModeBoxButton.callBaseMethod(b,"initialize");if(AjaxControlToolkit.HTMLEditor.isOpera){var a=b.get_element();function d(a){a.style.display="";for(var b=0;b<a.childNodes.length;b++){var c=a.childNodes.item(b);if(c.nodeType==1)d(c)}}function c(a,b){if(a.style.visibility!=b)a.style.visibility=b;for(var d=0;d<a.childNodes.length;d++){var e=a.childNodes.item(d);if(e.nodeType==1)c(e,b)}}if(b.canBeShown()){d(a);a.style.visibility="hidden"}b.hideButton=function(){c(a,"hidden")};b.showButton=function(){if(a.style.display=="none")a.style.display="";c(a,"visible")}}}};AjaxControlToolkit.HTMLEditor.ToolbarButton.DesignModeBoxButton.registerClass("AjaxControlToolkit.HTMLEditor.ToolbarButton.DesignModeBoxButton",AjaxControlToolkit.HTMLEditor.ToolbarButton.BoxButton);