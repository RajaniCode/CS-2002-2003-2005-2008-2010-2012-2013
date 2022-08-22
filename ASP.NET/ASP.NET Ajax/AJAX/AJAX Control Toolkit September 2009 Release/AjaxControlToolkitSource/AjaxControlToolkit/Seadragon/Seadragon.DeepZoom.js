Type.registerNamespace("AjaxControlToolkit.Seadragon");AjaxControlToolkit.Seadragon.DziError=function(a){AjaxControlToolkit.Seadragon.DziError.initializeBase(this,[a]);this.message=a};AjaxControlToolkit.Seadragon.DziError.registerClass("AjaxControlToolkit.Seadragon.DziError",Error);AjaxControlToolkit.Seadragon.DziTileSource=function(h,g,e,c,f,d,b){var a=this;AjaxControlToolkit.Seadragon.DziTileSource.initializeBase(a,[h,g,e,c,null,null]);a._levelRects={};a.tilesUrl=f;a.fileFormat=d;a.displayRects=b;a._init()};AjaxControlToolkit.Seadragon.DziTileSource.prototype={_init:function(){var a=this;if(!a.displayRects)return;for(var d=a.displayRects.length-1;d>=0;d--)for(var c=a.displayRects[d],b=c.minLevel;b<=c.maxLevel;b++){if(!a._levelRects[b])a._levelRects[b]=[];a._levelRects[b].push(c)}},getTileUrl:function(a,b,c){return [this.tilesUrl,a,"/",b,"_",c,".",this.fileFormat].join("")},tileExists:function(c,k,l){var a=this,d=a._levelRects[c];if(!d||!d.length)return true;for(var j=d.length-1;j>=0;j--){var b=d[j];if(c<b.minLevel||c>b.maxLevel)continue;var e=a.getLevelScale(c),f=b.x*e,g=b.y*e,h=f+b.width*e,i=g+b.height*e;f=Math.floor(f/a.tileSize);g=Math.floor(g/a.tileSize);h=Math.ceil(h/a.tileSize);i=Math.ceil(i/a.tileSize);if(f<=k&&k<h&&g<=l&&l<i)return true}return false}};AjaxControlToolkit.Seadragon.DziTileSource.registerClass("AjaxControlToolkit.Seadragon.DziTileSource",AjaxControlToolkit.Seadragon.TileSource);AjaxControlToolkit.Seadragon._DziTileSourceHelper=function(){};AjaxControlToolkit.Seadragon._DziTileSourceHelper.prototype={createFromXml:function(h,e,f){var b=null,a=this,i=typeof f=="function",d=b;if(!h){a.error=Seadragon.Strings.getString("Errors.Empty");if(i){window.setTimeout(function(){f(b,d)},1);return b}throw new AjaxControlToolkit.Seadragon.DziError(d);}var c=h.split("/"),j=c[c.length-1],l=j.lastIndexOf(".");if(l>-1)c[c.length-1]=j.slice(0,l);var m=c.join("/")+"_files/";function g(a,c){try{return a(c,m)}catch(e){if(i){d=this.getError(e).message;return b}else throw this.getError(e);}}if(i){if(e){var k=Function.createDelegate(a,a.processResponse);window.setTimeout(function(){var a=g(k,Seadragon.Utils.parseXml(e));f(a,d)},1)}else{var k=Function.createDelegate(a,a.processResponse);Seadragon.Utils.makeAjaxRequest(h,function(b){var a=g(k,b);f(a,d)})}return b}if(e)return g(Function.createDelegate(a,a.processXml),Seadragon.Utils.parseXml(e));else return g(Function.createDelegate(a,a.processResponse),Seadragon.Utils.makeAjaxRequest(h))},processResponse:function(a,e){if(!a)throw new AjaxControlToolkit.Seadragon.DziError(Seadragon.Strings.getString("Errors.Security"));else if(a.status!==200&&a.status!==0){var c=a.status,d=c==404?"Not Found":a.statusText;throw new AjaxControlToolkit.Seadragon.DziError(Seadragon.Strings.getString("Errors.Status",c,d));}var b=null;if(a.responseXML&&a.responseXML.documentElement)b=a.responseXML;else if(a.responseText)b=Seadragon.Utils.parseXml(a.responseText);return this.processXml(b,e)},processXml:function(c,e){var a="Errors.Dzi";if(!c||!c.documentElement)throw new AjaxControlToolkit.Seadragon.DziError(Seadragon.Strings.getString("Errors.Xml"));var d=c.documentElement,b=d.tagName;if(b=="Image")try{return this.processDzi(d,e)}catch(g){var f=Seadragon.Strings.getString(a);throw g instanceof AjaxControlToolkit.Seadragon.DziError?g:new AjaxControlToolkit.Seadragon.DziError(f);}else if(b=="Collection")throw new AjaxControlToolkit.Seadragon.DziError(Seadragon.Strings.getString("Errors.Dzc"));else if(b=="Error")return this.processError(d);throw new AjaxControlToolkit.Seadragon.DziError(Seadragon.Strings.getString(a));},processDzi:function(a,k){var c=a.getAttribute("Format");if(!Seadragon.Utils.imageFormatSupported(c))throw new AjaxControlToolkit.Seadragon.DziError(Seadragon.Strings.getString("Errors.ImageFormat",c.toUpperCase()));for(var h=a.getElementsByTagName("Size")[0],e=a.getElementsByTagName("DisplayRect"),m=parseInt(h.getAttribute("Width"),10),l=parseInt(h.getAttribute("Height"),10),j=parseInt(a.getAttribute("TileSize")),i=parseInt(a.getAttribute("Overlap")),g=[],d=0;d<e.length;d++){var f=e[d],b=f.getElementsByTagName("Rect")[0];g.push(new Seadragon.DisplayRect(parseInt(b.getAttribute("X"),10),parseInt(b.getAttribute("Y"),10),parseInt(b.getAttribute("Width"),10),parseInt(b.getAttribute("Height"),10),0,parseInt(f.getAttribute("MaxLevel"),10)))}return new AjaxControlToolkit.Seadragon.DziTileSource(m,l,j,i,k,c,g)},processError:function(b){var a=b.getElementsByTagName("Message")[0],c=a.firstChild.nodeValue;throw new AjaxControlToolkit.Seadragon.DziError(c);},getError:function(a){if(!(a instanceof DziError)){Seadragon.Debug.error(a.name+" while creating DZI from XML: "+a.message);a=new AjaxControlToolkit.Seadragon.DziError(Seadragon.Strings.getString("Errors.Unknown"))}}};AjaxControlToolkit.Seadragon.DziTileSourceHelper=new AjaxControlToolkit.Seadragon._DziTileSourceHelper;