/** mtc-v2.1.2 MIT License By http://www.mtc.com */
 ;mtc.define(function(e){"use strict";var r={open:"{{",close:"}}"},n={exp:function(e){return new RegExp(e,"g")},query:function(e,n,t){var o=["#([\\s\\S])+?","([^{#}])*?"][e||0];return c((n||"")+r.open+o+r.close+(t||""))},escape:function(e){return String(e||"").replace(/&(?!#?[a-zA-Z0-9]+;)/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/'/g,"&#39;").replace(/"/g,"&quot;")},error:function(e,r){var n="Laytpl Error：";return"object"==typeof console&&console.error(n+e+"\n"+(r||"")),n+e}},c=n.exp,t=function(e){this.tpl=e};t.pt=t.prototype,window.errors=0,t.pt.parse=function(e,t){var o=this,p=e,a=c("^"+r.open+"#",""),l=c(r.close+"$","");e=e.replace(/\s+|\r|\t|\n/g," ").replace(c(r.open+"#"),r.open+"# ").replace(c(r.close+"}"),"} "+r.close).replace(/\\/g,"\\\\").replace(/(?="|')/g,"\\").replace(n.query(),function(e){return e=e.replace(a,"").replace(l,""),'";'+e.replace(/\\/g,"")+';view+="'}).replace(n.query(1),function(e){var n='"+(';return e.replace(/\s/g,"")===r.open+r.close?"":(e=e.replace(c(r.open+"|"+r.close),""),/^=/.test(e)&&(e=e.replace(/^=/,""),n='"+_escape_('),n+e.replace(/\\/g,"")+')+"')}),e='"use strict";var view = "'+e+'";return view;';try{return o.cache=e=new Function("d, _escape_",e),e(t,n.escape)}catch(u){return delete o.cache,n.error(u,p)}},t.pt.render=function(e,r){var c,t=this;return e?(c=t.cache?t.cache(e,n.escape):t.parse(t.tpl,e),r?void r(c):c):n.error("no data")};var o=function(e){return"string"!=typeof e?n.error("Template not found"):new t(e)};o.config=function(e){e=e||{};for(var n in e)r[n]=e[n]},o.v="1.2.0",e("laytpl",o)});