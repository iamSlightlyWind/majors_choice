!function () { "use strict"; var e, i, o, r, a = {}, n = { width: 768, height: 490, url: "#" }, d = { open: function (e) { n = $.extend({}, n, e), window.top.location.href = n.url } }; a.resize = function () { (void 0).css({ width: n.width - 14 || "auto", height: n.height - 14 || "auto" }), i.css({ width: n.width || "auto", height: n.height || "auto" }), o.css({ width: n.width - 14 || "auto", height: n.height - 14 || "auto" }) }, a.close = function () { i.hide(), e.hide(), o.empty(), $(window).unbind("resize.modal") }, a.center = function () { var e, o; e = Math.max($(window).height() - i.outerHeight(), 0) / 2, o = Math.max($(window).width() - i.outerWidth(), 0) / 2, i.width() < 768 && (o = Math.max($(window).width() - 768, 0) / 2), i.css({ top: e + $(window).scrollTop(), left: o + $(window).scrollLeft() }) }, d.browser = function (e) { void 0 === e && (e = window.navigator.userAgent), e = e.toLowerCase(); var i = /(edge)\/([\w.]+)/.exec(e) || /(opr)[\/]([\w.]+)/.exec(e) || /(chrome)[ \/]([\w.]+)/.exec(e) || /(iemobile)[\/]([\w.]+)/.exec(e) || /(version)(applewebkit)[ \/]([\w.]+).*(safari)[ \/]([\w.]+)/.exec(e) || /(webkit)[ \/]([\w.]+).*(version)[ \/]([\w.]+).*(safari)[ \/]([\w.]+)/.exec(e) || /(webkit)[ \/]([\w.]+)/.exec(e) || /(opera)(?:.*version|)[ \/]([\w.]+)/.exec(e) || /(msie) ([\w.]+)/.exec(e) || e.indexOf("trident") >= 0 && /(rv)(?::| )([\w.]+)/.exec(e) || e.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(e) || [], o = /(ipad)/.exec(e) || /(ipod)/.exec(e) || /(windows phone)/.exec(e) || /(iphone)/.exec(e) || /(kindle)/.exec(e) || /(silk)/.exec(e) || /(android)/.exec(e) || /(win)/.exec(e) || /(mac)/.exec(e) || /(linux)/.exec(e) || /(cros)/.exec(e) || /(playbook)/.exec(e) || /(bb)/.exec(e) || /(blackberry)/.exec(e) || [], r = {}, a = { browser: i[5] || i[3] || i[1] || "", version: i[2] || i[4] || "0", versionNumber: i[4] || i[2] || "0", platform: o[0] || "" }; if (a.browser && (r[a.browser] = !0, r.version = a.version, r.versionNumber = parseInt(a.versionNumber, 10)), a.platform && (r[a.platform] = !0), (r.android || r.bb || r.blackberry || r.ipad || r.iphone || r.ipod || r.kindle || r.playbook || r.silk || r["windows phone"]) && (r.mobile = !0), (r.cros || r.mac || r.linux || r.win) && (r.desktop = !0), (r.chrome || r.opr || r.safari) && (r.webkit = !0), r.rv || r.iemobile) { a.browser = "msie", r.msie = !0 } if (r.edge) { delete r.edge; a.browser = "msedge", r.msedge = !0 } if (r.safari && r.blackberry) { a.browser = "blackberry", r.blackberry = !0 } if (r.safari && r.playbook) { a.browser = "playbook", r.playbook = !0 } if (r.bb) { var n = "blackberry"; a.browser = n, r[n] = !0 } if (r.opr) { a.browser = "opera", r.opera = !0 } if (r.safari && r.android) { a.browser = "android", r.android = !0 } if (r.safari && r.kindle) { a.browser = "kindle", r.kindle = !0 } if (r.safari && r.silk) { a.browser = "silk", r.silk = !0 } return r.name = a.browser, r.platform = a.platform, r }, e = $('<div id="vnpay_overlay" class="vnpay_overlay"></div>'), i = $('<div id="vnpay_modal" class="vnpay_modal"></div>'), o = $('<div id="vnpay_content" class="vnpay_content"></div>'), r = $(' <a id="vnpay_close" href="#" class="vnpay_close">close</a> '), i.hide(), e.hide(), i.append(o, r), $(document).ready(function () { $("body").append(e, i) }), r.click(function (e) { e.preventDefault(), a.close() }), window.vnpay || (window.vnpay = d) }();