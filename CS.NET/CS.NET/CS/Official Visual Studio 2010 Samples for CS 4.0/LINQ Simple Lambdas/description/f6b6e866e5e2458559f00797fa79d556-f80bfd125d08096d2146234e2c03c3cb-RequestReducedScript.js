var Galleries=Galleries||{};(function(){function g(b,g,a){var d=b?b:document.body,f=d.getElementsByTagName(g),e=function(b){return a?b.className.indexOf(a)>-1:true};return c(f,e)}function c(b,d){for(var c=[],a=0;a<b.length;a++)d(b[a])&&c.push(b[a]);return c}function e(b,c){for(var a=0;a<b.length;a++)c(a,b[a])}function f(){b("longdescIframe","longDesc")}function b(e,d){var b=document.getElementById(e),c=b.contentDocument;if(c){var a=c.getElementById(d);if(a&&!h(a))if(b.offsetHeight!==a.offsetHeight)b.height=a.offsetHeight+20}}function h(a){return a.offsetHeight===0&&a.offsetWidth===0||a.style&&a.style.display==="none"}function d(b){a(null,"load",b)}function a(d,c,b){var a=d?d:window;if(document.addEventListener)a.addEventListener(c,b,false);else document.attachEvent&&a.attachEvent("on"+c,b)}Galleries.findElem=g;Galleries.iterateElem=e;Galleries.resizeDesc=f;Galleries.attachEventHandler=a;Galleries.onWindowLoad=d})()