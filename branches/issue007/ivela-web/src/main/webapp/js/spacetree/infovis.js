var Infovis={Accordion:{colorBackgroundSelected:"#78BA91",colorFontSelected:"#fff",colorBackground:"#7389AE",colorFont:"#fff",effects:{}},initLayout:function(){var j=Window.getSize();var e=$("header"),d=$("left"),h=$("infovis");var i=e.getSize().y,b=d.getSize().x;var a={height:Math.floor((j.y-i)/1),width:Math.floor((j.x-b)/1)};h.setProperties(a);h.setStyles(a);h.setStyles({position:"absolute",top:i+"px",left:b+"px"});d.setStyle("height",a.height);var c=new Array();var f=0;var g=this;$$("#left .left-item").each(function(k){g.Accordion.effects[k.innerHTML]=new Fx.Morph(k,{duration:300,Transition:Fx.Transitions.Quart.easeOut});f+=k.offsetHeight});$$("#left .small-title").each(function(k){f+=k.offsetHeight})},initAccordion:function(b){var c=this;var a=new Accordion("div.left-item","div.contained-item",{fixedHeight:b,onActive:function(f){var e=c.Accordion.effects[f.innerHTML];var d=c;e.start({color:d.Accordion.colorFontSelected,"background-color":d.Accordion.colorBackgroundSelected})},onBackground:function(f){var e=c.Accordion.effects[f.innerHTML];var d=c;e.start({color:d.Accordion.colorFont,"background-color":d.Accordion.colorBackground})}},$("left"))}};