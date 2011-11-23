/**
 * jquery.purr.js
 * Copyright (c) 2008 Net Perspective (net-perspective.com)
 * Licensed under the MIT License (http://www.opensource.org/licenses/mit-license.php)
 *
 * @author R.A. Ray
 * @projectDescription  jQuery plugin for dynamically displaying unobtrusive messages in the browser. Mimics the behavior of the MacOS program "Growl."
 * @version 0.1.0
 *
 * @requires jquery.js (tested with 1.2.6)
 *
 * @param fadeInSpeed           int - Duration of fade in animation in miliseconds
 *                          default: 500
 *  @param fadeOutSpeed         int - Duration of fade out animationin miliseconds
                            default: 500
 *  @param removeTimer          int - Timeout, in miliseconds, before notice is removed once it is the top non-sticky notice in the list
                            default: 4000
 *  @param isSticky             bool - Whether the notice should fade out on its own or wait to be manually closed
                            default: false
 *  @param usingTransparentPNG  bool - Whether or not the notice is using transparent .png images in its styling
                            default: false
 */
(function(a){a.purr=function(b,c){function e(){var e=document.createElement("a");a(e).attr({className:"close",href:"#close"}).appendTo(b).click(function(){return f(),!1}),a(document).keyup(function(a){a.keyCode==27&&f()}),b.appendTo(d).hide(),jQuery.browser.msie&&c.usingTransparentPNG?b.show():b.fadeIn(c.fadeInSpeed);if(!c.isSticky)var g=setInterval(function(){b.prevAll(".purr").length==0&&(clearInterval(g),setTimeout(function(){f()},c.removeTimer))},200)}function f(){jQuery.browser.msie&&c.usingTransparentPNG?b.css({opacity:0}).animate({height:"0px"},{duration:c.fadeOutSpeed,complete:function(){b.remove()}}):b.animate({opacity:"0"},{duration:c.fadeOutSpeed,complete:function(){b.animate({height:"0px"},{duration:c.fadeOutSpeed,complete:function(){b.remove()}})}})}b=a(b),b.addClass("purr");var d=document.getElementById("purr-container");d||(d='<div id="purr-container"></div>'),d=a(d),a("body").append(d),e()},a.fn.purr=function(b){return b=b||{},b.fadeInSpeed=b.fadeInSpeed||500,b.fadeOutSpeed=b.fadeOutSpeed||500,b.removeTimer=b.removeTimer||4e3,b.isSticky=b.isSticky||!1,b.usingTransparentPNG=b.usingTransparentPNG||!1,this.each(function(){new a.purr(this,b)}),this}})(jQuery)