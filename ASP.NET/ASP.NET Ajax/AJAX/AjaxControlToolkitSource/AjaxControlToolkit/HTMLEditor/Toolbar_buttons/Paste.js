Type.registerNamespace("AjaxControlToolkit.HTMLEditor.ToolbarButton");AjaxControlToolkit.HTMLEditor.ToolbarButton.Paste=function(a){AjaxControlToolkit.HTMLEditor.ToolbarButton.Paste.initializeBase(this,[a])};AjaxControlToolkit.HTMLEditor.ToolbarButton.Paste.prototype={canBeShown:function(){return AjaxControlToolkit.HTMLEditor.isIE},callMethod:function(){if(!AjaxControlToolkit.HTMLEditor.ToolbarButton.Paste.callBaseMethod(this,"callMethod"))return false;var a=this._designPanel;if(AjaxControlToolkit.HTMLEditor.isIE){a._saveContent();a.openWait();setTimeout(function(){a._paste(true);a.closeWait()},0)}else{var b=a._getSelection(),c=a._createRange(b);a._removeAllRanges(b);alert(String.format(AjaxControlToolkit.Resources.HTMLEditor_toolbar_button_Use_verb,AjaxControlToolkit.HTMLEditor.isSafari&&navigator.userAgent.indexOf("mac")!=-1?"Apple-V":"Ctrl-V"));a._selectRange(b,c);a.isWord=false;a.isPlainText=false}}};AjaxControlToolkit.HTMLEditor.ToolbarButton.Paste.registerClass("AjaxControlToolkit.HTMLEditor.ToolbarButton.Paste",AjaxControlToolkit.HTMLEditor.ToolbarButton.MethodButton);