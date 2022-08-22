//-----------------------------------------------------------------------
// Copyright (C) Microsoft Corporation. All rights reserved.
//-----------------------------------------------------------------------
// AtlasUIMap.js
// Atlas Mapping UI Framework.

function ap(b){return b?b:window.event;}function aC(b){b.cancelBubble=true;}function G(b){b=ap(b);aC(b);return false;}function bh(b){var gj=0;if(b.pageX){gj=b.pageX;}else if(b.clientX){if(document.documentElement&&document.documentElement.scrollLeft){gj=b.clientX+document.documentElement.scrollLeft;}else if(document.body){gj=b.clientX+document.body.scrollLeft;}}return gj;}function ca(b){var gk=0;if(b.pageY){gk=b.pageY;}else if(b.clientY){if(document.documentElement&&document.documentElement.scrollTop){gk=b.clientY+document.documentElement.scrollTop;}else if(document.body){gk=b.clientY+document.body.scrollTop;}}return gk;}function kp(b){if(b.wheelDelta){return b.wheelDelta;}else if(b.detail){return-b.detail;}return 0;}function rD(b){if(!b){b=window.event;}var T=null;if(b.srcElement){T=b.srcElement;}else if(b.target){T=b.target;}if(T&&T.nodeType){if(T.nodeType==3){T=rk.parentNode;}}return T;}function hZ(cU){var cn=cU;var jg=0;while(cn){jg+=cn.offsetLeft;cn=cn.offsetParent;}if(navigator.userAgent.indexOf("Mac")!=-1&&typeof(document.body.leftMargin)!="undefined"){jg+=document.body.leftMargin;}return jg;}function gh(cU){var cn=cU;var iZ=0;while(cn){iZ+=cn.offsetTop;cn=cn.offsetParent;}if(navigator.userAgent.indexOf("Mac")!=-1&&typeof(document.body.topMargin)!="undefined"){iZ+=document.body.topMargin;}return iZ;}function ak(d){return Math.floor(d);}function cx(d){return Math.ceil(d);}function dJ(d,f){return Math.max(d,f);}function dX(d,f){return Math.min(d,f);}function aZ(d){return Math.abs(d);}function aj(d){return Math.round(d);}function cw(az){return az*Math.PI/180.0;}function gL(oG){return oG*180.0/Math.PI;}function lS(ah,X){if(!ah||!X||ah[0].length!=X.length){return;}var p=ah.length;var q=X[0].length;var aU=new Array(p);var bc=X.length;for(var a=0;a<p;a++){aU[a]=new Array(q);for(var Y=0;Y<q;Y++){aU[a][Y]=0;for(var gu=0;gu<bc;gu++){aU[a][Y]+=ah[a][gu]*X[gu][Y];}}}return aU;}function RegisterNamespaces(){for(var a=0;a<arguments.length;a++){var gv=arguments[a].split(".");var gX=window;for(var Y=0;Y<gv.length;Y++){if(!gX[gv[Y]]){gX[gv[Y]]=new Object();}gX=gX[gv[Y]];}}}RegisterNamespaces("Msn.VE");
Msn.VE.MapControl=function(y,V){var eJ=20971520;var js=163840;var bH=0;var dV=true;var cg=6;var mo=15;var mf=15;var bm=6378137;var fX=bm*2.0*Math.PI;var fC=fX*0.5;var fG=1;var fh=19;var ri="http://virtualearth.msn.com/i/spacer.gif";var jR=-85;var jW=85;var km=-180;var lO=180;var M=256;var ej=new Object();var oE=0;var om=0;var mj=1;var lP=1;var fZ=2;var nv=3;var fZ=11;var pX=20;var h=this;var cY='r';var eq='h';var eT='a';var aS='o';var c=new Msn.VE.MapView();var au=new Msn.VE.MapView();var kP=1;var pw=null;var hY=15;var iM=cY;var d=0,f=0,q=0,p=0;var K=new Array();var cD=null;var I=0,H=0;var af=0,ag=0;var bV=0,bL=0;var ci=0,ck=0;var aB=0,cb=0;var cR=false;var iH=false;var iF=0,iC=0;var bi=false;var cG=0;var aQ=false;var gB=0;var fA=0,fB=0;var eI=null,fH=null;var an=new Array();var bk=new Array();var j=document.createElement("div");var bY=document.createElement("input");bY.id="wl_ve_mapInput";var di=null;var bN=null;var cs=null;var R=null;var eC=null;var cE=null;var dE=null;var df=null;var dp=null;var z=null;var x=null;var hu=null;var dk=new Array();var ga=false;this.Init=function(){ej[cY]=15;ej[eT]=15;ej[eq]=15;ej[aS]=14;dp=new py();dp.Init();if(V.obliqueEnabled&&V.obliqueUrl){z=new qP();z.Init(V.obliqueUrl);}jj();j.className="Map";j.style.zIndex=mj;y.appendChild(j);bY.className="KeyboardInput";y.appendChild(bY);if(!V.fixedView){cE=new nu();cE.Init();dE=new oT();dE.Init();df=dE;y.attachEvent("onmousedown",dc);y.attachEvent("onmouseup",bt);y.attachEvent("onmousemove",cz);y.attachEvent("onmousewheel",er);y.attachEvent("ondblclick",mM);y.attachEvent("oncontextmenu",lH);bY.attachEvent("onkeydown",mL);bY.attachEvent("onkeyup",jl);if(window.addEventListener&&navigator.product&&navigator.product=="Gecko"){y.addEventListener("DOMMouseScroll",er,false);}bH=M;}if(V.buffer!=undefined&&V.buffer!=null){bH=V.buffer;}if(V.latitude&&V.longitude&&V.zoomlevel&&V.mapstyle){try{var gA=new Msn.VE.MapView();gA.SetMapStyle(lK(V.mapstyle),V.obliqueSceneId);gA.SetZoomLevel(eval(V.zoomlevel));gA.SetCenterLatLong(new Msn.VE.LatLong(eval(V.latitude),eval(V.longitude)));av(gA);}catch(dw){kX();}}else{kX();}if(!V.disableLogo){di=new oa(y);di.Init();}cs=new nI(y);cs.Init();if(V.showScaleBar){bN=new ov(y);bN.Init();eu("onendzoom",bN.Update);eu("onendcontinuouspan",bN.Update);eu("onresize",bN.Reposition);}if(V.showDashboard){pa(V.dashboardX,V.dashboardY,V.dashboardSize);}if(z&&x!=z){z.UpdateAvailability();}};this.GetDashboard=function(){return eC;};this.Destroy=function(){if(!V.fixedView){y.detachEvent("onmousedown",dc);y.detachEvent("onmouseup",bt);y.detachEvent("onmousemove",cz);y.detachEvent("onmousewheel",er);y.detachEvent("ondblclick",mM);y.detachEvent("oncontextmenu",lH);bY.detachEvent("onkeydown",mL);bY.detachEvent("onkeyup",jl);}while(K.length>0){var ad=K.pop();ad.RemoveFromMap();}K=null;while(an.length){an.pop().Destroy();}an=null;ju();if(eC){eC.Destroy();eC=null;}if(R){R.detachEvent("onmousedown",G);R.detachEvent("onmouseup",G);R.detachEvent("onmousemove",G);R.detachEvent("onmousewheel",G);R.detachEvent("ondblclick",G);R.detachEvent("oncontextmenu",G);R.detachEvent("onkeydown",G);R.detachEvent("onkeyup",G);y.removeChild(R);R=null;}if(bN){ee("onendzoom",bN.Update);ee("onendcontinuouspan",bN.Update);ee("onresize",bN.Reposition);bN.Destroy();bN=null;}if(di){di.Destroy();di=null;}if(cs){cs.Destroy();cs=null;}if(dp){dp.Destroy();dp=null;}if(z){z.Destroy();z=null;}if(cE){cE.Destroy();cE=null;}if(dE){dE.Destroy();dE=null;}mR();y=h=null;};function jj(){d=hZ(y);f=gh(y);q=y.offsetWidth;p=y.offsetHeight;}function pa(d,f,aT){if(!aT){aT=Msn.VE.DashboardSize.Normal;}if(aT==Msn.VE.DashboardSize.Tiny){aT=Msn.VE.DashboardSize.Small;}R=document.createElement("div");y.appendChild(R);R.className="Dashboard Dashboard_"+aT;R.style.top=f+"px";R.style.left=d+"px";R.attachEvent("onmousedown",G);R.attachEvent("onmouseup",G);R.attachEvent("onmousemove",G);R.attachEvent("onmousewheel",G);R.attachEvent("ondblclick",G);R.attachEvent("oncontextmenu",G);R.attachEvent("onkeydown",G);R.attachEvent("onkeyup",G);eC=new Msn.VE.Dashboard(R,h,aT);eC.Init();}function kX(){var e=new Msn.VE.MapView();e.SetCenterLatLong(new Msn.VE.LatLong(0.0,0.0));e.SetZoomLevel(1);e.SetMapStyle(cY);av(e);}function hn(A,L){var e=au.MakeCopy();e.SetCenterLatLong(new Msn.VE.LatLong(A,L));av(e);}function cc(Z,bS,il){var e=c.MakeCopy();e.SetMapStyle(lK(Z),bS,il);if(c.mapStyle!=Z){if(Z==aS){e.SetZoomLevel(1);hY=c.zoomLevel;iM=c.mapStyle;}else if(c.mapStyle==aS){e.SetZoomLevel(hY);}}av(e);}function lK(Z){if(Z==eT||Z==eq||Z==aS){return Z;}else{return cY;}}function qL(){return c.latlong.latitude;}function oS(){return c.latlong.longitude;}function lV(pm){c.latlong=x.PixelToLatLong(c.center,c.zoomLevel);if(pm){au.Copy(c);}if(z){z.UpdateAvailability();}}function ix(f){var l=new Msn.VE.Pixel(I+af+q/2,H+ag+f);var o=x.PixelToLatLong(l,c.zoomLevel);if(!o){return null;}return o.latitude;}function hF(d){var l=new Msn.VE.Pixel(I+af+d,H+ag+p/2);var o=x.PixelToLatLong(l,c.zoomLevel);if(!o){return null;}return o.longitude;}function hJ(A){var o=new Msn.VE.LatLong(A,c.center.longitude);var l=x.LatLongToPixel(o,c.zoomLevel);if(!l){return null;}return aj(l.y-H-ag);}function hK(L){var o=new Msn.VE.LatLong(c.center.latitude,L);var l=x.LatLongToPixel(o,c.zoomLevel);if(!l){return null;}return aj(l.x-I-af);}function cQ(o){var l=x.LatLongToPixel(o,c.zoomLevel);l.x-=I+af;l.y-=H+ag;return l;}function du(l){var pj=new Msn.VE.Pixel(l.x+I+af,l.y+H+ag);var o=x.PixelToLatLong(pj,c.zoomLevel);return o;}function qB(){return c.zoomLevel;}function oK(){return c.mapStyle;}function mJ(A,m){if(!A){A=c.latlong.latitude;}if(!m){m=c.zoomLevel;}return Math.cos(cw(A))*x.MetersPerPixel(m);}function qF(aK,aM){if(!aK||!aM||aK<=0||aM<=0){return;}q=aK;p=aM;y.style.width=q;y.style.height=p;pz(c);cs.Reposition();if(di){di.Reposition();}aq("onresize");}function ps(){return z?z.IsAvailable():false;}function qJ(){return z?z.GetScene():null;}function re(ef){dV=ef;}function nw(){return dV;}function pJ(F){if(z){cc(aS,F,null);}}function ng(ea){if(z){cc(aS,null,ea);}}function ht(az){ga=az;for(var a=0;a<K.length;a++){K[a].Debug(az);}}function nT(e,t){lT(e,t,0,0);}function lT(e,t,bB,by){bB=ll(bB,q,e.center.x-q/2,e.zoomLevel,t.z1,t.x1,t.x2);by=ll(by,p,e.center.y-p/2,e.zoomLevel,t.z1,t.y1,t.y2);e.SetCenter(new Msn.VE.Pixel(e.center.x+bB,e.center.y+by));}function ll(cq,aT,fK,m,mp,nR,pI){var ds=M*nR*Math.pow(2,m-mp);var aE=M*pI*Math.pow(2,m-mp);if(aT>(aE-ds)){return((aE-ds-aT)/2)-fK+ds;}else if(fK+cq<ds){return ds-fK;}else if(fK+aT+cq>aE){return aE-fK-aT;}return cq;}function nI(J){var ax=document.createElement("div");var ai=document.createElement("div");var eM=13;this.Init=function(){ax.className="Copyright CopyrightBackground";ai.className="Copyright CopyrightForeground";bz();J.appendChild(ax);J.appendChild(ai);};this.Destroy=function(){J.removeChild(ax);J.removeChild(ai);ax=ai=null;};function bz(){ax.style.top=(p-eM)+"px";ax.style.left=(q-234)+"px";ax.style.display="block";ai.style.top=(p-eM-1)+"px";ai.style.left=(q-235)+"px";ai.style.display="block";}function cu(){var k="&copy; 2005 Microsoft Corp";eM=13;if(c.zoomLevel>=5&&(c.mapStyle==cY||c.mapStyle==eq)){k+=" &nbsp; &copy; 2004 NAVTEQ";}if(c.mapStyle==eq||c.mapStyle==eT){k+="<br>";eM=21;if(c.zoomLevel<=8){k+="Image courtesy of NASA";}else if(c.zoomLevel<=13){k+="&copy; Harris Corp, Earthstar Geographics LLC";}else{k+="Image courtesy of USGS";}}else if(c.mapStyle==aS){k+="<br>&copy; 2005 Pictometry International Corp.";eM=21;}ax.innerHTML=k;ai.innerHTML=k;bz();}this.Reposition=bz;this.Update=cu;}function ni(e,gt,fi){this.view=e;this.oblique=gt;this.error=fi;}function fL(o,m,fi){var e=c.MakeCopy();if(o!=undefined){e.latlong=o;}if(m!=undefined){e.zoomLevel=m;}if(fi==undefined){fi="";}var gt=null;if(z){gt=z.GetEventInfo();}return new ni(e,gt,fi);}function eu(aR,cX){var am=dk[aR];if(!am){am=new Array();dk[aR]=am;}for(var a=0;a<am.length;a++){if(am[a]==cX){return true;}}am.push(cX);}function ee(aR,cX){var am=dk[aR];if(!am){return;}for(var a=0;a<am.length;a++){if(am[a]==cX){am.splice(a,1);}}}function aq(aR,hH){var am=dk[aR];if(!am){return;}if(!hH){hH=fL();}for(var a=0;a<am.length;a++){am[a](hH);}}function mR(){while(dk.length){var am=dk.pop();while(am.length){am.pop();}am=null;}dk=null;}function mL(b){b=ap(b);var s=mo;var d=fA;var f=fB;switch(b.keyCode){case 9:if(aQ&&iH){fa();}return true;case 37:d=-s;break;case 38:f=-s;break;case 39:d=s;break;case 40:f=s;break;case 107:case 187:case 61:case 43:d=0;f=0;gn();break;case 109:case 189:d=0;f=0;gK();break;case 65:d=0;f=0;cc(eT);break;case 72:d=0;f=0;cc(eq);break;case 82:case 86:d=0;f=0;cc(cY);break;case 66:case 79:d=0;f=0;cc(aS);break;default:return false;}if(d||f){hj(d,f,null,true);}return false;}function jl(b){b=ap(b);var d=fA;var f=fB;switch(b.keyCode){case 37:d=0;break;case 38:f=0;break;case 39:d=0;break;case 40:f=0;break;default:return false;}hj(d,f,null,true);return false;}var ez=0;var eG=0;var ey=0;var en=0;function pR(F,gl,gH,fl,dH,aY,cM,eb){if(F==null||gl==null||gH==null||cM==null||eb==null){return null;}var mB=new Array();for(var a=0;a<cM.length;a++){mB.push(ih(cM[a],0,cM[a].length-1));}var eD=new nY();eD.Init(F,gl,gH,fl,dH,aY,mB,eb);bk.push(eD);return eD;}function pe(F){for(var a=0;a<bk.length;a++){var eD=bk[a];if(eD.id==F){bk.splice(a,1);eD.Destroy();return;}}}function ju(){while(bk.length>0)bk.pop().Destroy();}function mP(){for(var a=0;a<bk.length;a++){bk[a].StartLine();bk[a].Show();}}function kZ(){for(var a=0;a<bk.length;a++){bk[a].Hide();}}function mV(){for(var a=0;a<bk.length;a++){bk[a].UpdateLine();}}function ih(fJ,dQ,fq){var iX=fq-dQ+1;if(iX<1){return null;}else if(iX==1){return fJ[dQ];}var dC=null;var dl=null;if(iX==2){dC=fJ[dQ];dl=fJ[fq];}else{var a=Math.round((dQ+fq)/2);dC=ih(fJ,dQ,a);dl=ih(fJ,a+1,fq);}if(dC!=null&&dl!=null){var bu=dC.boundingRectangle;var bs=dl.boundingRectangle;var ez=bu[0].latitude>bs[0].latitude?bu[0].latitude:bs[0].latitude;var en=bu[0].longitude>bs[0].longitude?bu[0].longitude:bs[0].longitude;var eG=bu[1].latitude<bs[1].latitude?bu[1].latitude:bs[1].latitude;var ey=bu[1].longitude<bs[1].longitude?bu[1].longitude:bs[1].longitude;var ns=[new Msn.VE.LatLong(ez,en),new Msn.VE.LatLong(eG,ey)];return new Msn.VE.LineRegion(ns,null,[dC,dl]);}else if(dC!=null){return dC;}else if(dl!=null){return dl;}return null;}function nY(){var nH=6;var qj="#11DD11";var rs=4;var i=null;var ls="";var dd=true;var my="";var kb="";var aY=0;var qf=0;var qp=0;var qD=0;var os=0;var dv=null;var dB=null;var cM=null;var eb=null;var dQ=0;var fq=0;var dx=null;function ot(F,gl,gH,fl,dH,hM,nG,oM){if(!fl){fl=nH;}if(!dH){dH=qj;}if(!hM){hM=rr;}this.id=F;ls=F;my=fl+"pt";kb=dH;aY=hM;dv=gl;dB=gH;eb=oM;cM=nG;qf=dv[0];qp=dB[0];qD=dv[dv.length-1];os=dB[dB.length-1];dx=c.MakeCopy();ka();};function bZ(){cI();dv=dB=cM=i=dx=null;};function cI(){if(i&&i.parentNode==j){j.removeChild(i);}}function aN(){if(!dd){as();return;}if(i){i.style.display="block";}};function as(){if(i){i.style.display="none";}};function qA(ol){dd=ol;if(!dd){as();}}function ka(){kG();lz();dx.Copy(c);}function ow(){if(c.zoomLevel==dx.zoomLevel&&aZ((c.center.x-dx.center.x)/q)<0.25&&aZ((c.center.y-dx.center.y)/p)<0.25){return;}kG();lz();dx=c.MakeCopy();;}function kG(){var jZ=p<900?900:p;var jn=q<900?900:q;ez=ix(-0.5*jZ);eG=ix(1.5*jZ);ey=hF(-0.5*jn);en=hF(1.5*jn);}function lz(){if(c.mapStyle==aS){if(i&&i.parentNode==j){j.removeChild(i);}return;}var aW=new Array();var go=eb.length-1;while(eb[go]<c.zoomLevel&&go>=0){go--;}jx(cM[go],aW);oz(aW);}function jx(et,aW){if(oB(et.boundingRectangle[0],et.boundingRectangle[1])){return;}if(et.childRegions!=null){for(var a=0;a<et.childRegions.length;a++){jx(et.childRegions[a],aW);}}else{var cH=et.indices;var eL=new Msn.VE.LatLong(dv[cH[0]],dB[cH[0]]);var eH;var fv=false;if(fR(eL.latitude,eL.longitude)){var fr=x.LatLongToPixel(eL,c.zoomLevel);aW.push(fr.x-I);aW.push(fr.y-H);fv=true;}for(var fW=1;fW<cH.length;fW++){eH=new Msn.VE.LatLong(dv[cH[fW]],dB[cH[fW]]);if(fR(eH.latitude,eH.longitude)){if(!fv){var fr=x.LatLongToPixel(eL,c.zoomLevel);aW.push(fr.x-I);aW.push(fr.y-H);}fv=true;var fs=x.LatLongToPixel(eH,c.zoomLevel);aW.push(fs.x-I);aW.push(fs.y-H);}else if(fv){fv=false;var fs=x.LatLongToPixel(eH,c.zoomLevel);aW.push(fs.x-I);aW.push(fs.y-H);}eL=eH;}}}function oz(aW){if(i&&i.parentNode==j){j.removeChild(i);}i=document.createElement("v:polyline");i.id=ls;i.className="Line";i.points=aW.join(" ");i.filled="false";i.style.zIndex=aY;i.unselectable="on";if(dd){i.style.display="block";}else{i.style.display="none";}var dM=document.createElement("v:stroke");dM.setAttribute("weight",my);dM.setAttribute("joinstyle","round");dM.setAttribute("color",kb);dM.setAttribute("endcap","round");var kV="0.75";if(c.mapStyle=='r'){kV="0.5";}dM.setAttribute("opacity",kV);i.appendChild(dM);j.appendChild(i);}function fR(cJ,da){return cJ>=eG&&cJ<=ez&&da>=ey&&da<=en;}function oB(gz,fU){return((gz.latitude>ez&&fU.latitude>ez)||(gz.latitude<eG&&fU.latitude<eG)||(gz.longitude>en&&fU.longitude>en)||(gz.longitude<ey&&fU.longitude<ey));}this.Init=ot;this.Destroy=bZ;this.RemoveFromMap=cI;this.Show=aN;this.Hide=as;this.ChangeVisibility=qA;this.StartLine=ka;this.UpdateLine=ow;}function oa(J){var bR=null;this.Init=function(){if(navigator.userAgent.toLowerCase().indexOf("msie")!=-1){bR=document.createElement("div");bR.className="PoweredByLogo PoweredByLogo_ie";}else{bR=document.createElement("img");bR.src="http://local.live.com/i/logo_powered_by.png";bR.className="PoweredByLogo";}bz();J.appendChild(bR);};this.Destroy=function(){J.removeChild(bR);bR=null;};function bz(){bR.style.top=(p-40)+"px";bR.style.left="6px";bR.style.display="block";}function cu(){bz();}this.Reposition=bz;this.Update=cu;}function dc(b){b=ap(b);aC(b);if(bi){return false;}if(aQ){fa();}if(z){z.CancelRequest();}if(b.which&&b.which==2){df=cE;}else if(!b.which&&b.button&&b.button==4){df=cE;}else if(b.altKey){df=cE;}cR=true;df.OnMouseDown(b);return false;}function cz(b){b=ap(b);aC(b);if(cR){df.OnMouseMove(b);}return false;}function bt(b){b=ap(b);aC(b);cR=false;df.OnMouseUp(b);df=dE;bY.focus();return false;}function mM(b){b=ap(b);aC(b);jj();if(aQ||bi){return false;}var e=au.MakeCopy();e.SetCenter(new Msn.VE.Pixel(I+af+bh(b)-d,H+ag+ca(b)-f));if(b.altKey){e.SetZoomLevel(c.zoomLevel-1);}else{e.SetZoomLevel(c.zoomLevel+1);}av(e);return false;}function er(b){b=ap(b);aC(b);if(aQ||bi){return false;}var cq=kp(b);if(cq>0){gn();}else if(cq<0){gK();}return false;}function lH(b){b=ap(b);aC(b);var fD=I+af+bh(b)-d;var fE=H+ag+ca(b)-f;var gD=fL(x.PixelToLatLong(new Msn.VE.Pixel(fD,fE),c.zoomLevel));aq("oncontextmenu",gD);return false;}function gZ(bB,by){if(bB==0&&by==0){return;}lT(c,hu,bB,by);af=c.center.x-I-q/2;ag=c.center.y-H-p/2;j.style.top=-ag+"px";j.style.left=-af+"px";cs.Update();window.setTimeout(pn,1);window.setTimeout(mV,2);}function hj(bB,by,eo,bY){if(bi){return;}if(!eo){eo=-1;}fA=bB;fB=by;gB=eo;if(!bB&&!by){fa();return;}iH=bY;if(!aQ){aQ=true;lW();aq("onstartcontinuouspan");}}function lW(){if(aQ){gZ(fA,fB);if(gB>0)gB--;if(gB!=0)window.setTimeout(lW,10);else fa();}}function fa(){fA=0;fB=0;aQ=false;iH=false;if(eI!=null&&fH!=null){var o=new Msn.VE.LatLong(eI,fH);var l=x.LatLongToPixel(o,c.zoomLevel);var aI=l.x-(I+af+q/2);var aJ=l.y-(H+ag+p/2);gZ(aI,aJ);c.latlong.latitude=eI;c.latlong.longitude=fH;au.Copy(c);eI=null;fH=null;if(z){z.UpdateAvailability();}}else{lV(true);}aq("onendcontinuouspan");aq("onchangeview");}function mF(A,L){eI=A;fH=L;jt(x.LatLongToPixel(new Msn.VE.LatLong(A,L),c.zoomLevel));}function pz(e){jt(e.center);}function jt(l){if(c.mapStyle==aS){var g=z.GetScene();if(!g||!g.ContainsPixel(l,c.zoomLevel)){var e=au.MakeCopy();e.sceneId=null;e.SetCenterLatLong(z.PixelToLatLong(l,c.zoomLevel));av(e);return;}}var aI=l.x-(I+af+q/2);var aJ=l.y-(H+ag+p/2);var bg=Math.sqrt(aI*aI+aJ*aJ);if(!dV||aZ(aI)>2*q||aZ(aJ)>2*p||bg>1.5*Math.sqrt(q*q+p*p)){var e=au.MakeCopy();e.SetCenter(l);av(e);return;}var dD=Math.atan2(aJ,aI);var eo=cx(bg/mf);var mI=aj(bg/eo);aI=aj(Math.cos(dD)*mI);aJ=aj(Math.sin(dD)*mI);hj(aI,aJ,eo);}function qh(F,cJ,da,q,p,is,iu,aY){var E=new pY();E.Init(F,cJ,da,q,p,is,iu,aY);an.push(E);return E.pin;}function oH(F){for(var a=0;a<an.length;a++){var jQ=an[a];if(jQ.id==F){an.splice(a,1);jQ.Destroy();return;}}}function mY(){while(an.length>0)an.pop().Destroy();}function qi(){for(var a=0;a<an.length;a++){an[a].Reposition();}}function pY(){var E=document.createElement("div");E.vePushpin=this;this.pin=E;var C=0,B=0,O=0,P=0;var bU=null;var aK=0;var aM=0;var aL=cg+1;var bo=new Array(aL);var bn=new Array(aL);this.Init=function(F,cJ,da,q,p,is,iu,aY){this.id=F;E.id=F;E.className=is;E.style.position="absolute";E.style.zIndex=aY;E.innerHTML=iu;if(!V.fixedView){E.attachEvent("ondblclick",jN);E.attachEvent("onmousewheel",er);}E.unselectable="on";bU=new Msn.VE.LatLong(cJ,da);aK=q;aM=p;var l=x.LatLongToPixel(bU,c.zoomLevel);if(l){C=aj(l.x-I);B=aj(l.y-H);O=C;P=B;cW();es(0);E.style.display="block";}else{E.style.display="none";}j.appendChild(E);};this.Destroy=function(){E.detachEvent("ondblclick",jN);E.detachEvent("onmousewheel",er);cI();E.vePushpin=null;E=null;this.pin=null;while(bo.length>0){bo.pop();}while(bn.length>0){bn.pop();}};this.GetLatitude=function(){return bU.latitude;};this.GetLongitude=function(){return bU.longitude;};function gV(){var aL=cg;for(var a=0;a<=aL;a++){bo[a]=C-aK/2;bn[a]=B-aM/2;}}function cW(){var aL=cg;for(var a=0;a<=aL;a++){var ah=a/aL;var X=1.0-ah;bo[a]=ak(X*C+ah*O-aK/2)+"px";bn[a]=ak(X*B+ah*P-aM/2)+"px";}}function es(a){E.style.left=bo[a];E.style.top=bn[a];}function gI(){var T=0;T=C;C=O;O=T;T=B;B=P;P=T;}function bz(){var l=x.LatLongToPixel(bU,c.zoomLevel);if(l){C=aj(l.x-I);B=aj(l.y-H);gV();es(0);E.style.display="block";}else{E.style.display="none";}}function mO(bM,bP,bf){C-=af;B-=ag;var l=x.LatLongToPixel(bU,bf);if(l){O=aj(l.x-bM);P=aj(l.y-bP);cW();E.style.display="block";}else{E.style.display="none";}}function cI(){if(E.parentNode==j){j.removeChild(E);}}function jN(b){b=ap(b);aC(b);if(aQ||bi){return false;}var e=au.MakeCopy();e.SetCenterLatLong(bU);if(b.altKey){e.SetZoomLevel(c.zoomLevel-1);}else{e.SetZoomLevel(c.zoomLevel+1);}av(e);return false;}function er(b){b=ap(b);aC(b);if(aQ||bi){return false;}var cq=kp(b);if(cq>0){gn();}else if(cq<0){gK();}return false;}this.ClearSteps=gV;this.PrecomputeSteps=cW;this.SetFactor=es;this.SwapStates=gI;this.Reposition=bz;this.PrepareForZoom=mO;this.RemoveFromMap=cI;}function ov(J){var cZ=document.createElement("div");var cS=document.createElement("div");var cK=document.createElement("div");var dq=document.createElement("div");var lA=150;this.Init=function(){cZ.className="ScaleBarLabel ScaleBarLabelBackground";cS.className="ScaleBarLabel ScaleBarLabelForeground";cK.className="ScaleBar ScaleBarBackground";dq.className="ScaleBar ScaleBarForeground";cu();bz();J.appendChild(cZ);J.appendChild(cS);J.appendChild(cK);J.appendChild(dq);};this.Destroy=function(){J.removeChild(cZ);J.removeChild(cS);J.removeChild(cK);J.removeChild(dq);cZ=cS=cK=ro=null;};function bz(){cZ.style.top=(p-45)+"px";cZ.style.left=(q-160)+"px";cZ.style.display="block";cS.style.top=(p-46)+"px";cS.style.left=(q-161)+"px";cS.style.display="block";cK.style.top=(p-30)+"px";cK.style.left=(q-160)+"px";cK.style.display="block";dq.style.top=(p-31)+"px";dq.style.left=(q-161)+"px";dq.style.display="block";}function rp(fp){return fp*0.001;}function qY(fp){return fp*0.000621371192;}function qr(fp){return fp*1.0936133;}function cu(){try{var cm=mJ();var jF=cm*lA;var fQ="mi";var fT=qY(jF);var gW=lu(fT);if(gW<0.5){fQ="yds";fT=qr(jF);gW=lu(fT);}pq("us",fQ,gW,Math.round(gW/fT*lA));}catch(dw){}}function lu(ki){var nl=Math.log(ki)/Math.log(10);var oW=Math.floor(nl);var jc=Math.pow(10,oW);var kc=ki/jc;var lt=Math.floor(kc);if(lt>=3.0){return lt*jc;}var oi=Math.floor(kc*2.0)*0.5;return oi*jc;}function pq(rC,fQ,dR,q){if(dR<1){dR=dR.toFixed(1);}var jD=dR+" "+fQ;cZ.innerHTML=jD;cS.innerHTML=jD;cK.style.width=q;dq.style.width=q;}this.Update=cu;this.Reposition=bz;}var ij=0;var fY=0;var le=0;var ew=new Array();ew[cY]=[325,975];ew[eT]=[350,1050];ew[eq]=[425,1275];ew[aS]=[450,1350];var bC=[0,0,0];function fz(d,f,bc,s){var T=new nJ();T.Init(d,f,bc,s,(d*M-I),(f*M-H));return T;}function kF(ku){while(ku.length>0){var ad=ku.pop();ad.Destroy();ad=null;}}function or(){var hB=0;for(var a=0;a<bC.length;a++){hB+=bC[a];}if(hB==0){return bC;}var md=new Array(bC.length);for(var a=0;a<bC.length;a++){md[a]=bC[a]/hB;}return md;}function nr(){for(var a=0;a<bC.length;a++){bC[a]=0;}}function pu(){return le/fY;}function nJ(){var at=null;var ay=null;var bw=document.createElement("div");var W=0;var ac=0;var eW=0;var Z=0;var aY=0;var aL=cg+1;var bo=new Array(aL);var bn=new Array(aL);var ei=new Array(aL);var ep=new Array(aL);var ho=false;var C=0,B=0,cB=0,cV=0;var O=0,P=0,ec=0,ek=0;var hV=null;this.Init=function(pT,pS,oJ,qn,d,f){W=pT;ac=pS;eW=oJ;Z=qn;bw.style.font="7pt Verdana, sans-serif";bw.style.color="Red";bw.style.backgroundColor="White";if(!x.IsValidTile(W,ac,eW)){return;}hN(d,f,M,M);jo(d,f,M,M);cW();ay=new Image();ay.onload=nf;ay.onerror=Error;hV=new Date();ay.src=x.GetFilename(W,ac,eW);};this.Destroy=function(){if(at){at.onmousedown=null;}cI();while(bo.length>0){bo.pop();}while(bn.length>0){bn.pop();}while(ei.length>0){ei.pop();}while(ep.length>0){ep.pop();}bo=bn=ei=ep=null;};function hN(d,f,aK,aM){C=d;B=f;cB=aK;cV=aM;}this.SetCurrentState=hN;function jo(d,f,aK,aM){O=d;P=f;ec=aK;ek=aM;}this.SetNextState=jo;function gV(){for(var a=0;a<=cg;a++){bo[a]=C+"px";bn[a]=B+"px";ei[a]=cB+"px";ep[a]=cV+"px";}}this.ClearSteps=gV;function cW(){for(var a=0;a<=cg;a++){var ah=a/cg;var X=1.0-ah;bo[a]=ak(X*C+ah*O)+"px";bn[a]=ak(X*B+ah*P)+"px";ei[a]=cx(X*cB+ah*ec)+"px";ep[a]=cx(X*cV+ah*ek)+"px";}}this.PrecomputeSteps=cW;function es(a){if(at==null||(bi&&!ho)){return;}var dg=at.style;dg.left=bo[a];dg.top=bn[a];dg.width=ei[a];dg.height=ep[a];var gQ=bw.style;if(ga&&a==0){dg.border="1px dashed red";gQ.left=bo[a];gQ.top=bn[a];}if(at.parentNode!=j){dg.position="absolute";dg.cursor="pointer";dg.zIndex=aY;j.appendChild(at);if(ga&&bw.parentNode!=j){var cj=at.src;bw.innerHTML=cj.substring(cj.lastIndexOf("/")+1,cj.lastIndexOf("."));gQ.position="absolute";gQ.zIndex=(aY+1);j.appendChild(bw);}}}this.SetFactor=es;function gI(){var T=0;T=C;C=O;O=T;T=B;B=P;P=T;T=cB;cB=ec;ec=T;T=cV;cV=ek;ek=T;}this.SwapStates=gI;function cI(){if(ay){ay.onload=null;ay.onerror=null;ay=null;}if(at){if(at.parentNode==j){j.removeChild(at);}at=null;}if(bw){if(bw.parentNode==j){j.removeChild(bw);}bw=null;}}this.RemoveFromMap=cI;function nf(){if(eW!=c.zoomLevel||ay==null){return;}var iT=new Date();var eF=iT.getTime()-hV.getTime();jU(eF);ij+=eF;fY++;if(ga){window.status="last="+eF+", average="+(ij/fY);}ay.onload=null;ay.onerror=null;at=ay;at.onmousedown=function(b){return false;};ay=null;if(!bi){es(cG);}}function Error(){if(eW!=c.zoomLevel||ay==null){return;}var iT=new Date();var eF=iT.getTime()-hV.getTime();jU(eF);ij+=eF;fY++;le++;ay.onload=null;ay.onerror=null;ay=null;}function jU(qx){for(var a=0;a<ew[Z].length;a++){if(qx<ew[Z][a]){bC[a]++;return;}}bC[bC.length-1]++;}function pg(cN,cy,dG,bM,bP,bf){hN(C-af,B-ag,cB,cV);var iU=bf-dG;var U=Math.pow(2,iU);O=ak((cN+C)*U-bM);P=ak((cy+B)*U-bP);ec=cx((cN+C+cB)*U-bM)-O;ek=cx((cy+B+cV)*U-bP)-P;ho=true;cW();aY=fZ;if(at!=null){at.style.zIndex=aY;}}this.PrepareBaseTile=pg;function nD(cN,cy,dG,bM,bP,bf){var iU=dG-bf;var U=Math.pow(2,iU);O=ak((bM+C)*U-cN);P=ak((bP+B)*U-cy);ec=cx((bM+C+cB)*U-cN)-O;ek=cx((bP+B+cV)*U-cy)-P;var mn=cx(aB*0.25);var jK=cx(cb*0.25);ho=bf<dG&&(W<bV+mn||W>ci-mn||ac<bL+jK||ac>ck-jK);gI();cW();aY=lP;}this.PrepareSwapTile=nD;function ht(az){if(at!=null){at.style.border=az?"1px dashed red":"0px";}bw.style.display=az?"block":"none";}this.Debug=ht;}function mh(){kF(K);j.style.top="0px";j.style.left="0px";I=aj(c.center.x-q/2);H=aj(c.center.y-p/2);af=0;ag=0;bV=ak((I-bH)/M);bL=ak((H-bH)/M);ci=ak((I+q+bH)/M);ck=ak((H+p+bH)/M);aB=ci-bV+1;cb=ck-bL+1;for(var f=bL;f<=ck;f++){for(var d=bV;d<=ci;d++){var ad=fz(d,f,c.zoomLevel,c.mapStyle);K.push(ad);}}}function pn(){if(bi){return;}var jv=I+af;var jq=H+ag;var C=ak((jv-bH)/M);var B=ak((jq-bH)/M);var O=ak((jv+q+bH)/M);var P=ak((jq+p+bH)/M);while(bV<C){for(var f=cb-1;f>=0;f--){var ad=K.splice(f*aB,1)[0];ad.RemoveFromMap();}bV++;aB--;}while(bV>C){bV--;aB++;for(var f=0;f<cb;f++){var ad=fz(bV,bL+f,c.zoomLevel,c.mapStyle);K.splice(f*aB,0,ad);}}while(bL<B){for(var d=0;d<aB;d++){var ad=K.shift();ad.RemoveFromMap();}bL++;cb--;}while(bL>B){bL--;cb++;for(var d=aB-1;d>=0;d--){var ad=fz(bV+d,bL,c.zoomLevel,c.mapStyle);K.unshift(ad);}}while(ci>O){for(var f=cb-1;f>=0;f--){var ad=K.splice(f*aB+aB-1,1)[0];ad.RemoveFromMap();}ci--;aB--;}while(ci<O){ci++;aB++;for(var f=0;f<cb;f++){var ad=fz(ci,bL+f,c.zoomLevel,c.mapStyle);K.splice(f*aB+aB-1,0,ad);}}while(ck>P){for(var d=0;d<aB;d++){var ad=K.pop();ad.RemoveFromMap();}ck--;cb--;}while(ck<P){ck++;cb++;for(var d=0;d<aB;d++){var ad=fz(bV+d,ck,c.zoomLevel,c.mapStyle);K.push(ad);}}}function av(v){if(bi||aQ||cR){return;}var dZ=v.latlong;if(v.GetViewType()=="latlongRect"){dZ=v.latlongRect.Center();}if(v.mapStyle==aS){if(z==null){return;}au.Copy(v);x=z;y.style.backgroundColor="black";v.Resolve(x,q,p);var g=z.GetScene();if((!g||g.GetID()!=v.sceneId)&&v.sceneId!=null){z.RequestScene(v.sceneId);return;}if(!g||(!g.ContainsLatLong(dZ,v.zoomLevel)&&g.GetID()!=v.sceneId)||g.GetOrientation()!=v.sceneOrientation){z.RequestSceneAtLatLong(dZ,v.sceneOrientation,true);return;}}else{x=dp;if(v.mapStyle=='r'){y.style.backgroundColor="#e9e7d4";}else{y.style.backgroundColor="black";}v.Resolve(x,q,p);}dZ=v.latlong;au.Copy(v);x.ValidateZoomLevel(v);hu=x.GetBounds(v);nT(v,hu);v.Resolve(x,q,p);if(v.Equals(c)){return;}var bB=v.GetX(c.zoomLevel)-c.center.x;var by=v.GetY(c.zoomLevel)-c.center.y;var bg=Math.sqrt(bB*bB+by*by);var qV=(bg<q&&bg<p)&&(v.zoomLevel==c.zoomLevel)&&dV&&(v.mapStyle==c.mapStyle)&&(v.sceneId==null||v.sceneId==c.sceneId);if(qV){mF(dZ.latitude,dZ.longitude);return;}kP=c.zoomLevel;if(c.zoomLevel!=v.zoomLevel){aq("onstartzoom");bi=true;}var na=(bg<q&&bg<p)&&(v.zoomLevel==c.zoomLevel-1||v.zoomLevel==c.zoomLevel+1)&&dV&&(v.mapStyle==c.mapStyle)&&(v.sceneId==null||v.sceneId==c.sceneId);if(na){var cN=I+af;var cy=H+ag;var dG=c.zoomLevel;var bf=v.zoomLevel;var bM=aj(v.center.x-q/2);var bP=aj(v.center.y-p/2);cD=K;K=new Array();for(var a=0;a<cD.length;a++){cD[a].PrepareBaseTile(cN,cy,dG,bM,bP,bf);}for(var a=0;a<an.length;a++){an[a].PrepareForZoom(bM,bP,bf);}kZ();c.Destroy();c=v;mh();for(var a=0;a<K.length;a++){K[a].PrepareSwapTile(cN,cy,dG,bM,bP,bf);}cG=1;jH();return;}cD=K;K=new Array();c.Destroy();c=v;kZ();mh();ma();qi();}function jH(){if(!bi){return;}for(var a=0;a<cD.length;a++){cD[a].SetFactor(cG);}for(var a=0;a<K.length;a++){K[a].SetFactor(cG);}for(var a=0;a<an.length;a++){an[a].SetFactor(cG);}if(cG<cg){cG++;window.setTimeout(jH,1);}else{cG=0;ma();}}function ma(){kF(cD);cD=null;bi=false;for(var a=0;a<K.length;a++){K[a].SwapStates();K[a].ClearSteps();K[a].SetFactor(0);}for(var a=0;a<an.length;a++){an[a].SwapStates();an[a].ClearSteps();an[a].SetFactor(0);}ru=null;rj=null;window.setTimeout(mP,250);if(cs){cs.Update();}if(pw!=c.mapStyle){aq("onchangemapstyle");}if(kP!=c.zoomLevel){aq("onendzoom");}aq("onchangeview");if(z){window.setTimeout(z.UpdateAvailability,100);}try{CollectGarbage();}catch(dw){}}function lG(oA,nZ,oU,ob){var e=au.MakeCopy();e.sceneId=null;e.SetLatLongRectangle(new Msn.VE.LatLongRectangle(new Msn.VE.LatLong(oA,nZ),new Msn.VE.LatLong(oU,ob)));av(e);}function kQ(ct){if(!ct||ct.constructor!=Array){return;}var ah=ct[0].latitude;var X=ct[0].longitude;var k=ah;var az=X;for(var a=1;a<ct.length;a++){ah=dX(ah,ct[a].latitude);X=dX(X,ct[a].longitude);k=dJ(k,ct[a].latitude);az=dJ(az,ct[a].longitude);}var jB=(k-ah)*0.1;var jX=(az-X)*0.1;ah-=jB;X-=jX;k+=jB;az+=jX;lG(jC(ah),lN(X),jC(k),lN(az));}function nt(A,L){var o=new Msn.VE.LatLong(A,L);if(c.mapStyle==aS){var g=z.GetScene();if(!g||!g.ContainsLatLong(o)){cc(iM);}}kQ(new Array(c.latlong,o));}function jC(A){return kn(A,jR,jW);}function lN(L){return kn(L,km,lO);}function kn(aL,lI,kl){if(aL<lI){return lI;}if(aL>kl){return kl;}return aL;}function rc(){var d=null;try{d=new ActiveXObject("Msxml2.XMLHTTP");}catch(dw){try{d=new ActiveXObject("Microsoft.XMLHTTP");}catch(dw){d=null;}}if(!d&&typeof XMLHttpRequest!="undefined"){d=new XMLHttpRequest();}return d;}function qv(m){var e=au.MakeCopy();e.SetZoomLevel(m);av(e);}function gn(){var e=au.MakeCopy();e.SetZoomLevel(c.zoomLevel+1);av(e);}function gK(){var e=au.MakeCopy();e.SetZoomLevel(c.zoomLevel-1);av(e);}function qZ(A,L,m){var e=au.MakeCopy();e.sceneId=null;e.SetCenterLatLong(new Msn.VE.LatLong(A,L));e.SetZoomLevel(m);av(e);}function qP(){var g=null;var ba=false;var hc=false;var br=null;var ib=null;var gi=false;var fu=null;var dN=-1;var t=['02121222233','02121222322','02121222323','02121222332','02121222333','02121223222','02121223223','02121223232','02123000101','02123000103','02123000110','02123000111','02123000112','02123000113','02123000130','02123000131','02123001000','02123001001','02123001002','02123001003','02123001010','02123001012','02123001020','02123001021','02123001030','02123002113','02123002131','02123002133','02123002311','02123002313','02123003002','02123003003','02123003012','02123003020','02123003021','02123003022','02123003023','02123003030','02123003032','02123003200','02123003201','02123003202','02123003210','02133333112','02133333121','02133333122','02133333123','02133333130','02133333131','02133333132','02133333133','02133333201','02133333203','02133333210','02133333211','02133333212','02133333213','02133333300','02133333301','02133333302','02133333303','02133333310','02301020311','02301020313','02301020331','02301020332','02301020333','02301021013','02301021021','02301021022','02301021023','02301021030','02301021031','02301021032','02301021033','02301021122','02301021200','02301021201','02301021202','02301021203','02301021210','02301021211','02301021212','02301021213','02301021222','02301021300','02301022110','02301022111','02301031102','02301031103','02301031120','02301031121','02301031131','02301031133','02301120020','02301120022','02301213211','02301213213','02301213300','02301213301','02301213302','02301213303','02301213310','02301213311','02301213312','02301213313','02301213320','02301213321','02301213322','02301213323','02301213330','02301213331','02301213332','02301213333','02301231013','02301231031','02301231100','02301231101','02301231102','02301231103','02301231110','02301231111','02301231112','02301231113','02301231120','02301231121','02301231130','02301231131','02301231132','02301231133','02301231310','02301231311','02301300230','02301300231','02301300232','02301300233','02301300302','02301300320','02301301131','02301301133','02301301332','02301301333','02301302123','02301302132','02301302133','02301302200','02301302201','02301302202','02301302203','02301302210','02301302211','02301302212','02301302213','02301302220','02301302221','02301302221','02301302222','02301302223','02301302230','02301302231','02301302232','02301302233','02301302300','02301302301','02301302302','02301302303','02301302310','02301302311','02301302312','02301302313','02301302320','02301302321','02301302322','02301302323','02301302330','02301302331','02301302332','02301302333','02301303021','02301303022','02301303110','02301303111','02301303200','02301303201','02301310020','02301310021','02301310022','02301310023','02301310200','02301310201','02301312033','02301312211','02301312300','02301312302','02301312320','02301312321','02301312332','02301320000','02301320001','02301320002','02301320003','02301320010','02301320011','02301320012','02301320013','02301320020','02301320021','02301320022','02301320023','02301320030','02301320031','02301320032','02301320033','02301320100','02301320101','02301320102','02301320103','02301320110','02301320111','02301320112','02301320113','02301320120','02301320121','02301320130','02301320200','02301320201','02301320203','02301320210','02301320211','02301320212','02301320213','02301320230','02301320231','02301320300','02301321001','02301321002','02301321003','02301321010','02301321011','02301321012','02301321013','02301321100','02301321101','02301321102','02301321103','02301330011','02301330100','02301330101','02301330102','02301330103','02301330110','02310103023','02310103030','02310103031','02310103032','02310103033','02310103120','02310103122','02310103203','02310103210','02310103211','02310103212','02310103213','02310103300','02310103302','02310210322','02310210323','02310210332','02310210333','02310211203','02310211212','02310211213','02310211221','02310211222','02310211223','02310211230','02310211231','02310211232','02310211233','02310211302','02310211303','02310211320','02310211321','02310211322','02310212011','02310212100','02310212101','02310212110','02310212111','02310212112','02310212130','02310212132','02310213000','02310213001','02310213002','02310213003','02310213010','02310213011','02310213012','02310213100','02310213112','02310213113','02310213130','02310213131','02310213132','02310213133','02310213311','02310223202','02310223203','02310223220','02310223221','02310302002','02310302003','02310302012','02310302013','02310302020','02310302021','02310302022','02310302023','02310302030','02310302031','02310302032','02310302033','02310302120','02310302121','02310302122','02310302123','02310302200','02310302201','02310302210','02310302211','02310302212','02310302213','02310302230','02310302231','02310302232','02310302233','02310302300','02310302301','02310302302','02310302320','02311102213','02311102231','02311102302','02311102303','02311102320','02311102321','02311102323','02311102332','02311102333','02311103222','02311120101','02311120103','02311120110','02311120111','02311120112','02311120113','02311120121','02311120130','02311120131','02311121000','02311121002','02311121020','02311231220','02311231221','02311231222','02311231223','02311231230','02311231231','02311231232','02311231233','02311231320','02311231322','02311232023','02311232032','02311232033','02311232122','02311232201','02311232210','02311232211','02311232212','02311232213','02311232230','02311232231','02311232300','02311232302','02311233000','02311233001','02311233002','02311233003','02311233010','02311233011','02311233012','02311233013','02311233100','02311233102','02311300131','02311300132','02311300133','02311300310','02311300311','02311300312','02311300313','02311300331','02311301020','02311301021','02311301022','02311301023','02311301200','02311301201','02311301202','02311301203','02313032013','02313032030','02313032031','02313032032','02313032033','02313032120','02313032121','02313032122','02313032123','02313032130','02313032131','02313032132','02313032133','02313032210','02313032211','02313032300','02313032301','02313032310','02313032311','02313102232','02313102233','02313102332','02313102333','02313113033','02313113122','02313113210','02313113211','02313113212','02313113213','02313113300','02313113302','02313113311','02313113313','02313120010','02313120011','02313120012','02313120013','02313120030','02313120031','02313120032','02313120100','02313120101','02313120102','02313120103','02313120110','02313120120','02313210211','02313210213','02313210231','02313210300','02313210301','02313210302','02313210303','02313210310','02313210311','02313210312','02313210313','02313210320','02313210321','02313210322','02313210323','02313210330','02313210331','02313210332','02313210333','03022220013','03022220031','03022220033','03022220102','03022220103','03022220112','03022220113','03022220120','03022220121','03022220122','03022220123','03022220130','03022220131','03022220132','03022220133','03022220211','03022220300','03022220301','03022220310','03022220311','03022313313','03022313330','03022313331','03022313332','03022313333','03022320313','03022322030','03022322031','03022322032','03022322033','03022322120','03022322121','03022322122','03022322123','03022322130','03022322132','03022322210','03022322211','03022323021','03022323022','03022323023','03022323123','03022323200','03022323201','03022323202','03022323203','03022323210','03022323211','03022323212','03022323213','03022323231','03022323233','03022323300','03022323301','03022323302','03022323303','03022323312','03022323320','03022323321','03022323322','03022330332','03022330333','03022331110','03022331111','03022331113','03022331123','03022331130','03022331131','03022331132','03022331133','03022331220','03022331221','03022331222','03022331223','03022331230','03022331232','03022331301','03022331310','03022331311','03022332003','03022332012','03022332013','03022332020','03022332021','03022332022','03022332023','03022332030','03022332031','03022332032','03022332033','03022332101','03022332103','03022332110','03022332111','03022332112','03022332113','03022332200','03022332201','03022332202','03022332203','03022332210','03022332211','03022332212','03022332213','03022332231','03022332232','03022332233','03022332320','03022332321','03022332322','03022332323','03022333000','03022333001','03022333002','03022333003','03022333010','03022333011','03022333012','03022333013','03023202202','03023202203','03023202212','03023202213','03023202220','03023202221','03023202222','03023202223','03023202230','03023202231','03023202232','03023202233','03023202302','03023202303','03023202320','03023202321','03023202322','03023202323','03023202330','03023202331','03023202332','03023202333','03023203213','03023203231','03023203233','03023203302','03023203320','03023203321','03023203322','03023203323','03023203330','03023203331','03023203332','03023203333','03023212222','03023212233','03023220000','03023220001','03023220002','03023220003','03023220010','03023220011','03023220012','03023220013','03023220020','03023220021','03023220022','03023220023','03023220030','03023220031','03023220032','03023220033','03023220100','03023220101','03023220102','03023220103','03023220110','03023220111','03023220112','03023220113','03023220120','03023220122','03023220130','03023220131','03023220132','03023220133','03023220200','03023220201','03023220210','03023220211','03023220212','03023220213','03023220230','03023220231','03023220232','03023220233','03023220300','03023220301','03023220302','03023220303','03023220310','03023220311','03023220312','03023220313','03023220320','03023220321','03023220322','03023220323','03023220330','03023220331','03023220332','03023220333','03023221000','03023221001','03023221002','03023221003','03023221010','03023221011','03023221012','03023221013','03023221020','03023221021','03023221022','03023221023','03023221030','03023221031','03023221032','03023221033','03023221100','03023221101','03023221102','03023221103','03023221110','03023221111','03023221112','03023221113','03023221120','03023221121','03023221122','03023221123','03023221130','03023221131','03023221132','03023221200','03023221201','03023221202','03023221203','03023221210','03023221211','03023221220','03023221221','03023221222','03023221223','03023221230','03023221232','03023221300','03023221303','03023221312','03023221313','03023221320','03023221321','03023221322','03023221323','03023221330','03023221331','03023221332','03023221333','03023222010','03023222011','03023222100','03023222101','03023222110','03023222111','03023223000','03023223001','03023223010','03023223100','03023223101','03023223110','03023223111','03023230000','03023230002','03023230020','03023231130','03023231131','03023231132','03023231133','03023231310','03023231311','03023231312','03023231313','03023231321','03023231323','03023231330','03023231331','03023231332','03023231333','03023233101','03023233110','03023233111','03023233212','03023233213','03023233221','03023233223','03023233230','03023233231','03023233232','03023233233','03023320020','03023320021','03023320022','03023320023','03023320030','03023320031','03023320032','03023320033','03023320120','03023320121','03023320122','03023320123','03023320130','03023320131','03023320132','03023320133','03023320200','03023320201','03023320202','03023320203','03023320210','03023320211','03023320212','03023320213','03023320220','03023320221','03023320222','03023320223','03023320230','03023320231','03023320232','03023320233','03023320300','03023320301','03023320302','03023320303','03023320310','03023320311','03023320312','03023320313','03023320320','03023320321','03023320322','03023320323','03023320330','03023320331','03023320332','03023320333','03023321003','03023321013','03023321020','03023321021','03023321022','03023321023','03023321030','03023321031','03023321032','03023321033','03023321102','03023321103','03023321120','03023321121','03023321122','03023321123','03023321130','03023321132','03023321200','03023321201','03023321202','03023321203','03023321210','03023321211','03023321212','03023321213','03023321220','03023321221','03023321222','03023321223','03023321230','03023321231','03023321232','03023321233','03023321300','03023321301','03023321302','03023321320','03023321321','03023321322','03023321323','03023321332','03023322000','03023322001','03023322010','03023322011','03023322100','03023322101','03023322110','03023322111','03023323000','03023323001','03023323002','03023323003','03023323010','03023323011','03023323012','03023323013','03023323020','03023323021','03023323023','03023323030','03023323031','03023323032','03023323033','03023323100','03023323101','03023323102','03023323103','03023323110','03023323112','03023323113','03023323120','03023323121','03023323122','03023323123','03023323130','03023323131','03023323132','03023323133','03023323201','03023323210','03023323211','03023323300','03023323301','03023323302','03023323303','03023323310','03023323311','03023323312','03023323313','03023330222','03023330223','03023332000','03023332001','03023332002','03023332003','03023332010','03023332012','03023332020','03023332021','03023332022','03023332023','03023332030','03023332032','03023332201','03023332202','03023332203','03023332212','03023332220','03023332221','03200000320','03200000321','03200000322','03200000323','03200000330','03200000331','03200000332','03200000333','03200002100','03200002101','03200002102','03200002103','03200002110','03200002111','03200002112','03200002113','03200002120','03200002121','03200002130','03200010303','03200010312','03200010313','03200010321','03200010322','03200010323','03200010330','03200010331','03200010332','03200010333','03200011233','03200011322','03200011323','03200012100','03200012101','03200012102','03200012103','03200012110','03200012111','03200012112','03200012113','03200012120','03200012121','03200012130','03200012131','03200013011','03200013013','03200013100','03200013101','03200013102','03200013103','03200013131','03200013301','03200013303','03200013310','03200013311','03200013312','03200013313','03200013330','03200013331','03200023130','03200023131','03200023132','03200023133','03200023311','03200031310','03200031311','03200031312','03200031313','03200031330','03200031331','03200031333','03200032020','03200032021','03200032022','03200032023','03200032200','03200032201','03200100311','03200100312','03200100313','03200100322','03200100323','03200100330','03200100331','03200100332','03200101202','03200101220','03200102020','03200102021','03200102022','03200102023','03200102030','03200102032','03200102100','03200102101','03200102102','03200102103','03200102110','03200102112','03200102200','03200102201','03200102202','03200102210','03200102220','03200110010','03200110011','03200110100','03200110101','03200120122','03200120123','03200120132','03200120200','03200120202','03200120220','03200120222','03200120300','03200120301','03200120302','03200120303','03200120310','03200120312','03200203001','03200203003','03200203010','03200203011','03200203012','03200203013','03200203021','03200203023','03200203030','03200203031','03200203032','03200203033','03200213103','03200213112','03200213113','03200213121','03200213123','03200213130','03200213131','03200213132','03200213133','03200230101','03200230102','03200230103','03200230110','03200230111','03200230112','03200230113','03200230120','03200230121','03200230130','03200230131','03200230132','03200231002','03200231020','03200231103','03200231112','03200231113','03200231121','03200231123','03200231130','03200231131','03200231132','03200231133','03200231301','03200231303','03200231310','03200231311','03200231312','03200231313','03200232120','03200232121','03200232122','03200232123','03200232130','03200232131','03200232132','03200232133','03200232300','03200232301','03200232310','03200232311','03200232312','03200302002','03200302020','03200302022','03200302222','03200302223','03200302232','03200320000','03200320001','03200320002','03200320003','03200320010','03200320012','03200320013','03200320020','03200320021','03200320022','03200320023','03200320030','03200320031','03200320032','03200320200','03200320201','03200320210','03200332203','03200332212','03200332220','03200332221','03200332222','03200332223','03200332230','03200332231','03200332232','03200332233','03200332322','03201000333','03201001212','03201001213','03201001220','03201001221','03201001222','03201001223','03201001230','03201001231','03201001232','03201001233','03201001320','03201001322','03201001323','03201002111','03201002113','03201002311','03201002312','03201002313','03201002331','03201002332','03201002333','03201003000','03201003001','03201003002','03201003003','03201003010','03201003011','03201003012','03201003013','03201003033','03201003100','03201003101','03201003102','03201003103','03201003110','03201003112','03201003122','03201003200','03201003201','03201003202','03201003203','03201003211','03201003212','03201003220','03201003221','03201003222','03201003223','03201003230','03201003231','03201003232','03201003233','03201003300','03201003302','03201010231','03201010233','03201010320','03201010321','03201010322','03201010323','03201011001','03201011002','03201011003','03201011010','03201011011','03201011012','03201011013','03201011020','03201011021','03201011023','03201011030','03201011031','03201011032','03201011033','03201011100','03201011101','03201011102','03201011103','03201011110','03201011112','03201011120','03201011121','03201011122','03201011123','03201011130','03201012011','03201012100','03201012101','03201012112','03201012113','03201012121','03201012123','03201012130','03201012131','03201012132','03201012133','03201012301','03201012303','03201012310','03201012311','03201012312','03201012313','03201012321','03201012323','03201012330','03201012332','03201013020','03201013022','03201013023','03201013200','03201020111','03201020132','03201020133','03201021000','03201021001','03201021002','03201021003','03201021010','03201021011','03201021012','03201021013','03201021031','03201022110','03201022111','03201022112','03201022113','03201022130','03201022131','03201023303','03201023312','03201023313','03201023320','03201023321','03201023322','03201023323','03201023330','03201023331','03201023332','03201023333','03201032220','03201032222','03201201100','03201201101','03201201110','03201201111','03201210000','03202002022','03202002023','03202002032','03202002200','03202002201','03202002202','03202002210','03202010333','03202011222','03202011223','03202011232','03202012111','03202012113','03202012130','03202012131','03202013000','03202013001','03202013002','03202013003','03202013010','03202013012','03202013020','03202013021','03202101311','03202101313','03202101323','03202101332','03202101333','03202102331','03202102333','03202103101','03202103103','03202103110','03202103111','03202103112','03202103113','03202103121','03202103123','03202103130','03202103131','03202103132','03202103133','03202103202','03202103203','03202103220','03202103221','03202103222','03202103223','03202103311','03202110001','03202110003','03202110010','03202110011','03202110012','03202110013','03202110100','03202110200','03202110201','03202110202','03202110203','03202110220','03202112000','03202112002','03202112020','03202112021','03202112022','03202112023','03202112200','03202121023','03202121032','03202121033','03202121201','03202121203','03202121210','03202121211','03202121212','03202121213','03202121300','03202121302','03202121323','03202121332','03202121333','03202123100','03202123101','03202123103','03202123110','03202123111','03202123112','03202123113','03202123121','03202123123','03202123130','03202123131','03202123132','03202123133','03202123301','03202123310','03202123311','03202130200','03202130201','03202130202','03202130203','03202130210','03202130212','03202130221','03202130230','03202132000','03202132002','03202132003','03202132020','03202132021','03202132022','03202132023','03202132032','03202132200','03202132201','03202132210','03202301011','03202301013','03202301031','03202301100','03202301102','03202301103','03202301112','03202301113','03202301120','03202301121','03202301122','03202301123','03202301130','03202301131','03202301132','03202301133','03202301300','03202301301','03202301310','03202301311','03202310020','03202310022','03202310200'];this.Init=function(ok){ib=ok;};this.Destroy=function(){};function fy(W,ac,m){return g.IsValidTile(W,ac,m);}function hv(W,ac,cd){return g.GetTileFilename(W,ac,cd);}function ce(m){if(!g){return 0;}var l=new Msn.VE.Pixel(aj(I+af+q/2),aj(H+ag+p/2));var jz=g.PixelToLatLong(l,m);l.x++;var jA=g.PixelToLatLong(l,m);var eU=Math.sin(cw(jz.latitude));var eK=Math.sin(cw(jA.latitude));var lg=bm/2*aZ(Math.log((1+eU)/(1-eU))-Math.log((1+eK)/(1-eK)));var kq=bm*aZ(cw(jz.longitude)-cw(jA.longitude));return Math.sqrt(kq*kq+lg*lg);}function du(l,m){return g?g.PixelToLatLong(l,m):null;}function cQ(o,m){return g?g.LatLongToPixel(o,m):null;}function hg(e){if(e.zoomLevel<1){e.SetZoomLevel(1);}else if(e.zoomLevel>2){e.SetZoomLevel(2);}}function nh(){return g;}function dj(){return g.GetBounds();}function qO(){return ba;}function nW(){if(!ba){return null;}var qo=new Object();return qo;}function ou(){if(c.mapStyle==aS){return;}if(c.zoomLevel<12){g=null;hc=ba;ba=false;it();return;}mr(c.latlong,"North",false,500);}function mr(o,ea,pb,kz){he();gi=pb;if(!nb(o)){g=null;hc=ba;ba=false;it();return;}fu=ib+"?lat="+o.latitude+"&lon="+o.longitude;if(ea){fu+="&o="+ea;}if(kz){dN=window.setTimeout(iJ,kz);}else{iJ();dN=-1;}}function pE(F){if(g&&g.GetID()==F){return;}he();gi=true;fu=ib+"?id="+F;iJ();}function he(){try{if(dN!=-1){window.clearTimeout(dN);}}catch(dw){}dN=-1;try{if(br){br.onreadystatechange=null;br.abort();}}catch(dw){}}function iJ(){he();if(!fu){return;}if(!br){br=rc();}if(br){br.open("POST",fu,true);br.onreadystatechange=oY;br.send("");}}function oY(){if(!br||br.readyState!=4){return;}dN=-1;hc=ba;var lQ=br.responseText;if(lQ){try{g=eval(lQ);ba=true;}catch(dw){g=null;ba=false;}}else{g=null;ba=false;}it();}function it(){if(gi){gi=false;if(ba){var e=au.MakeCopy();e.SetMapStyle(aS,g.GetID(),g.GetOrientation());av(e);aq("onobliquechange");}else{var e=au.MakeCopy();e.SetMapStyle(iM);if(e.GetViewType()!="latlongRect"){e.SetZoomLevel(hY);}av(e);aq("onerror",fL(c.latlong,c.zoomLevel,"Bird's Eye images are not available for this area."));}}if(hc!=ba){if(ba){aq("onobliqueenter");}else{aq("onobliqueleave");}}}function nb(o){if(!o||!t||t.length==0){return false;}var bF=qm(o,t[0].length);return ic(bF,0,t.length-1);}function qm(o,m){var l=dp.LatLongToPixel(o,m);var W=ak(l.x/M);var ac=ak(l.y/M);var bF="";for(var a=m;a>0;a--){var ao=0;var eR=1<<(a-1);if((W&eR)!=0){ao++;}if((ac&eR)!=0){ao+=2;}bF+=(ao+"");}return bF;}function ic(bF,bu,bs){if(bs<bu)return false;var gf=ak((bu+bs)/2);if(t[gf]==bF)return true;if(bF<t[gf])return ic(bF,bu,gf-1);return ic(bF,gf+1,bs);}this.IsValidTile=fy;this.GetFilename=hv;this.MetersPerPixel=ce;this.PixelToLatLong=du;this.LatLongToPixel=cQ;this.GetBounds=dj;this.ValidateZoomLevel=hg;this.IsAvailable=qO;this.UpdateAvailability=ou;this.CancelRequest=he;this.GetEventInfo=nW;this.GetScene=nh;this.RequestSceneAtLatLong=mr;this.RequestScene=pE;}function py(){var t=[new Msn.VE.Bounds(1, 9, 0, 0, 2, 2),new Msn.VE.Bounds(10, 19, 156, 348, 321, 441),new Msn.VE.Bounds(10, 17, 28, 216, 141, 333),new Msn.VE.Bounds(10, 17, 108, 216, 361, 381),new Msn.VE.Bounds(10, 17, 56, 444, 72, 460),new Msn.VE.Bounds(10, 17, 480, 292, 520, 352)];this.Init=function(){};this.Destroy=function(){};function fy(W,ac,m){var aE=1<<m;return W>=0&&ac>=0&&W<aE&&ac<aE;}function hv(W,ac,cd){var jT="";var ao=0;for(var a=cd;a>0;a--){ao=0;var eR=1<<(a-1);if((W&eR)!=0){ao++;}if((ac&eR)!=0){ao+=2;}jT+=ao+"";}return"http://"+c.mapStyle+ao+".ortho.tiles.virtualearth.net/tiles/"+c.mapStyle+jT+(c.mapStyle==cY?".png":".jpeg")+"?g="+ej[c.mapStyle];}function ce(m){return fX/((1<<m)*M);}function du(l,m){var fj=ce(m);var iN=l.x*fj-fC;var jf=fC-l.y*fj;var o=new Msn.VE.LatLong();o.latitude=gL(Math.PI/2-2*Math.atan(Math.exp(-jf/bm)));o.longitude=gL(iN/bm);return o;}function cQ(o,m){var fx=Math.sin(cw(o.latitude));var iN=bm*cw(o.longitude);var jf=bm/2*Math.log((1+fx)/(1-fx));var fj=ce(m);var l=new Msn.VE.Pixel();l.x=((fC+iN)/fj);l.y=((fC-jf)/fj);return l;}function dj(e){if(e==undefined){e=c;}var m=e.zoomLevel;var d=e.center.x;var f=e.center.y;for(var a=0;a<t.length;a++){var hx=m-t[a].z1;var ab=M*Math.pow(2,hx);var fc=t[a].x1*ab;var fo=t[a].x2*ab;var fb=t[a].y1*ab;var eN=t[a].y2*ab;if(d>=fc&&d<=fo&&f>=fb&&f<=eN){if(m>=t[a].z1&&m<=t[a].z2){return t[a];}}}}function hg(e){var d=e.center.x;var f=e.center.y;var fh=0;for(var a=0;a<t.length;a++){var ab=M*Math.pow(2,e.zoomLevel-t[a].z1);var fc=t[a].x1*ab;var fo=t[a].x2*ab;var fb=t[a].y1*ab;var eN=t[a].y2*ab;if(d>=fc&&d<=fo&&f>=fb&&f<=eN){if(t[a].z2>=e.zoomLevel){return;}else if(t[a].z2>fh){fh=t[a].z2;}}}e.SetZoomLevel(fh);}this.IsValidTile=fy;this.GetFilename=hv;this.MetersPerPixel=ce;this.PixelToLatLong=du;this.LatLongToPixel=cQ;this.GetBounds=dj;this.ValidateZoomLevel=hg;}function nu(){var ax=document.createElement("div");var ai=document.createElement("div");var C=0,B=0,O=0,P=0;this.Init=function(){ax.className="ZoomBox_bg";ai.className="ZoomBox_fg";ax.attachEvent("onmouseup",bt);ai.attachEvent("onmouseup",bt);j.appendChild(ax);j.appendChild(ai);};this.Destroy=function(){ax.detachEvent("onmouseup",bt);ai.detachEvent("onmouseup",bt);j.removeChild(ax);j.removeChild(ai);};function hy(b){C=O=bh(b)-d+af;B=P=ca(b)-f+ag;ld(C,B,1,1);aN();if(ai.setCapture){ai.setCapture();}}function iO(b){O=bh(b)-d+af;P=ca(b)-f+ag;ld(dX(C,O),dX(B,P),dJ(1,aZ(O-C)),dJ(1,aZ(P-B)));}function iq(b){if(aZ(C-O)>1&&aZ(B-P)>1){var e=au.MakeCopy();e.SetZoomLevel(c.zoomLevel);e.SetPixelRectangle(new Msn.VE.PixelRectangle(new Msn.VE.Pixel(I+C,H+B),new Msn.VE.Pixel(I+O,H+P)));av(e);}as();if(ai.releaseCapture){ai.releaseCapture();}}function ld(d,f,aK,aM){kW(ax,d+1,f+1,aK,aM);kW(ai,d,f,aK,aM);}function kW(cU,d,f,aK,aM){cU.style.left=d+"px";cU.style.top=f+"px";cU.style.width=aK+"px";cU.style.height=aM+"px";}function aN(){ax.style.display="block";ai.style.display="block";}function as(){ax.style.display="none";ai.style.display="none";}this.OnMouseDown=hy;this.OnMouseMove=iO;this.OnMouseUp=iq;}function oT(){var gF=false;this.Init=function(){};this.Destroy=function(){};function hy(b){gF=false;iF=bh(b);iC=ca(b);if(y.setCapture){y.setCapture();}var fD=I+af+bh(b)-d;var fE=H+ag+ca(b)-f;aq("onstartcontinuouspan",fL(x.PixelToLatLong(new Msn.VE.Pixel(fD,fE),c.zoomLevel)));}function iO(b){var cv=bh(b);var lp=ca(b);gZ(iF-cv,iC-lp);iF=cv;iC=lp;gF=true;}function iq(b){lV(true);if(y.releaseCapture){y.releaseCapture();}if(gF){aq("onendcontinuouspan");aq("onchangeview");gF=false;}var fD=I+af+bh(b)-d;var fE=H+ag+ca(b)-f;var gD=fL(x.PixelToLatLong(new Msn.VE.Pixel(fD,fE),c.zoomLevel));aq("onmouseup",gD);aq("onclick",gD);}this.OnMouseDown=hy;this.OnMouseMove=iO;this.OnMouseUp=iq;}this.SetCenter=hn;this.SetMapStyle=cc;this.GetCenterLatitude=qL;this.GetCenterLongitude=oS;this.GetLatitude=ix;this.GetLongitude=hF;this.GetY=hJ;this.GetX=hK;this.LatLongToPixel=cQ;this.PixelToLatLong=du;this.GetZoomLevel=qB;this.GetMapStyle=oK;this.GetMetersPerPixel=mJ;this.Resize=qF;this.PanMap=gZ;this.ContinuousPan=hj;this.StopContinuousPan=fa;this.PanToLatLong=mF;this.AddPushpin=qh;this.RemovePushpin=oH;this.ClearPushpins=mY;this.SetViewport=lG;this.SetBestMapView=kQ;this.IncludePointInViewport=nt;this.SetZoom=qv;this.ZoomIn=gn;this.ZoomOut=gK;this.SetCenterAndZoom=qZ;this.AddLine=pR;this.RemoveLine=pe;this.ClearLines=ju;this.AttachEvent=eu;this.DetachEvent=ee;this.IsObliqueAvailable=ps;this.GetObliqueScene=qJ;this.SetAnimationEnabled=re;this.IsAnimationEnabled=nw;this.SetObliqueScene=pJ;this.SetObliqueOrientation=ng;this.SetView=av;this.Debug=ht;this.GetResponseRangeCounts=or;this.ResetResponseRangeCounts=nr;this.GetFailureRate=pu;};
Msn.VE.Bounds=function(fd,eY,C,B,O,P){this.z1=fd;this.z2=eY;this.x1=C;this.y1=B;this.x2=O;this.y2=P;};
Msn.VE.Dashboard=function(i,j,aT){var gE=document.createElement("div");var gw=document.createElement("div");var dO=document.createElement("div");var gp=null;var jI=document.createElement("hr");var be=document.createElement("div");var cr=document.createElement("input");var kh=true;var bq=null;var dr=null;var em=null;var de=null;var bG=null;var ch=null;var hX=document.createElement("table");hX.className="dashboardContainerTable";var iS=document.createElement("tbody");var iG=document.createElement("tr");hX.appendChild(iS);iS.appendChild(iG);var ig=document.createElement("td");var dT=document.createElement("td");dT.vAlign="top";var dL=document.createElement("td");dL.colSpan=2;dL.setAttribute("colspan",2);dL.className="obliqueSelectorTable";iG.appendChild(ig);iG.appendChild(dT);var kS=document.createElement("tr");kS.appendChild(dL);iS.appendChild(kS);this.Init=function(){var Z=j.GetMapStyle();iD(gE,"road",mH);iD(gw,"aerial",lJ);iD(dO,"bird's eye",iL);jI.className="Dashboard_separator";i.appendChild(jI);i.appendChild(hX);if(!aT||aT==Msn.VE.DashboardSize.Normal){bq=new ql(ig,5,30);bq.Init();bq.Show();}dr=new pi(ig);dr.Hide();em=new qt(dT,100,30);em.Init();de=new pH(dT);oR();nS();ch=new nU(dL);ch.Init();j.AttachEvent("onendzoom",me);j.AttachEvent("onobliqueenter",mz);j.AttachEvent("onobliqueleave",jO);j.AttachEvent("onchangemapstyle",ks);j.AttachEvent("onobliquechange",nN);if(j.IsObliqueAvailable()){mK();}else{jM();}switch(Z){case'r':kM();break;case'a':case'h':mx();break;case'o':mq();break;}};this.Destroy=function(){hD(gE,mH);hD(gw,lJ);hD(dO,iL);gp=gE=gw=dO=null;be.removeChild(cr);dT.removeChild(be);be.detachEvent("onclick",kY);be=cr=null;if(bq){bq.Destroy();bq=null;}if(de){de.Destroy();de=null;}if(ch){ch.Destroy();ch=null;}if(j){j.DetachEvent("onendzoom",me);j.DetachEvent("onobliqueenter",mz);j.DetachEvent("onobliqueleave",jO);j.DetachEvent("onchangemapstyle",ks);j=null;}};this.GetY=function(){return gh(i);};this.GetHeight=function(){return i.offsetHeight;};function iD(bI,aR,cX,rz){bI.className="Dashboard_tab Dashboard_unselected";bI.href="javascript:void(0)";bI.innerText=aR;bI.attachEvent("onclick",cX);i.appendChild(bI);}function hD(bI,cX){bI.detachEvent("onclick",cX);i.removeChild(bI);}function je(bI){if(gp){gp.className="Dashboard_tab Dashboard_unselected";}bI.className="Dashboard_tab Dashboard_selected";gp=bI;}function oR(){cr.type="checkbox";be.className="Dashboard_toggler";be.style.display="none";be.attachEvent("onclick",kY);be.appendChild(cr);be.appendChild(document.createTextNode("Show labels"));dT.appendChild(be);}function nS(){bG=document.createElement("div");bG.className="Dashboard_notification";bG.innerHTML="<div id=\"obliqueNotifyIcon\">&nbsp;</div> There is Bird's Eye imagery available for this location.";bG.style.display="none";bG.onclick=iL;dL.appendChild(bG);}function kM(){je(gE);be.style.display="none";ch.Hide();de.Hide();em.Show();if(j.IsObliqueAvailable()){bG.style.display="block";}if(bq){bq.Show();}dr.Hide();}function mx(){je(gw);be.style.display="block";ch.Hide();de.Hide();em.Show();if(j.GetMapStyle()=='h'){cr.checked=true;}else{cr.checked=false;}if(j.IsObliqueAvailable()){bG.style.display="block";}if(bq){bq.Show();}dr.Hide();}function mq(){je(dO);be.style.display="none";bG.style.display="none";ch.Show();em.Hide();de.Show();if(bq){bq.Hide();}dr.Show();}function mK(){dO.className="Dashboard_tab Dashboard_unselected";bG.style.display="block";}function jM(){dO.className="Dashboard_tab Dashboard_disabled";bG.style.display="none";}function mH(){j.SetMapStyle('r');}function lJ(){if(kh||cr.checked){j.SetMapStyle('h');}else{j.SetMapStyle('a');}kh=false;}function iL(){j.SetMapStyle('o');}function kY(b){var Z=j.GetMapStyle();if(Z=='a'){j.SetMapStyle('h');cr.checked=true;}else if(Z=='h'){j.SetMapStyle('a');cr.checked=false;}}function me(b){em.UpdateFromMap();de.UpdateFromMap();}function mz(b){if(j.GetMapStyle()=="o"){return;}mK();dr.UpdateFromMap();}function jO(b){jM();}function ks(b){switch(b.view.mapStyle){case'r':kM();break;case'a':case'h':mx();break;case'o':mq();break;}}function nN(b){ch.Update();dr.UpdateFromMap();}function ql(J){var i=document.createElement("div");var d=0,f=0;var aQ=false;var cA=15;this.Init=function(){i.className="Compass";i.attachEvent("onmousedown",dc);i.attachEvent("onmouseup",bt);i.attachEvent("onmousemove",cz);i.attachEvent("ondblclick",G);J.appendChild(i);};this.Destroy=function(){i.detachEvent("onmousedown",dc);i.detachEvent("onmouseup",bt);i.detachEvent("onmousemove",cz);i.detachEvent("ondblclick",G);i=null;};function dc(b){b=ap(b);aC(b);d=hZ(i);f=gh(i);if(i.setCapture){i.setCapture();}var aI=bh(b)-d-(i.offsetWidth/2);var aJ=ca(b)-f-(i.offsetHeight/2);aI=Math.min(Math.max(aI,-cA),cA);aJ=Math.min(Math.max(aJ,-cA),cA);j.ContinuousPan(aI,aJ);aQ=true;return false;}function cz(b){b=ap(b);aC(b);if(aQ){var aI=bh(b)-d-(i.offsetWidth/2);var aJ=ca(b)-f-(i.offsetHeight/2);aI=Math.min(Math.max(aI,-cA),cA);aJ=Math.min(Math.max(aJ,-cA),cA);j.ContinuousPan(aI,aJ);}return false;}function bt(b){b=ap(b);aC(b);if(i.releaseCapture){i.releaseCapture();}j.StopContinuousPan();aQ=false;return false;}function as(){i.style.display="none";}function aN(){i.style.display="block";}this.Hide=as;this.Show=aN;}function nU(J){var i=document.createElement("table");var u=new Array(3);this.Init=function(){i.className="obliqueSelectorTable";as();J.appendChild(i);var jh=document.createElement("tbody");jh.className="obliqueSelectorTable";i.appendChild(jh);for(var a=0;a<3;a++){var lk=document.createElement("tr");jh.appendChild(lk);u[a]=new Array(3);for(var Y=0;Y<3;Y++){var al=document.createElement("div");var ao=document.createElement("td");lk.appendChild(ao);ao.appendChild(al);al.className="Dashboard_thumbnail";if(a==1&&Y==1){u[a][Y]=new jJ(al,false);ao.className="obliqueSelectorCellCenter";}else{u[a][Y]=new jJ(al,true);ao.className="obliqueSelectorCellOff";}u[a][Y].Init();}}};this.Destroy=function(){J.removeChild(i);i=null;for(var a=0;a<u.length;a++){for(var Y=0;Y<u[a].length;Y++){u[a][Y].Destroy();u[a][Y]=null;}}u=null;};function aN(){cu();i.style.display="block";}function as(){i.style.display="none";}function cu(){var g=j.GetObliqueScene();if(!g){return;}u[1][1].SetScene(g);switch(g.GetOrientation()){case"North":u[0][0].SetScene(g.GetNeighbor("Northwest"));u[0][1].SetScene(g.GetNeighbor("North"));u[0][2].SetScene(g.GetNeighbor("Northeast"));u[1][0].SetScene(g.GetNeighbor("West"));u[1][2].SetScene(g.GetNeighbor("East"));u[2][0].SetScene(g.GetNeighbor("Southwest"));u[2][1].SetScene(g.GetNeighbor("South"));u[2][2].SetScene(g.GetNeighbor("Southeast"));break;case"East":u[0][0].SetScene(g.GetNeighbor("Northeast"));u[0][1].SetScene(g.GetNeighbor("East"));u[0][2].SetScene(g.GetNeighbor("Southeast"));u[1][0].SetScene(g.GetNeighbor("North"));u[1][2].SetScene(g.GetNeighbor("South"));u[2][0].SetScene(g.GetNeighbor("Northwest"));u[2][1].SetScene(g.GetNeighbor("West"));u[2][2].SetScene(g.GetNeighbor("Southwest"));break;case"West":u[0][0].SetScene(g.GetNeighbor("Southwest"));u[0][1].SetScene(g.GetNeighbor("West"));u[0][2].SetScene(g.GetNeighbor("Northwest"));u[1][0].SetScene(g.GetNeighbor("South"));u[1][2].SetScene(g.GetNeighbor("North"));u[2][0].SetScene(g.GetNeighbor("Southeast"));u[2][1].SetScene(g.GetNeighbor("East"));u[2][2].SetScene(g.GetNeighbor("Northeast"));break;case"South":u[0][0].SetScene(g.GetNeighbor("Southeast"));u[0][1].SetScene(g.GetNeighbor("South"));u[0][2].SetScene(g.GetNeighbor("Southwest"));u[1][0].SetScene(g.GetNeighbor("East"));u[1][2].SetScene(g.GetNeighbor("West"));u[2][0].SetScene(g.GetNeighbor("Northeast"));u[2][1].SetScene(g.GetNeighbor("North"));u[2][2].SetScene(g.GetNeighbor("Northwest"));break;}}function jJ(al,ef){var g=null;this.Init=function(){al.title="Select a thumbnail to display an image from the surrounding area.";if(ef){al.attachEvent("onclick",gO);al.attachEvent("onmouseover",eO);al.attachEvent("onmouseout",gy);}};this.Destroy=function(){if(ef){al.detachEvent("onclick",gO);al.detachEvent("onmouseover",eO);al.detachEvent("onmouseout",gy);}};this.SetScene=function(s){g=s;if(g){al.innerHTML="<img src=\""+g.GetThumbnailFilename()+"\" width=48 height=48 border=0>";if(ef){al.style.cursor="pointer";}}else{al.innerHTML="";al.style.cursor="default";}if(ef){al.parentNode.className="obliqueSelectorCellOff";}};function gO(){if(!g){return;}j.SetObliqueScene(g.GetID());}function eO(b){al.parentNode.className="obliqueSelectorCellOn";}function gy(b){al.parentNode.className="obliqueSelectorCellOff";}}this.Update=cu;this.Show=aN;this.Hide=as;}function qt(J){var w=document.createElement("div");var dI=document.createElement("div");var bv=document.createElement("div");var aa=document.createElement("div");var cL=document.createElement("div");var d=0,f=0;var cR=false;this.Init=function(){cL.className="ZoomBar_minus";cL.unselectable="on";cL.attachEvent("onclick",jL);aa.className="ZoomBar_slider";aa.unselectable="on";aa.attachEvent("onmousedown",dc);aa.attachEvent("onmousemove",cz);aa.attachEvent("onmouseup",bt);aa.attachEvent("onclick",G);bv.className="ZoomBar_bar";bv.unselectable="on";bv.appendChild(aa);bv.attachEvent("onclick",jm);dI.className="ZoomBar_plus";dI.unselectable="on";dI.attachEvent("onclick",mG);w.className="ZoomBar";w.appendChild(cL);w.appendChild(bv);w.appendChild(dI);w.attachEvent("onmousedown",G);w.attachEvent("onmouseup",G);w.attachEvent("onclick",G);w.attachEvent("ondblclick",G);J.appendChild(w);cC();};this.Destroy=function(){cL.detachEvent("onclick",jL);aa.detachEvent("onmousedown",dc);aa.detachEvent("onmousemove",cz);aa.detachEvent("onmouseup",bt);aa.detachEvent("onclick",G);bv.removeChild(aa);bv.detachEvent("onclick",jm);dI.detachEvent("onclick",mG);w.removeChild(dI);w.removeChild(bv);w.removeChild(cL);w.detachEvent("onmousedown",G);w.detachEvent("onmousedown",G);w.detachEvent("onclick",G);w.detachEvent("ondblclick",G);J.removeChild(w);j.DetachEvent("onendzoom",cC);cL=aa=bv=dI=w=J=j=null;};function aN(){w.style.display="block";}function as(){w.style.display="none";}function lv(){d=hZ(w);f=gh(w);}function dc(b){b=ap(b);aC(b);lv();if(aa.setCapture){aa.setCapture();}cR=true;return false;}function cz(b){b=ap(b);aC(b);if(cR){aa.style.left=hL(bh(b))+"px";}return false;}function bt(b){b=ap(b);aC(b);if(aa.releaseCapture){aa.releaseCapture();}cR=false;kJ(hL(bh(b)));return false;}function mG(b){j.ZoomIn();}function jL(b){j.ZoomOut();}function jm(b){b=ap(b);aC(b);lv();kJ(hL(bh(b)));return false;}function hL(cv){cv-=d+cL.offsetWidth+aa.offsetWidth;var aE=bv.offsetWidth-aa.offsetWidth;if(cv<0){cv=0;}else if(cv>aE){cv=aE;}return cv;}function kJ(ar){var aE=bv.offsetWidth-aa.offsetWidth;var cd=1+aj(ar/aE*18);j.SetZoom(cd);}function cC(){var aE=bv.offsetWidth-aa.offsetWidth;var ar=(j.GetZoomLevel()-1)/18*aE;aa.style.left=ar+"px";}this.UpdateFromMap=cC;this.Show=aN;this.Hide=as;}function pH(J){var w=document.createElement("div");var bK=document.createElement("div");var bW=document.createElement("div");w.title="Select the desired zoom level for the image.";w.setAttribute("id","obliqueZoomContainer");bK.setAttribute("id","obliqueZoomSmall");bK.className="obliqueZoomSmallOn";bW.setAttribute("id","obliqueZoomLarge");bW.className="obliqueZoomLargeOff";bK.attachEvent("onclick",kN);bW.attachEvent("onclick",kH);w.appendChild(bK);w.appendChild(bW);J.appendChild(w);function aN(){w.style.display="block";}function as(){w.style.display="none";}function kN(b){j.ZoomOut();bK.className="obliqueZoomSmallOn";bW.className="obliqueZoomLargeOff";}function kH(b){j.ZoomIn();bK.className="obliqueZoomSmallOff";bW.className="obliqueZoomLargeOn";}function bZ(){bK.detachEvent("onclick",kN);bW.detachEvent("onclick",kH);w.removeChild(bK);w.removeChild(bW);bK=null;bW=null;w.parentNode.removeChild(w);w=null;}function cC(){if(j.GetZoomLevel()==1){bK.className="obliqueZoomSmallOn";bW.className="obliqueZoomLargeOff";}else{bK.className="obliqueZoomSmallOff";bW.className="obliqueZoomLargeOn";}}this.Destroy=bZ;this.Show=aN;this.Hide=as;this.UpdateFromMap=cC;}function fV(F,ny,ar){var i=document.createElement("div");i.setAttribute("id",F);i.innerHTML=ny;var fN="obliqueCompassPointOff";var jp=ar;i.onmouseover=eO;i.onmouseout=gy;i.onclick=gO;this.onclick=null;this.onmouseover=null;this.onmouseout=null;var ed=this;var eV=false;var lR=new nM(i,17,17);function eO(b){if(eV){return;}fN=i.className;i.className="obliqueCompassPointHover";if(ed.onmouseover){ed.onmouseover(b);}}function gO(b){if(eV){return;}eO(b);fN="obliqueCompassPointOn";if(ed.onclick){ed.onclick(b);}}function gy(b){if(eV){return;}i.className=fN;if(ed.onmouseout){ed.onmouseout(b);}}function lX(){fN="obliqueCompassPointOn";i.className="obliqueCompassPointOn";}function jr(){fN="obliqueCompassPointOff";i.className="obliqueCompassPointOff";}function pQ(){eV=true;jr();}function lU(){eV=false;lX();}function ox(){return i;}function no(){return jp;}function oN(ar){jp=ar;}function ip(){lR.Reset();lU();}function pr(lY){i.style.left=lY.left;i.style.top=lY.top;}function nM(bJ,qk,qu){var i=bJ;var bX=0;var hh=0.3;var jd=0;var oZ=40;var ms=25;var ha=false;var mT=Math.PI/2;var jY=true;var hi=hh+0.1;function qC(hi,kC,kD){if(kC>=kD-hi&&kC<=kD+hi){return true;}return false;}function lb(){bX+=hh;if(bX>Math.PI*2)bX-=Math.PI*2;else if(bX<0){bX+=Math.PI*2}if(qC(hi,bX,jd)){hh=0.3;bX=jd;lj(bX);ha=false;return;}lj(bX);window.setTimeout(lb,oZ);}function lj(dD){var d=qk+(ms*Math.sin(dD));var f=qu+(ms*Math.cos(dD));i.style.left=d+"px";i.style.top=f+"px";}function mE(dD){if(ha)return;ha=true;jd=dD;lb();}function mW(hs,of){jY=of;if(!jY){hh*=-1;}mE(mT*hs);}function ip(){ha=false;bX=0;}this.RotateTo=mE;this.RotateToIndex=mW;this.Reset=ip;}function bZ(){i.parentNode.removeChild(i);i.onmouseover=null;i.onmouseout=null;i.onclick=null;i=null;}this.GetElement=ox;this.GetCurrentPositionIndex=no;this.SetCurrentPositionIndex=oN;this.SetCurrentPosition=pr;this.On=lX;this.Off=jr;this.RotateToIndex=lR.RotateToIndex;this.Reset=ip;this.Disable=pQ;this.Enable=lU;this.Destroy=bZ;}function pi(w){var gc=new Array();gc.push({"top":"-8px","left":"17px"});gc.push({"top":"17px","left":"42px"});gc.push({"top":"42px","left":"17px"});gc.push({"top":"17px","left":"-8px"});var bj=document.createElement("div");bj.setAttribute("id","obliqueCompassContainer");bj.title="Select the direction you want to look toward.";var aD=new fV("obliqueCompassPointN","N",0);aD.onclick=oD;aD.onmouseover=pL;aD.onmouseout=eZ;var aF=new fV("obliqueCompassPointE","E",1);aF.onclick=qW;aF.onmouseover=ne;aF.onmouseout=eZ;var aG=new fV("obliqueCompassPointS","S",2);aG.onclick=on;aG.onmouseover=oe;aG.onmouseout=eZ;var aH=new fV("obliqueCompassPointW","W",3);aH.onclick=qK;aH.onmouseover=pB;aH.onmouseout=eZ;var fe=document.createElement("div");bj.appendChild(aD.GetElement());bj.appendChild(aF.GetElement());bj.appendChild(aG.GetElement());bj.appendChild(aH.GetElement());bj.appendChild(fe);w.appendChild(bj);cC();function gY(ar){if(ar<0){ar=4-Math.abs(ar);}return ar;}function cP(oy){var ar=oy.GetCurrentPositionIndex();aF.SetCurrentPositionIndex(gY(aF.GetCurrentPositionIndex()-ar));aH.SetCurrentPositionIndex(gY(aH.GetCurrentPositionIndex()-ar));aD.SetCurrentPositionIndex(gY(aD.GetCurrentPositionIndex()-ar));aG.SetCurrentPositionIndex(gY(aG.GetCurrentPositionIndex()-ar));var fk=true;if(ar==3){fk=false;}aD.RotateToIndex(2-aD.GetCurrentPositionIndex()<0?aD.GetCurrentPositionIndex():2-aD.GetCurrentPositionIndex(),fk);aF.RotateToIndex(2-aF.GetCurrentPositionIndex()<0?aF.GetCurrentPositionIndex():2-aF.GetCurrentPositionIndex(),fk);aG.RotateToIndex(2-aG.GetCurrentPositionIndex()<0?aG.GetCurrentPositionIndex():2-aG.GetCurrentPositionIndex(),fk);aH.RotateToIndex(2-aH.GetCurrentPositionIndex()<0?aH.GetCurrentPositionIndex():2-aH.GetCurrentPositionIndex(),fk);}function cp(hs){switch(hs){case 0:eZ();break;case 1:nX();break;case 2:oL();break;case 3:nq();break;}}function eZ(){fe.className="obliqueCompassArrowU";}function oL(){fe.className="obliqueCompassArrowD";}function nX(){fe.className="obliqueCompassArrowR";}function nq(){fe.className="obliqueCompassArrowL";}function on(b){cP(aG);cp(0);var g=j.GetObliqueScene();if(g){var dn=g.GetRotation("South");if(dn){j.SetObliqueOrientation("South");}}}function oD(b){cP(aD);cp(0);var g=j.GetObliqueScene();if(g){var dn=g.GetRotation("North");if(dn){j.SetObliqueOrientation("North");}}}function qW(b){cP(aF);cp(0);var g=j.GetObliqueScene();if(g){var dn=g.GetRotation("East");if(dn){j.SetObliqueOrientation("East");}}}function qK(b){cP(aH);cp(0);var g=j.GetObliqueScene();if(g){var dn=g.GetRotation("West");if(dn){j.SetObliqueOrientation("West");}}}function oe(b){cp(aG.GetCurrentPositionIndex());}function ne(b){cp(aF.GetCurrentPositionIndex());}function pB(b){cp(aH.GetCurrentPositionIndex());}function pL(b){cp(aD.GetCurrentPositionIndex());}function as(){bj.style.display="none";}function aN(){bj.style.display="block";}function cC(){var g=j.GetObliqueScene();if(!g){return;}switch(g.GetOrientation()){case"North":cP(aD);break;case"South":cP(aG);break;case"East":cP(aF);break;case"West":cP(aH);break;}cp(0);if(g.GetRotation("North")){aD.Enable();}else{aD.Disable();}if(g.GetRotation("South")){aG.Enable();}else{aG.Disable();}if(g.GetRotation("East")){aF.Enable();}else{aF.Disable();}if(g.GetRotation("West")){aH.Enable();}else{aH.Disable();}}function bZ(){aD.Destroy();aF.Destroy();aG.Destroy();aH.Destroy();bj.parentNode.removeChild(bj);bj=null;}this.Hide=as;this.Show=aN;this.UpdateFromMap=cC;}};
Msn.VE.DashboardSize=new function(){this.Normal="normal";this.Small="small";this.Tiny="tiny";};
Msn.VE.LatLong=function(A,L){this.latitude=A;this.longitude=L;this.ToString=function(){return"("+this.latitude+", "+this.longitude+")";};this.Copy=function(o){if(!o){return;}this.latitude=o.latitude;this.longitude=o.longitude;};};
Msn.VE.LatLongRectangle=function(iz,hr){this.northwest=iz;this.southeast=hr;this.ToString=function(){return"("+(this.northwest?this.northwest.ToString():"null")+", "+(this.southeast?this.southeast.ToString():"null")+")";};this.Copy=function(bA){if(!bA){return;}if(!this.northwest){this.northwest=new Msn.VE.LatLong();}if(!this.southeast){this.southeast=new Msn.VE.LatLong();}this.northwest.Copy(bA.northwest);this.southeast.Copy(bA.southeast);};this.Center=function(){var eU=Math.sin(this.northwest.latitude*Math.PI/180.0);var eK=Math.sin(this.southeast.latitude*Math.PI/180.0);var rf=0.25*(Math.log((1.0+eU)/(1.0-eU))+Math.log((1.0+eK)/(1.0-eK)));var bU=new Msn.VE.LatLong();bU.latitude=Math.atan(Math.exp(rf))*360.0/Math.PI-90.0;bU.longitude=0.5*(this.northwest.longitude+this.southeast.longitude);return bU;};this.Contains=function(o){return o.latitude<=iz.latitude&&o.longitude>=iz.longitude&&o.latitude>=hr.latitude&&o.longitude<=hr.longitude;};};
Msn.VE.MapStyle=new function(){this.Road="r";this.Aerial="a";this.Hybrid="h";this.Oblique="o";};
Msn.VE.MapView=function(){this.zoomLevel=0;this.mapStyle=null;this.center=new Msn.VE.Pixel();this.latlong=new Msn.VE.LatLong();this.pixelRect=new Msn.VE.PixelRectangle();this.latlongRect=new Msn.VE.LatLongRectangle();this.sceneId=null;this.sceneOrientation=null;var h=this;var bE="pixel";this.Destroy=function(){this.center=this.latlong=h=null;};this.GetViewType=function(){return bE;};function qM(){var ky=new Msn.VE.MapView();ky.Copy(h);return ky;}function np(e){h.zoomLevel=e.zoomLevel;h.mapStyle=e.mapStyle;h.center.Copy(e.center);h.latlong.Copy(e.latlong);h.pixelRect.Copy(e.pixelRect);h.latlongRect.Copy(e.latlongRect);h.sceneId=e.sceneId;h.sceneOrientation=e.sceneOrientation;bE=e.GetViewType();}function mU(e){return e!=null&&h.zoomLevel==e.zoomLevel&&h.mapStyle==e.mapStyle&&aZ(h.center.x-e.center.x)<0.000001&&aZ(h.center.y-e.center.y)<0.000001&&h.sceneId==e.sceneId&&h.sceneOrientation==e.sceneOrientation;}function iQ(){return"("+h.latlong.ToString()+", "+h.zoomLevel+", "+h.mapStyle+")";}function hn(l){if(!l){return;}h.center=l;bE="pixel";}function qy(o){if(!o){return;}h.latlong=o;bE="latlong";}function pG(mS){h.pixelRect=mS;bE="pixelRect";}function rd(nx){h.latlongRect=nx;bE="latlongRect";}function kt(m){if(m<=0){return;}switch(bE){case"pixel":var ab=Math.pow(2,m-h.zoomLevel);h.center.x*=ab;h.center.y*=ab;break;case"pixelRect":var ab=Math.pow(2,m-h.zoomLevel);h.pixelRect.topLeft.x*=ab;h.pixelRect.topLeft.y*=ab;h.pixelRect.bottomRight.x*=ab;h.pixelRect.bottomRight.y*=ab;break;}h.zoomLevel=m;}function cc(Z,bS,il){h.mapStyle=Z;if(bE=="pixel"){bE="latlong";}if(Z!='o'){h.sceneId=null;h.sceneOrientation=null}else{h.sceneId=bS;h.sceneOrientation=il;}}function hK(m){if(m){return h.center.x*Math.pow(2,m-h.zoomLevel);}return h.center.x;}function hJ(m){if(m){return h.center.y*Math.pow(2,m-h.zoomLevel);}return h.center.y;}function oX(m){if(m==undefined){return h.center;}return new Msn.VE.Pixel(h.GetX(m),h.GetY(m));}function rg(bd,q,p){switch(bE){case"pixel":h.latlong=bd.PixelToLatLong(h.center,h.zoomLevel);break;case"latlong":h.center=bd.LatLongToPixel(h.latlong,h.zoomLevel);break;case"pixelRect":hR(bd,q,p);break;case"latlongRect":if(h.mapStyle=="o"){h.zoomLevel=1;var g=bd.GetScene();if(!g.ContainsLatLong(h.latlongRect.northwest)||!g.ContainsLatLong(h.latlongRect.southeast)){h.latlong=h.latlongRect.Center();h.center=bd.LatLongToPixel(h.latlong,h.zoomLevel);}else{h.pixelRect.topLeft=bd.LatLongToPixel(h.latlongRect.northwest,h.zoomLevel);h.pixelRect.bottomRight=bd.LatLongToPixel(h.latlongRect.southeast,h.zoomLevel);hR(bd,q,p);}}else{h.zoomLevel=12;h.pixelRect.topLeft=bd.LatLongToPixel(h.latlongRect.northwest,h.zoomLevel);h.pixelRect.bottomRight=bd.LatLongToPixel(h.latlongRect.southeast,h.zoomLevel);hR(bd,q,p);}break;}bE="pixel";}function hR(bd,q,p){var hS=19;var U=Math.pow(2,hS-h.zoomLevel);var pf=dJ(1,aZ(h.pixelRect.topLeft.x-h.pixelRect.bottomRight.x)*U);var qU=dJ(1,aZ(h.pixelRect.topLeft.y-h.pixelRect.bottomRight.y)*U);var lZ=Math.log(2);var qg=hS-Math.ceil(Math.log(pf/q)/lZ);var pv=hS-Math.ceil(Math.log(qU/p)/lZ);var bf=dX(qg,pv);U=Math.pow(2,bf-h.zoomLevel);h.center.x=0.5*(h.pixelRect.topLeft.x+h.pixelRect.bottomRight.x)*U;h.center.y=0.5*(h.pixelRect.topLeft.y+h.pixelRect.bottomRight.y)*U;h.zoomLevel=bf;h.latlong=bd.PixelToLatLong(h.center,h.zoomLevel);}this.MakeCopy=qM;this.Copy=np;this.Equals=mU;this.ToString=iQ;this.SetCenter=hn;this.SetCenterLatLong=qy;this.SetPixelRectangle=pG;this.SetLatLongRectangle=rd;this.SetZoomLevel=kt;this.SetMapStyle=cc;this.GetX=hK;this.GetY=hJ;this.GetCenter=oX;this.Resolve=rg;this.SetZoomLevel=kt;};
Msn.VE.ObliqueScene=function(F,bF,pZ,ea,nP,nQ,eg,gJ,pW,pU,oo,oI){var M=256;var t=new Msn.VE.Bounds(1,2,0,0,eg/2,gJ/2);function du(l,m){var U=Math.pow(2,m-2);var iI=[[l.x/U],[l.y/U],[1]];var aU=lS(pW,iI);var o=new Msn.VE.LatLong();o.longitude=aU[0][0]/aU[2][0];o.latitude=aU[1][0]/aU[2][0];return o;}function cQ(o,m){var U=Math.pow(2,m-2);var iI=[[o.longitude],[o.latitude],[1]];var aU=lS(pU,iI);var l=new Msn.VE.Pixel();l.x=aU[0][0]/aU[2][0]*U;l.y=aU[1][0]/aU[2][0]*U;return l;}function fy(W,ac,m){if(W<0||ac<0){return false;}if(m==1){return W<(eg/2)&&ac<(gJ/2);}return W<eg&&ac<gJ;}function pO(){return F;}function qc(W,ac,m){var pC=ac*(m==1?eg/2:eg)+W;return"http://c"+(W%2)+".p"+nQ+".oblique.tiles.virtualearth.net/tiles/o"+bF+"-"+pZ+"-"+(nP+m-2)+"-"+pC+".jpeg?g=14";}function qE(){return"http://thumbs.oblique.tiles.virtualearth.net/tiles/ot"+F+".jpeg?g=14";}function rb(a){var bS=oo[a];if(bS==null||bS==-1){return null;}return new Msn.VE.ObliqueScene(bS);}function nF(a){var bS=oI[a];if(bS==null||bS==-1){return null;}return new Msn.VE.ObliqueScene(bS);}function pl(){return ea;}function dj(){return t;}function li(){return eg*M;}function gm(){return gJ*M;}function pV(o){if(!o){return false;}var l=cQ(o,2);return kd(l,2);}function kd(l,m){var U=Math.pow(2,2-m);var d=l.x*U;var f=l.y*U;return d>=0&&f>=0&&d<li()&&f<gm();}this.PixelToLatLong=du;this.LatLongToPixel=cQ;this.IsValidTile=fy;this.GetID=pO;this.GetTileFilename=qc;this.GetThumbnailFilename=qE;this.GetNeighbor=rb;this.GetRotation=nF;this.GetOrientation=pl;this.GetBounds=dj;this.GetWidth=li;this.GetHeight=gm;this.ContainsLatLong=pV;this.ContainsPixel=kd;};
Msn.VE.Orientation=new function(){this.North="North";this.East="East";this.West="West";this.South="South";};
Msn.VE.Pixel=function(d,f){this.x=d;this.y=f;this.ToString=function(){return"("+this.x+", "+this.y+")";};this.Copy=function(l){if(!l){return;}this.x=l.x;this.y=l.y;};};
Msn.VE.PixelRectangle=function(rh,pD){this.topLeft=rh;this.bottomRight=pD;this.ToString=function(){return"("+(this.topLeft?this.topLeft.ToString():"null")+", "+(this.bottomRight?this.bottomRight.ToString():"null")+")";};this.Copy=function(bA){if(!bA){return;}if(!this.topLeft){this.topLeft=new Msn.VE.Pixel();}if(!this.bottomRight){this.bottomRight=new Msn.VE.Pixel();}this.topLeft.Copy(bA.topLeft);this.bottomRight.Copy(bA.bottomRight);};};
Msn.VE.LineRegion=function(od,cH,nB){this.boundingRectangle=od;this.indices=cH;this.childRegions=nB;function iQ(){return"Bounding Rectangle: "+this.boundingRectangle[0].ToString()+" to "+this.boundingRectangle[1].ToString()+" | Indices: ["+cH+"]";};this.ToString=iQ;}
Type.createEnum('Sys.UI.MapStyle', 'Road', 0, 'Aerial', 1, 'Hybrid', 2);
Type.createEnum('Sys.UI.ActivationType', 'None', 0, 'Hover', 1, 'Click', 2);
Sys.UI.VirtualEarthMap = function(associatedElement) {
    Sys.UI.VirtualEarthMap.initializeBase(this, [associatedElement]);
    
    var _map;
    var _pushpinActivation = Sys.UI.ActivationType.None;
    var _popupPositioningMode = Sys.UI.PositioningMode.BottomLeft;
    var _pushpins;
    var _data;
    var _latitude;
    var _longitude;
    var _zoomLevel = 0;
    var _mapStyle = Sys.UI.MapStyle.Road;
    var _width;
    var _height;
    var _pushpinImageURL;
    var _pushpinImageWidth = 0;
    var _pushpinImageHeight = 0;
    var _pushpinCssClass;
    var _popupCssClass;
    var _dataValueField;
    var _dataLatitudeField;
    var _dataLongitudeField;
    var _dataImageURLField;
    var _dataImageURLFormatString = "{0}";
    var _dataImageWidthField;
    var _dataImageHeightField;
    var _dataTextField;
    var _dataTextFormatString = "{0}";
    var _dataChangedDelegate;
    var _popupTemplate;
    var _queuedPushpinID;
    var _activatePushpinHandler;
    var _endContinuousPanHandler;
    
    this.endContinuousPan = this.createEvent();
    
    this.get_popupPositioningMode = function() {
        return _popupPositioningMode;
    }
    
    this.set_popupPositioningMode = function(value) {
        _popupPositioningMode = value;
    }
    
    this.get_pushpinActivation = function() {
        return _pushpinActivation;
    }
    
    this.set_pushpinActivation = function(value) {
        _pushpinActivation = value;
    }
    
    this.get_pushpins = function() {
        if (_pushpins == null) {
            _pushpins = Sys.Component.createCollection(this);
        }
        return _pushpins;
    }
    
    this.get_data = function() {
        return _data;
    }
    
    this.set_data = function(value) {
        if (_data && Sys.INotifyCollectionChanged.isImplementedBy(_data)) {
            _data.collectionChanged.remove(_dataChangedDelegate);
        }
        _data = value;
        if (_data) {
            if (!Sys.Data.DataTable.isInstanceOfType(_data)) {
                _data = new Sys.Data.DataTable([], _data);
            }
            _data.collectionChanged.add(_dataChangedDelegate);
        }
        this.render();
        this.raisePropertyChanged('data');
    }
    
    this.get_popupTemplate = function() {
        return _popupTemplate;
    }
    
    this.set_popupTemplate = function(template) {
        _popupTemplate = template;
        this.render();
        this.raisePropertyChanged('popupTemplate');
    }
    
    this.get_latitude = function() {
        if (_map) {
            return _map.GetCenterLatitude();
        }
        return _latitude;
    }
    
    this.set_latitude = function(value) {
        if (_map) {
            _map.SetCenter(value, this.get_longitude());
        }
        else {
            _latitude = value;
        }
    }
    
    this.get_longitude = function() {
        if (_map) {
            return _map.GetCenterLongitude();
        }
        return _longitude;
    }
    
    this.set_longitude = function(value) {
        if (_map) {
            _map.SetCenter(this.get_latitude(), value);
        }
        else {
            _longitude = value;
        }
    }
    
    this.get_zoomLevel = function() {
        if (_map) {
            return _map.GetZoomLevel();
        }
        return _zoomLevel;
    }
    
    this.set_zoomLevel = function(value) {
        if (_map) {
            _map.SetZoom(value);
        }
        else {
            _zoomLevel = value;
        }
    }
    
    this.get_width = function() {
        if (_map) {
            return _map.width;
        }
        return _width;
    }
    
    this.set_width = function(value) {
        if (_map) {
            _map.Resize(value, this.get_height());
        }
        else {
            _width = value;
        }
    }
    
    this.get_height = function() {
        if (_map) {
            return _map.height;
        }
        return _height;
    }
    
    this.set_height = function(value) {
        if (_map) {
            _map.Resize(this.get_width(), value);
        }
        else {
            _height = value;
        }
    }
    
    this.get_mapStyle = function() {
        if (_map) {
            var value = _map.GetMapStyle();
            switch (value) {
                case "a":
                    return Sys.UI.MapStyle.Aerial;
                case "h":
                    return Sys.UI.MapStyle.Hybrid;
                default:
                    return Sys.UI.MapStyle.Road;
            }
        }
        return _mapStyle;
    }
    
    this.set_mapStyle = function(value) {
        if (_map) {
            value = this._parseMapStyle(value);
            _map.SetMapStyle(value);
        }
        else {
            _mapStyle = value;
        }
    }
    
    this.get_pushpinImageURL = function() {
        return _pushpinImageURL;
    }
    
    this.set_pushpinImageURL = function(value) {
        _pushpinImageURL = value;
    }
    
    this.get_pushpinImageWidth = function() {
        return _pushpinImageWidth;
    }
    
    this.set_pushpinImageWidth = function(value) {
        _pushpinImageWidth = value;
    }
    
    this.get_pushpinImageHeight = function() {
        return _pushpinImageHeight;
    }
    
    this.set_pushpinImageHeight = function(value) {
        _pushpinImageHeight = value;
    }
    
    this.get_pushpinCssClass = function() {
        return _pushpinCssClass;
    }
    
    this.set_pushpinCssClass = function(value) {
        _pushpinCssClass = value;
    }
    
    this.get_popupCssClass = function() {
        return _popupCssClass;
    }
    
    this.set_popupCssClass = function(value) {
        _popupCssClass = value;
    }
    
    this.get_dataValueField = function() {
        return _dataValueField;
    }
    
    this.set_dataValueField = function(value) {
        _dataValueField = value;
    }
    
    this.get_dataLatitudeField = function() {
        return _dataLatitudeField;
    }
    
    this.set_dataLatitudeField = function(value) {
        _dataLatitudeField = value;
    }
    
    this.get_dataLongitudeField = function() {
        return _dataLongitudeField;
    }
    
    this.set_dataLongitudeField = function(value) {
        _dataLongitudeField = value;
    }
    
    this.get_dataImageURLField = function() {
        return _dataImageURLField;
    }
    
    this.set_dataImageURLField = function(value) {
        _dataImageURLField = value;
    }
    
    this.get_dataImageURLFormatString = function() {
        return _dataImageURLFormatString;
    }
    
    this.set_dataImageURLFormatString = function(value) {
        _dataImageURLFormatString = value;
    }
    
    this.get_dataImageWidthField = function() {
        return _dataImageWidthField;
    }
    
    this.set_dataImageWidthField = function(value) {
        _dataImageWidthField = value;
    }
    
    this.get_dataImageHeightField = function() {
        return _dataImageHeightField;
    }
    
    this.set_dataImageHeightField = function(value) {
        _dataImageHeightField = value;
    }
    
    this.get_dataTextField = function() {
        return _dataTextField;
    }
    
    this.set_dataTextField = function(value) {
        _dataTextField = value;
    }
    
    this.get_dataTextFormatString = function() {
        return _dataTextFormatString;
    }
    
    this.set_dataTextFormatString = function(value) {
        _dataTextFormatString = value;
    }
    
    this.initialize = function() {
        Sys.UI.VirtualEarthMap.callBaseMethod(this, 'initialize');
        if (_popupTemplate) {
            _popupTemplate.initialize();
        }
        if (_pushpins) {
            this._ensureMap();
            for (var i = 0; i < _pushpins.length; i++) {
                this._addPushpin(_pushpins[i]);
            }
        }
        this.render();
    }

    this.dispose = function() {
        if (_popupTemplate) {
            _popupTemplate.dispose();
            _popupTemplate = null;
        }
        
        if (_pushpins) {
            _pushpins.dispose();
            _pushpins = null;
        }
        if (_map) {
            _map.onEndContinuousPan = null;
            _map.ClearPushpins();
            _map = null;
        }
        Sys.UI.VirtualEarthMap.callBaseMethod(this, 'dispose');
    }
    
    this.getDescriptor = function() {
        var td = Sys.UI.VirtualEarthMap.callBaseMethod(this, 'getDescriptor');
        td.addProperty('popupPositioningMode', Sys.UI.PositioningMode);
        td.addProperty('pushpinActivation', Sys.UI.ActivationType);
        td.addProperty('pushpins', Array, true);
        td.addProperty('data', Object);
        td.addProperty('popupTemplate', Sys.UI.ITemplate);
        td.addProperty('pushpinImageURL', String);
        td.addProperty('pushpinImageWidth', Number);
        td.addProperty('pushpinImageHeight', Number);
        td.addProperty('pushpinCssClass', String);
        td.addProperty('popupCssClass', String);
        td.addProperty('dataValueField', String);
        td.addProperty('dataLatitudeField', String);
        td.addProperty('dataLongitudeField', String);
        td.addProperty('dataImageURLField', String);
        td.addProperty('dataImageURLFormatString', String);
        td.addProperty('dataImageWidthField', Number);
        td.addProperty('dataImageHeightField', Number);
        td.addProperty('dataTextField', String);
        td.addProperty('dataTextFormatString', String);
        td.addProperty('latitude', Number);
        td.addProperty('longitude', Number);
        td.addProperty('width', Number);
        td.addProperty('height', Number);
        td.addProperty('zoomLevel', Number);
        td.addProperty('mapStyle', Sys.UI.MapStyle);
        td.addMethod('activatePushpin',
            [
                Sys.TypeDescriptor.createParameter('id', String)
            ]);
        td.addMethod('panBy',
            [
                Sys.TypeDescriptor.createParameter('deltaX', Number),
                Sys.TypeDescriptor.createParameter('deltaY', Number)
            ]);
        td.addMethod('panTo',
            [
                Sys.TypeDescriptor.createParameter('latitude', Number),
                Sys.TypeDescriptor.createParameter('longitude', Number)
            ]);
        td.addMethod('continuousPanBy',
            [
                Sys.TypeDescriptor.createParameter('deltaX', Number),
                Sys.TypeDescriptor.createParameter('deltaY', Number),
                Sys.TypeDescriptor.createParameter('count', Number)
            ]);
        td.addMethod('stopContinuousPanBy');
        td.addMethod('setViewport',
            [
                Sys.TypeDescriptor.createParameter('lat1', Number),
                Sys.TypeDescriptor.createParameter('lon1', Number),
                Sys.TypeDescriptor.createParameter('lat2', Number),
                Sys.TypeDescriptor.createParameter('lon2', Number)
            ]);
        td.addMethod('setBestMapView',
            [
                Sys.TypeDescriptor.createParameter('locations', Array)
            ]);
        td.addMethod('includePointInViewport',
            [
                Sys.TypeDescriptor.createParameter('latitude', Number),
                Sys.TypeDescriptor.createParameter('longitude', Number)
            ]);
        td.addMethod('zoomIn');
        td.addMethod('zoomOut');
        return td;
    }
    
    function onDataChanged(sender, args) {
        this.render();
    }
    _dataChangedDelegate = Function.createDelegate(this, onDataChanged);
    
    this.activatePushpin = function(id) {
        if (!_pushpins) {
            return;
        }
        
        var pp;
        for (var i = 0; i < _pushpins.length; i++) {
            if (_pushpins[i].value == id) {
                pp = _pushpins[i];
            }
            else {
                _pushpins[i]._popup.hide();
            }
        }
        
        if (pp) {
                        if (_pushpinActivation != Sys.UI.ActivationType.None) {
                _queuedPushpinID = pp.value;
            }
            
                        this.panTo(pp.latitude, pp.longitude);
        }
    }
    
    function activatePushpinHandler() {
        if (_queuedPushpinID) {
            for (var i = 0; i < _pushpins.length; i++) {
                if (_pushpins[i].value == _queuedPushpinID) {
                    _pushpins[i]._popup.show();
                }
                else {
                    _pushpins[i]._popup.hide();
                }
            }
            
            _queuedPushpinID = null;
        }
    }
    
    this.panBy = function(deltaX, deltaY) {
        _map.PanMap(deltaX, deltaY);
    }
    
    this.panTo = function(latitude, longitude) {
        _map.PanToLatLong(latitude, longitude);
    }
    
    this.continuousPanBy = function(deltaX, deltaY, count) {
        _map.ContinuousPan(deltaX, deltaY, count);
    }
    
    this.stopContinuousPanBy = function() {
        _map.StopContinuousPan();
    }
    
    this.setViewport = function(lat1, lon1, lat2, lon2) {
        _map.SetViewport(lat1, lon1, lat2, lon2);
    }
    
    this.setBestMapView = function(locations) {
        _map.SetBestMapView(locations);
    }
    
    this.includePointInViewport = function(latitude, longitude) {
        _map.IncludePointInViewport(latitude, longitude);
    }
    
    this.zoomIn = function() {
        _map.ZoomIn();
    }
    
    this.zoomOut = function() {
        _map.ZoomOut();
    }
    
    this._ensureMap = function() {
        if (!_map) {
            if (!_width) {
                if (this.element.offsetWidth > 0) {
                     _width = this.element.offsetWidth;
                } else {
                     _width = 400;
                }
            }
            if (!_height) {
                if (this.element.offsetHeight > 0) {
                     _height = this.element.offsetHeight;
                } else {
                     _height = 400;
                }
            }
            var params = new Object();
            params.latitude = _latitude;
            params.longitude = _longitude;
            params.zoomlevel = _zoomLevel;
            params.mapstyle = this._parseMapStyle(_mapStyle);
            params.showScaleBar = true;
            params.showDashboard = false;
            _map = new Msn.VE.MapControl(this.element, params);
            _map.Init();
                        _endContinuousPanHandler = Function.createDelegate(this, endContinuousPanHandler);
            _map.AttachEvent("onendcontinouspan", _endContinuousPanHandler);
            _activatePushpinHandler = Function.createDelegate(this, activatePushpinHandler);
            this.endContinuousPan.add(_activatePushpinHandler);
        }
    }
    
    function endContinuousPanHandler() {
        this.endContinuousPan.invoke(this, Sys.EventArgs.Empty);
    }
    
    this.render = function() {
        if (!this.get_isInitialized()) {
            return;
        }
        
        this._ensureMap();
        
        var i, element;
        if (_pushpins) {
            for (i = _pushpins.length - 1; i >= 0; i--) {
                element = _pushpins[i]._popupTemplate;
                if (_pushpins[i]._isDataItem && element) {
                    Sys.UI.ITemplate.disposeInstance(element);
                    _map.RemovePushpin(_pushpins[i].get_value());
                    _pushpins.removeAt(i);
                }
            }
        }
        
        var pushpins = this.get_pushpins();
        
        var items = this.get_data();
        var itemLength = items ? items.get_length() : 0;
        if (itemLength > 0) {
            for (i = 0; i < itemLength; i++) {
                var item = items.getItem(i);
                
                                var pushpin = this._createPushpin(item.get_rowObject());
                pushpin._isDataItem = true;
                this._addPushpin(pushpin, item);
                pushpins.add(pushpin);
            }
        }
    }
    
    this._parseMapStyle = function(value) {
        switch (value) {
            case Sys.UI.MapStyle.Aerial:
                return "a";
            case Sys.UI.MapStyle.Hybrid:
                return "h";
            default:
                return "r";
        }
    }
    
    this._createActivationBehavior = function(popupBehavior) {
        var showHandler;
        var hideHandler = function() {
            popupBehavior.hide();
        }
        
        var behavior;
        if (_pushpinActivation == Sys.UI.ActivationType.Hover) {
            showHandler = function() {
                popupBehavior.show();
            }
            behavior = new Sys.UI.HoverBehavior();
                        behavior.set_unhoverDelay(500);
            behavior.set_hoverElement(popupBehavior.control.element);
            behavior.hover.add(showHandler);
            behavior.unhover.add(hideHandler);
        }
        else {
            showHandler = function() {
                if (popupBehavior.control.get_visible()) {
                    popupBehavior.hide();
                }
                else {
                    popupBehavior.show();
                }
            }
            behavior = new Sys.UI.ClickBehavior();
            behavior.click.add(showHandler);
        }
        return behavior;
    }
    
    this._addPushpin = function(pushpin, dataItem) {
                if (_map == null) {
            return;
        }
    
        var latitude = pushpin.get_latitude();
        if (!latitude) {
            latitude = this.get_latitude();
        }
        var longitude = pushpin.get_longitude();
        if (!longitude) {
            longitude = this.get_longitude();
        }
        var width = pushpin.get_imageWidth();
        if (!width) {
            width = _pushpinImageWidth;
        }
        var height = pushpin.get_imageHeight();
        if (!height) {
            height = _pushpinImageHeight;
        }
        if (!pushpin.get_imageURL()) {
            pushpin.set_imageURL(_pushpinImageURL);
        }
        
        var pushpinElement = _map.AddPushpin(pushpin.get_value(), latitude, longitude,
            width, height, _pushpinCssClass, pushpin.get_innerHtml(), 1000);
        
        var popupBehavior, popupContentElement;
        if (_pushpinActivation != Sys.UI.ActivationType.None) {
                        var popupElement = document.createElement("div");
            popupElement.className = _popupCssClass;
            this.element.appendChild(popupElement);
            var popupControl = new Sys.UI.Control(popupElement);
            popupBehavior = new Sys.UI.PopupBehavior();
            popupBehavior.set_parentElement(pushpinElement);
            popupBehavior.set_positioningMode(_popupPositioningMode);
            popupControl.get_behaviors().add(popupBehavior);
            popupBehavior.initialize();
            popupControl.initialize();
            popupContentElement = _popupTemplate.createInstance(popupElement, dataItem).instanceElement;
            
                        var pushpinControl = new Sys.UI.Control(pushpinElement);
            pushpinControl.initialize();
            
            var behavior = this._createActivationBehavior(popupBehavior);
            pushpinControl.get_behaviors().add(behavior);
            behavior.initialize();
        }
        
        pushpin._popup = popupBehavior;
        pushpin._popupTemplate = popupContentElement;
    }
    
    this._createPushpin = function(dataItem) {
        var innerHtml;
        var id;
        var imageURL;
        var imageWidth;
        var imageHeight;
        var text = "";
        if (_dataValueField) {
            id = dataItem[_dataValueField];
        }
        if (_dataImageURLField) {
            imageURL = String.format(_dataImageURLFormatString, dataItem[_dataImageURLField]);
        }
        if (!imageURL || imageURL.length == 0) {
            imageURL = _pushpinImageURL;
            imageWidth = _pushpinImageWidth;
            imageHeight = _pushpinImageHeight;
        }
        else {
            if (_dataImageWidthField) {
                imageWidth = dataItem[_dataImageWidthField];
            }
            if (_dataImageHeightField) {
                imageHeight = dataItem[_dataImageHeightField];
            }
        }
        if (_dataTextField) {
            text = String.format(_dataTextFormatString, dataItem[_dataTextField]);
        }
        
        var pushpin = new Sys.UI.Pushpin();
        pushpin.set_value(id);
        pushpin.set_imageURL(imageURL);
        pushpin.set_imageWidth(imageWidth);
        pushpin.set_imageHeight(imageHeight);
        pushpin.set_text(text);
        pushpin.set_latitude(dataItem[_dataLatitudeField]);
        pushpin.set_longitude(dataItem[_dataLongitudeField]);
        pushpin.initialize();
        return pushpin;
    }
}
Sys.UI.VirtualEarthMap.registerSealedClass('Sys.UI.VirtualEarthMap', Sys.UI.Control);
Sys.TypeDescriptor.addType('script', 'virtualEarthMap', Sys.UI.VirtualEarthMap);
Sys.UI.Pushpin = function() {
    Sys.UI.Pushpin.initializeBase(this, [true]);
    
    var _map;
    var _value;
    var _latitude;
    var _longitude;
    var _imageURL;
    var _imageWidth;
    var _imageHeight;
    var _text;
    
    this.get_value = function() {
        return _value;
    }
    
    this.set_value = function(value) {
        _value = value;
    }
    
    this.get_latitude = function() {
        return _latitude;
    }
    
    this.set_latitude = function(value) {
        _latitude = value;
    }
    
    this.get_longitude = function() {
        return _longitude;
    }
    
    this.set_longitude = function(value) {
        _longitude = value;
    }
    
    this.get_imageURL = function() {
        return _imageURL;
    }
    
    this.set_imageURL = function(value) {
        _imageURL = value;
    }
    
    this.get_imageWidth = function() {
        return _imageWidth;
    }
    
    this.set_imageWidth = function(value) {
        _imageWidth = value;
    }
    
    this.get_imageHeight = function() {
        return _imageHeight;
    }
    
    this.set_imageHeight = function(value) {
        _imageHeight = value;
    }
    
    this.get_text = function() {
        return _text;
    }
    
    this.set_text = function(value) {
        _text = value;
    }
    
    this.get_innerHtml = function() {
        if (_imageURL && _imageURL.length > 0) {
                                    return String.format("<img src=\"{0}\" alt=\"{1}\" title=\"{2}\" />", _imageURL, _text, _text);
        }
        else {
                        return _text;
        }
    }
    
    this.initialize = function() {
        Sys.UI.Pushpin.callBaseMethod(this, 'initialize');
        if (_map) {
            _map._addPushpin(this);
        }
    }
    
    this.getDescriptor = function() {
        var td = Sys.UI.Pushpin.callBaseMethod(this, 'getDescriptor');
        td.addProperty('value', String);
        td.addProperty('latitude', Number);
        td.addProperty('longitude', Number);
        td.addProperty('imageURL', String);
        td.addProperty('imageWidth', Number);
        td.addProperty('imageHeight', Number);
        td.addProperty('innerHtml', String, true);
        td.addProperty('text', String);
        return td;
    }
    
    this.setOwner = function(map) {
        _map = map;
    }
}
Sys.UI.Pushpin.registerSealedClass('Sys.UI.Pushpin', Sys.Component);
Sys.TypeDescriptor.addType('script', 'pushpin', Sys.UI.Pushpin);
