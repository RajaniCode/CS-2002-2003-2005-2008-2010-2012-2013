// (c) 2010 CodePlex Foundation
Type.registerNamespace("Sys.Extended.UI");Sys.Extended.UI.ValidatorCalloutBehavior=function(c){var b=null,a=this;Sys.Extended.UI.ValidatorCalloutBehavior.initializeBase(a,[c]);a._warningIconImageUrl=b;a._closeImageUrl=b;a._cssClass="ajax__validatorcallout";a._highlightCssClass=b;a._popupPosition=Sys.Extended.UI.ValidatorCalloutPosition.Right;a._width="200px";a._invalid=false;a._originalValidationMethod=b;a._validationMethodOverride=b;a._elementToValidate=b;a._popupTable=b;a._errorMessageCell=b;a._calloutArrowCell=b;a._warningIconImage=b;a._closeImage=b;a._closeCellInnerDiv=b;a._popupBehavior=b;a._onShowJson=b;a._onHideJson=b;a._focusAttached=false;a._isBuilt=false;a._focusHandler=Function.createDelegate(a,a._onfocus);a._closeClickHandler=Function.createDelegate(a,a._oncloseClick)};Sys.Extended.UI.ValidatorCalloutBehavior.prototype={initialize:function(){var a=this;Sys.Extended.UI.ValidatorCalloutBehavior.callBaseMethod(a,"initialize");var b=a.get_element();if(b.evaluationfunction){a._originalValidationMethod=Function.createDelegate(b,b.evaluationfunction);a._validationMethodOverride=Function.createDelegate(a,a._onvalidate);b.evaluationfunction=a._validationMethodOverride}var c=a.get_ClientState();if(null!=c&&""!==c){a._ensureCallout();a._highlightCssClass&&Sys.UI.DomElement.addCssClass(a._elementToValidate,a._highlightCssClass);a.show()}},_ensureCallout:function(){var x="arrowpixel",w="ajax__validatorcallout_innerdiv",g="div",n="td",r="tr",a=this;if(!a._isBuilt){var z=a.get_element(),A=a._elementToValidate=$get(z.controltovalidate),q=document.createElement("tbody"),b=document.createElement(r),o=document.createElement(n),k=document.createElement("table"),v=document.createElement("tbody"),u=document.createElement(r),i=document.createElement(n),h=document.createElement(n),s=a._closeCellInnerDiv=document.createElement(g),e=a._popupTable=document.createElement("table"),c=a._calloutArrowCell=document.createElement(n),t=a._warningIconImage=document.createElement("img"),y=a._closeImage=document.createElement("img"),f=a._errorMessageCell=document.createElement(n);e.id=a.get_id()+"_popupTable";e.cellPadding=0;e.cellSpacing=0;e.border=0;e.width=a.get_width();e.className=a._cssClass+" ajax__validatorcallout_popup_table";b.className="ajax__validatorcallout_popup_table_row";o.className="ajax__validatorcallout_callout_cell";k.cellPadding=0;k.cellSpacing=0;k.border=0;k.className="ajax__validatorcallout_callout_table";u.className="ajax__validatorcallout_callout_table_row";if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.BottomLeft)c.className="ajax__validatorcallout_callout_arrow_cell_bottomleftpos";else if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.BottomRight)c.className="ajax__validatorcallout_callout_arrow_cell_bottomrightpos";else if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.TopLeft)c.className="ajax__validatorcallout_callout_arrow_cell_topleftpos";else if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.TopRight)c.className="ajax__validatorcallout_callout_arrow_cell_toprightpos";else if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.Left)c.className="ajax__validatorcallout_callout_arrow_cell_leftpos";else c.className="ajax__validatorcallout_callout_arrow_cell";i.className="ajax__validatorcallout_icon_cell";t.border=0;t.src=a.get_warningIconImageUrl();f.className="ajax__validatorcallout_error_message_cell";f.innerHTML=a._getErrorMessage();h.className="ajax__validatorcallout_close_button_cell";s.className=w;y.src=a.get_closeImageUrl();z.parentNode.appendChild(e);e.appendChild(q);q.appendChild(b);b.appendChild(o);o.appendChild(k);k.appendChild(v);v.appendChild(u);u.appendChild(c);b.appendChild(i);i.appendChild(t);b.appendChild(f);b.appendChild(h);s.appendChild(y);h.appendChild(s);if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.BottomLeft||a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.BottomRight){var p=document.createElement(r);q.insertBefore(p,b);c.colSpan=2;p.appendChild(c);b.appendChild(i);b.appendChild(f);b.appendChild(h)}else if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.TopLeft||a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.TopRight){var p=document.createElement(r);q.appendChild(p);c.colSpan=2;p.appendChild(c);b.appendChild(i);b.appendChild(f);b.appendChild(h)}else if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.Left){b.appendChild(i);b.appendChild(f);b.appendChild(h);b.appendChild(o)}else{b.appendChild(o);b.appendChild(i);b.appendChild(f);b.appendChild(h)}var j=document.createElement(g);j.className=w;c.appendChild(j);if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.BottomLeft||a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.BottomRight){var l=document.createElement(g);l.style.width="1px";l.className=x;j.appendChild(l);for(var d=1;d<22;d+=2){var m=document.createElement(g);m.style.width=d.toString()+"px";j.appendChild(m)}}else if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.TopLeft||a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.TopRight){for(var d=23;d>0;d-=2){var m=document.createElement(g);m.style.width=d.toString()+"px";j.appendChild(m)}var l=document.createElement(g);l.style.width="1px";l.className=x;j.appendChild(l)}else for(var d=14;d>0;d--){var m=document.createElement(g);m.style.width=d.toString()+"px";j.appendChild(m)}a._popupBehavior=$create(Sys.Extended.UI.PopupBehavior,{parentElement:A},{},null,a._popupTable);if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.TopLeft)a._popupBehavior.set_positioningMode(Sys.Extended.UI.PositioningMode.TopLeft);else if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.TopRight)a._popupBehavior.set_positioningMode(Sys.Extended.UI.PositioningMode.TopRight);else if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.BottomLeft)a._popupBehavior.set_positioningMode(Sys.Extended.UI.PositioningMode.BottomLeft);else if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.BottomRight)a._popupBehavior.set_positioningMode(Sys.Extended.UI.PositioningMode.BottomRight);else if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.Right)a._popupBehavior.set_positioningMode(Sys.Extended.UI.PositioningMode.Right);else if(a._popupPosition==Sys.Extended.UI.ValidatorCalloutPosition.Left)a._popupBehavior.set_positioningMode(Sys.Extended.UI.PositioningMode.Left);else a._popupBehavior.set_positioningMode(Sys.Extended.UI.PositioningMode.Right);a._onShowJson&&a._popupBehavior.set_onShow(a._onShowJson);a._onHideJson&&a._popupBehavior.set_onHide(a._onHideJson);$addHandler(a._closeCellInnerDiv,"click",a._closeClickHandler);a._isBuilt=true}},dispose:function(){var b=null,a=this;if(a._isBuilt){a.hide();if(a._focusAttached){$removeHandler(a._elementToValidate,"focus",a._focusHandler);a._focusAttached=false}$removeHandler(a._closeCellInnerDiv,"click",a._closeClickHandler);a._onShowJson=b;a._onHideJson=b;if(a._popupBehavior){a._popupBehavior.dispose();a._popupBehavior=b}if(a._closeBehavior){a._closeBehavior.dispose();a._closeBehavior=b}if(a._popupTable){a._popupTable.parentNode.removeChild(a._popupTable);a._popupTable=b;a._errorMessageCell=b;a._elementToValidate=b;a._calloutArrowCell=b;a._warningIconImage=b;a._closeImage=b;a._closeCellInnerDiv=b}a._isBuilt=false}Sys.Extended.UI.ValidatorCalloutBehavior.callBaseMethod(a,"dispose")},_getErrorMessage:function(){return this.get_element().errormessage||Sys.Extended.UI.Resources.ValidatorCallout_DefaultErrorMessage},show:function(b){var a=this;if(b||!a.get_isOpen()){b&&Sys.Extended.UI.ValidatorCalloutBehavior._currentCallout&&Sys.Extended.UI.ValidatorCalloutBehavior._currentCallout.hide();if(Sys.Extended.UI.ValidatorCalloutBehavior._currentCallout!=null)return;Sys.Extended.UI.ValidatorCalloutBehavior._currentCallout=a;a._errorMessageCell.innerHTML=a._getErrorMessage();a._popupBehavior.show()}},hide:function(){if(Sys.Extended.UI.ValidatorCalloutBehavior._currentCallout==this)Sys.Extended.UI.ValidatorCalloutBehavior._currentCallout=null;this.get_isOpen()&&this._popupBehavior.hide()},_onfocus:function(){var a=this;if(!a._originalValidationMethod(a.get_element())){a._ensureCallout();a._highlightCssClass&&Sys.UI.DomElement.addCssClass(a._elementToValidate,a._highlightCssClass);a.show(true);return false}else{a.hide();return true}},_oncloseClick:function(){this.hide()},_onvalidate:function(b){var a=this;if(!a._originalValidationMethod(b)){a._ensureCallout();a._highlightCssClass&&Sys.UI.DomElement.addCssClass(a._elementToValidate,a._highlightCssClass);if(!a._focusAttached){$addHandler(a._elementToValidate,"focus",a._focusHandler);a._focusAttached=true}a.show(false);a._invalid=true;return false}else{a._highlightCssClass&&a._invalid&&Sys.UI.DomElement.removeCssClass(a._elementToValidate,a._highlightCssClass);a._invalid=false;a.hide();return true}},get_onShow:function(){return this._popupBehavior?this._popupBehavior.get_onShow():this._onShowJson},set_onShow:function(b){var a=this;if(a._popupBehavior)a._popupBehavior.set_onShow(b);else a._onShowJson=b;a.raisePropertyChanged("onShow")},get_onShowBehavior:function(){return this._popupBehavior?this._popupBehavior.get_onShowBehavior():null},onShow:function(){this._popupBehavior&&this._popupBehavior.onShow()},get_onHide:function(){return this._popupBehavior?this._popupBehavior.get_onHide():this._onHideJson},set_onHide:function(b){var a=this;if(a._popupBehavior)a._popupBehavior.set_onHide(b);else a._onHideJson=b;a.raisePropertyChanged("onHide")},get_onHideBehavior:function(){return this._popupBehavior?this._popupBehavior.get_onHideBehavior():null},onHide:function(){this._popupBehavior&&this._popupBehavior.onHide()},get_warningIconImageUrl:function(){return this._warningIconImageUrl},set_warningIconImageUrl:function(b){var a=this;if(a._warningIconImageUrl!=b){a._warningIconImageUrl=b;if(a.get_isInitialized())a._warningIconImage.src=b;a.raisePropertyChanged("warningIconImageUrl")}},get_closeImageUrl:function(){return this._closeImageUrl},set_closeImageUrl:function(b){var a=this;if(a._closeImageUrl!=b){a._closeImageUrl=b;if(a.get_isInitialized())a._closeImage.src=b;a.raisePropertyChanged("closeImageUrl")}},get_width:function(){return this._width},set_width:function(b){var a=this;if(a._width!=b){a._width=b;if(a.get_isInitialized())a._popupTable.style.width=_width;a.raisePropertyChanged("width")}},get_popupPosition:function(){return this._popupPosition},set_popupPosition:function(a){if(this._popupPosition!=a){this._popupPosition=a;this.raisePropertyChanged("popupPosition")}},get_cssClass:function(){return this._cssClass},set_cssClass:function(a){if(this._cssClass!=a){this._cssClass=a;this.raisePropertyChanged("cssClass")}},get_highlightCssClass:function(){return this._highlightCssClass},set_highlightCssClass:function(a){if(this._highlightCssClass!=a){this._highlightCssClass=a;this.raisePropertyChanged("highlightCssClass")}},get_isOpen:function(){return $common.getVisible(this._popupTable)}};Sys.Extended.UI.ValidatorCalloutBehavior.registerClass("Sys.Extended.UI.ValidatorCalloutBehavior",Sys.Extended.UI.BehaviorBase);Sys.Extended.UI.ValidatorCalloutPosition=function(){throw Error.invalidOperation();};Sys.Extended.UI.ValidatorCalloutPosition.prototype={Right:0,Left:1,BottomLeft:2,BottomRight:3,TopLeft:4,TopRight:5};Sys.Extended.UI.ValidatorCalloutPosition.registerEnum("Sys.Extended.UI.ValidatorCalloutPosition");