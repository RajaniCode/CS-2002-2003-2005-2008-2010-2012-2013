// (c) 2010 CodePlex Foundation
(function(){var b="ExtendedPopup";function a(){var g="hidden",f="hiding",e="shown",d="showing",h="absolute",b=false,c=true,a=null;Type.registerNamespace("Sys.Extended.UI");Sys.Extended.UI.PopupBehavior=function(e){var d=this;Sys.Extended.UI.PopupBehavior.initializeBase(d,[e]);d._x=0;d._y=0;d._positioningMode=Sys.Extended.UI.PositioningMode.Absolute;d._parentElement=a;d._parentElementID=a;d._moveHandler=a;d._firstPopup=c;d._originalParent=a;d._visible=b;d._onShow=a;d._onHide=a;d._onShowEndedHandler=Function.createDelegate(d,d._onShowEnded);d._onHideEndedHandler=Function.createDelegate(d,d._onHideEnded)};Sys.Extended.UI.PopupBehavior.prototype={initialize:function(){Sys.Extended.UI.PopupBehavior.callBaseMethod(this,"initialize");this._hidePopup();this.get_element().style.position=h},dispose:function(){var b=this,c=b.get_element();if(c){b._visible&&b.hide();if(b._originalParent){c.parentNode.removeChild(c);b._originalParent.appendChild(c);b._originalParent=a}c._hideWindowedElementsIFrame=a}b._parentElement=a;b._onShow&&b._onShow.get_animation()&&b._onShow.get_animation().remove_ended(b._onShowEndedHandler);b._onShow=a;b._onHide&&b._onHide.get_animation()&&b._onHide.get_animation().remove_ended(b._onHideEndedHandler);b._onHide=a;Sys.Extended.UI.PopupBehavior.callBaseMethod(b,"dispose")},show:function(){var a=this;if(a._visible)return;var d=new Sys.CancelEventArgs;a.raiseShowing(d);if(d.get_cancel())return;a._visible=c;var e=a.get_element();$common.setVisible(e,c);a.setupPopup();if(a._onShow){$common.setVisible(e,b);a.onShow()}else a.raiseShown(Sys.EventArgs.Empty)},hide:function(){var a=this;if(!a._visible)return;var c=new Sys.CancelEventArgs;a.raiseHiding(c);if(c.get_cancel())return;a._visible=b;if(a._onHide)a.onHide();else{a._hidePopup();a._hideCleanup()}},getBounds:function(){var e=this,d=e.get_element(),k=d.offsetParent||document.documentElement,h,a;if(e.get_parentElement()){a=$common.getBounds(e.get_parentElement());var j=$common.getLocation(k);h={x:a.x-j.x,y:a.y-j.y}}else{a=$common.getBounds(k);h={x:0,y:0}}var f=d.offsetWidth-(d.clientLeft?d.clientLeft*2:0),g=d.offsetHeight-(d.clientTop?d.clientTop*2:0);if(e._firstpopup){d.style.width=f+"px";e._firstpopup=b}var i,c;switch(e._positioningMode){case Sys.Extended.UI.PositioningMode.Center:c={x:Math.round(a.width/2-f/2),y:Math.round(a.height/2-g/2),altX:Math.round(a.width/2-f/2),altY:Math.round(a.height/2-g/2)};break;case Sys.Extended.UI.PositioningMode.BottomLeft:c={x:0,y:a.height,altX:a.width-f,altY:0-g};break;case Sys.Extended.UI.PositioningMode.BottomRight:c={x:a.width-f,y:a.height,altX:0,altY:0-g};break;case Sys.Extended.UI.PositioningMode.TopLeft:c={x:0,y:-d.offsetHeight,altX:a.width-f,altY:a.height};break;case Sys.Extended.UI.PositioningMode.TopRight:c={x:a.width-f,y:-d.offsetHeight,altX:0,altY:a.height};break;case Sys.Extended.UI.PositioningMode.Right:c={x:a.width,y:0,altX:-d.offsetWidth,altY:a.height-g};break;case Sys.Extended.UI.PositioningMode.Left:c={x:-d.offsetWidth,y:0,altX:a.width,altY:a.height-g};break;default:c={x:0,y:0,altX:0,altY:0}}c.x+=e._x+h.x;c.altX+=e._x+h.x;c.y+=e._y+h.y;c.altY+=e._y+h.y;i=e._verifyPosition(c,f,g,a);return new Sys.UI.Bounds(i.x,i.y,f,g)},_verifyPosition:function(a,f,e){var c=0,d=0,b=this._getWindowBounds();if(!(a.x+f>b.x+b.width||a.x<b.x))c=a.x;else{c=a.altX;if(a.altX<b.x){if(a.x>a.altX)c=a.x}else if(b.width+b.x-a.altX<f){var g=a.x>a.altX?Math.abs(b.x-a.x):b.x-a.x;if(g<f-b.width-b.x+a.altX)c=a.x}}if(!(a.y+e>b.y+b.height||a.y<b.y))d=a.y;else{d=a.altY;if(a.altY<b.y){if(b.y-a.altY>e-b.height-b.y+a.y)d=a.y}else if(b.height+b.y-a.altY<e)if(b.y-a.y<e-b.height-b.y+a.altY)d=a.y}return{x:c,y:d}},_getWindowBounds:function(){var a=this;return{x:a._getWindowScrollLeft(),y:a._getWindowScrollTop(),width:a._getWindowWidth(),height:a._getWindowHeight()}},_getWindowHeight:function(){var a=0;if(document.documentElement&&document.documentElement.clientHeight)a=document.documentElement.clientHeight;else if(document.body&&document.body.clientHeight)a=document.body.clientHeight;return a},_getWindowWidth:function(){var a=0;if(document.documentElement&&document.documentElement.clientWidth)a=document.documentElement.clientWidth;else if(document.body&&document.body.clientWidth)a=document.body.clientWidth;return a},_getWindowScrollTop:function(){var a=0;if(typeof window.pageYOffset=="number")a=window.pageYOffset;if(document.body&&document.body.scrollTop)a=document.body.scrollTop;else if(document.documentElement&&document.documentElement.scrollTop)a=document.documentElement.scrollTop;return a},_getWindowScrollLeft:function(){var a=0;if(typeof window.pageXOffset=="number")a=window.pageXOffset;else if(document.body&&document.body.scrollLeft)a=document.body.scrollLeft;else if(document.documentElement&&document.documentElement.scrollLeft)a=document.documentElement.scrollLeft;return a},adjustPopupPosition:function(a){var f=this.get_element();if(!a)a=this.getBounds();var d=$common.getBounds(f),e=b;if(d.x<0){a.x-=d.x;e=c}if(d.y<0){a.y-=d.y;e=c}e&&$common.setLocation(f,a)},addBackgroundIFrame:function(){var c=this,b=c.get_element();if(Sys.Browser.agent===Sys.Browser.InternetExplorer&&Sys.Browser.version<7){var a=b._hideWindowedElementsIFrame;if(!a){a=document.createElement("iframe");a.src="javascript:'<html></html>';";a.style.position=h;a.style.display="none";a.scrolling="no";a.frameBorder="0";a.tabIndex="-1";a.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)";b.parentNode.insertBefore(a,b);b._hideWindowedElementsIFrame=a;c._moveHandler=Function.createDelegate(c,c._onMove);Sys.UI.DomEvent.addHandler(b,"move",c._moveHandler)}$common.setBounds(a,$common.getBounds(b));a.style.left=b.style.left;a.style.top=b.style.top;a.style.display=b.style.display;if(b.currentStyle&&b.currentStyle.zIndex)a.style.zIndex=b.currentStyle.zIndex;else if(b.style.zIndex)a.style.zIndex=b.style.zIndex}},setupPopup:function(){var a=this,b=a.get_element(),c=a.getBounds();$common.setLocation(b,c);a.adjustPopupPosition(c);b.style.zIndex=1e3;a.addBackgroundIFrame()},_hidePopup:function(){var c=this.get_element();$common.setVisible(c,b);if(c.originalWidth){c.style.width=c.originalWidth+"px";c.originalWidth=a}},_hideCleanup:function(){var b=this,d=b.get_element();if(b._moveHandler){Sys.UI.DomEvent.removeHandler(d,"move",b._moveHandler);b._moveHandler=a}if(Sys.Browser.agent===Sys.Browser.InternetExplorer){var c=d._hideWindowedElementsIFrame;if(c)c.style.display="none"}b.raiseHidden(Sys.EventArgs.Empty)},_onMove:function(){var a=this.get_element();if(a._hideWindowedElementsIFrame){a.parentNode.insertBefore(a._hideWindowedElementsIFrame,a);a._hideWindowedElementsIFrame.style.top=a.style.top;a._hideWindowedElementsIFrame.style.left=a.style.left}},get_onShow:function(){return this._onShow?this._onShow.get_json():a},set_onShow:function(c){var a=this;if(!a._onShow){a._onShow=new Sys.Extended.UI.Animation.GenericAnimationBehavior(a.get_element());a._onShow.initialize()}a._onShow.set_json(c);var b=a._onShow.get_animation();b&&b.add_ended(a._onShowEndedHandler);a.raisePropertyChanged("onShow")},get_onShowBehavior:function(){return this._onShow},onShow:function(){var a=this;if(a._onShow){a._onHide&&a._onHide.quit();a._onShow.play()}},_onShowEnded:function(){this.adjustPopupPosition();this.addBackgroundIFrame();this.raiseShown(Sys.EventArgs.Empty)},get_onHide:function(){return this._onHide?this._onHide.get_json():a},set_onHide:function(c){var a=this;if(!a._onHide){a._onHide=new Sys.Extended.UI.Animation.GenericAnimationBehavior(a.get_element());a._onHide.initialize()}a._onHide.set_json(c);var b=a._onHide.get_animation();b&&b.add_ended(a._onHideEndedHandler);a.raisePropertyChanged("onHide")},get_onHideBehavior:function(){return this._onHide},onHide:function(){var a=this;if(a._onHide){a._onShow&&a._onShow.quit();a._onHide.play()}},_onHideEnded:function(){this._hideCleanup()},get_parentElement:function(){var a=this;!a._parentElement&&a._parentElementID&&a.set_parentElement($get(a._parentElementID));return a._parentElement},set_parentElement:function(a){this._parentElement=a;this.raisePropertyChanged("parentElement")},get_parentElementID:function(){return this._parentElement?this._parentElement.id:this._parentElementID},set_parentElementID:function(a){this._parentElementID=a;this.get_isInitialized()&&this.set_parentElement($get(a))},get_positioningMode:function(){return this._positioningMode},set_positioningMode:function(a){this._positioningMode=a;this.raisePropertyChanged("positioningMode")},get_x:function(){return this._x},set_x:function(b){var a=this;if(b!=a._x){a._x=b;a._visible&&a.setupPopup();a.raisePropertyChanged("x")}},get_y:function(){return this._y},set_y:function(b){var a=this;if(b!=a._y){a._y=b;a._visible&&a.setupPopup();a.raisePropertyChanged("y")}},get_visible:function(){return this._visible},add_showing:function(a){this.get_events().addHandler(d,a)},remove_showing:function(a){this.get_events().removeHandler(d,a)},raiseShowing:function(b){var a=this.get_events().getHandler(d);a&&a(this,b)},add_shown:function(a){this.get_events().addHandler(e,a)},remove_shown:function(a){this.get_events().removeHandler(e,a)},raiseShown:function(b){var a=this.get_events().getHandler(e);a&&a(this,b)},add_hiding:function(a){this.get_events().addHandler(f,a)},remove_hiding:function(a){this.get_events().removeHandler(f,a)},raiseHiding:function(b){var a=this.get_events().getHandler(f);a&&a(this,b)},add_hidden:function(a){this.get_events().addHandler(g,a)},remove_hidden:function(a){this.get_events().removeHandler(g,a)},raiseHidden:function(b){var a=this.get_events().getHandler(g);a&&a(this,b)}};Sys.Extended.UI.PopupBehavior.registerClass("Sys.Extended.UI.PopupBehavior",Sys.Extended.UI.BehaviorBase);Sys.registerComponent(Sys.Extended.UI.PopupBehavior,{name:"popup"});Sys.Extended.UI.PositioningMode=function(){throw Error.invalidOperation();};Sys.Extended.UI.PositioningMode.prototype={Absolute:0,Center:1,BottomLeft:2,BottomRight:3,TopLeft:4,TopRight:5,Right:6,Left:7};Sys.Extended.UI.PositioningMode.registerEnum("Sys.Extended.UI.PositioningMode")}if(window.Sys&&Sys.loader)Sys.loader.registerScript(b,["ExtendedAnimations","ExtendedAnimationBehavior"],a);else a()})();