(function (o) {
    if (!String.prototype.trim) String.prototype.trim = function () { return this.replace(/^\s+/, "").replace(/\s+$/, "") }; var b = b || {}; b.hash = {}; b.defineShapes = {}; b.init = function () { b.initRoot(); b.initDefs(); b.initShapes(); b.interval = Math.floor(1E3 / o.FrameRate) }; b.createTag = function (a) { return document.createElementNS("http://www.w3.org/2000/svg", a) }; b.initRoot = function () {
        var a = o.FrameRect; b.root = b.createTag("svg");
        b.root.setAttribute("viewBox", "0 0 312 417");
        b.root.setAttribute("preserveAspectRatio", "xMinYMin");

//        b.root.setAttribute("viewBox", "0 0 490 417");
//        b.root.setAttribute("preserveAspectRatio", "xMinYMin");
        b.scene = document.createElement("div"); b.scene.style.position = "relative"; b.scene.style.left = "0"; b.scene.style.top = "0"; b.scene.appendChild(b.root); document.body.appendChild(b.scene)
    }; b.initDefs = function () { var a = b.createTag("g"), c = b.createTag("defs"); a.appendChild(c); b.root.appendChild(a); b.defs = c }; b.initShapes = function () {
        for (var a = o.tags, c = 0, e = a.length; c < e; c++) {
            var d = a[c]; switch (d.type) {
                case 2: b.processShape(d); break;
                case 10: b.processFont(d); break; case 11: b.processText(d); break; case 39: b.processSprite(d); break; case 7: b.processButton(d)
            }b.hash[d.id] = d
        }
    }; b.processFont = function (a) {
        var c = b.createTag("font"); c.setAttribute("id", "ft" + a.id); c.setAttribute("horiz-adv-x", 1024); var e = b.createTag("font-face"); e.setAttribute("font-family", "ft" + a.id); e.setAttribute("line-height", "1.15"); e.setAttribute("units-per-em", a.unitsperem); e.setAttribute("font-weight", "bold"); c.appendChild(e); e = 0; for (var d = a.fonts.length; e < d; e++) {
            var g =
                a.fonts[e], f = b.createTag("glyph"); f.setAttribute("d", g.data); f.setAttribute("unicode", g.code); "advance" in g && f.setAttribute("horiz-adv-x", g.advance); c.appendChild(f)
        } b.defs.appendChild(c)
    }; b.processText = function (a) {
        var c = b.createTag("g"), e = b.createTag("defs"), d = b.createTag("g"); if ("records" in a) for (var g = 0; a.records[g]; g++) {
            var f = a.records[g]; if (a.texttype == "html") {
                var i = a.bound, l = document.createTextNode(f.text), h = document.createElement("span"); h.style.fontSize = f.fontsize + "px"; h.style.color = f.color;
                h.style.fontFamily = f.fontid; h.appendChild(l); if (g == 0) {
                    text_p = document.createElement("p"); text_div = document.createElement("div"); text_div.style.textAlign = "left"; text_body = document.createElement("body"); var k = b.createTag("foreignObject"); k.setAttribute("x", i.left); k.setAttribute("y", i.top); k.setAttribute("width", i.right - i.left); k.setAttribute("height", i.bottom - i.top); i = b.createTag("g"); i.setAttribute("transform", a.transform); i.setAttribute("translate", f.translate); i.appendChild(k); k.appendChild(text_body);
                    text_body.appendChild(text_div); text_div.appendChild(text_p); text_p.appendChild(h); d.appendChild(i)
                } else k.appendChild(h); k = h
            } else {
                h = b.createTag("text"); if (f.psd === !0) { i = ""; l = 0; for (var j = f.text.length; l < j; l++)i += "*"; f.text = i } l = document.createTextNode(f.text); h.appendChild(l); f.bold && h.setAttribute("font-weight", "bold"); h.setAttribute("font-size", f.height); f.fontid.toString().match(/\d/) ? h.setAttribute("font-family", "ft" + f.fontid) : h.setAttribute("font-family", f.fontid); h.setAttribute("fill", f.color);
                h.setAttribute("x", f.x); h.setAttribute("y", f.y); h.setAttribute("fill-rule", "nonzero"); h.setAttribute("style", "white-space:pre"); h.setAttribute("transform", a.transform); d.appendChild(h)
            }
        } c.appendChild(e); c.appendChild(d); c.setAttribute("type", "text"); b.defineShapes[a.id] = c
    }; b.processSprite = function (a) { var c = b.createTag("g"), e = b.createTag("defs"), d = b.createTag("g"); c.setAttribute("type", "sprite"); c.appendChild(e); c.appendChild(d); b.defineShapes[a.id] = c }; b.processButton = function (a) {
        var c = b.createTag("g"),
        e = b.createTag("defs"), d = b.createTag("g"); c.setAttribute("type", "button"); c.appendChild(e); c.appendChild(d); b.defineShapes[a.id] = c
    }; b.processShape = function () {
        var a = function (a, d, g) { if (document.getElementById(d)) return d; g = b.createTag(g); for (var c in a) typeof a[c] == "object" || c == "type" || g.setAttribute(c, a[c]); a = a.stop; c = 0; for (var i = a.length; c < i; c++) { var l = a[c], h = b.createTag("stop"), k; for (k in l) h.setAttribute(k, l[k]); g.appendChild(h) } g.setAttribute("id", d); b.defs.appendChild(g); return d }, c = function (a,
            d) { if (document.getElementById(d)) return d; var c = b.createTag("pattern"), f; for (f in a) typeof a[f] == "object" || f == "type" || c.setAttribute(f, a[f]); var i = b.createTag("image"); for (f in a.image) f == "xlink:href" ? i.setAttributeNS("http://www.w3.org/1999/xlink", "href", a.image[f]) : i.setAttribute(f, a.image[f]); c.appendChild(i); c.setAttribute("id", d); b.defs.appendChild(c); return d }; return function (e) {
                var d = b.createTag("g"), g = b.createTag("defs"), f = b.createTag("g"); d.appendChild(g); d.appendChild(f); if (g = e.paths) for (var i =
                    0, l = g.length; i < l; i++) {
                        var h = g[i], k = b.createTag("path"); k.setAttribute("d", h.data); if (typeof h.fill !== "undefined") { var j = e.FillStyles[h.fill], m = e.id, p = h.fill; if (j) { var q = k, n = m; m = j.type; if (m == 1) q.setAttribute("fill", j.color), q.setAttribute("fill-opacity", typeof j["fill-opacity"] == "undefined" ? 1 : j["fill-opacity"]); else { p = "f" + n + ":" + p; n = ""; switch (m) { case 2: n = a(j, p, "linearGradient"); break; case 3: n = a(j, p, "radialGradient"); break; case 4: case 5: case 6: case 7: n = c(j, p) }q.setAttribute("fill", "url(#" + n + ")") } } } if (typeof h.line !==
                            "undefined") { j = e.LineStyles[h.line]; m = e.id; q = k; h = h.line; p = void 0; for (p in j) typeof j[p] != "object" && q.setAttribute(p, j[p]); if ("fill" in j) { h = "l" + m + ":" + h; m = ""; switch (j.fill.type) { case 2: m = a(j.fill, h, "linearGradient"); break; case 3: m = a(j.fill, h, "radialGradient"); break; case 4: case 5: case 6: case 7: m = c(j.fill, h) }q.setAttribute("stroke", "url(#" + m + ")") } q.setAttribute("fill", "none") } f.appendChild(k)
                } d.setAttribute("type", "shape"); b.defineShapes[e.id] = d
            }
    }(); b.filterElement = function (a, c) {
        var e = {
            "0": "Shadow", "1": "Blur",
            "2": "Glow", "3": "Bevel"
        }, d = function (a) { return a == 0 ? "SourceGraphic" : a }; this.defs = a.firstChild; this.target = a.firstChild.nextSibling; this.id = "filter_" + a.getAttribute("id"); this.base = 0; this.filters = c; this.element = b.createTag("filter"); this.defs.appendChild(this.element); this.Rgb = function (a) {
            var d = ["R", "G", "B"], c = b.createTag("feComponentTransfer"); c.setAttribute("in", a); this.element.appendChild(c); for (a = 0; a < d.length; a++) {
                var e = b.createTag("feFunc" + d[a]); e.setAttribute("type", "linear"); e.setAttribute("slope",
                    0); c.appendChild(e)
            } return this
        }; this.Rgba = function (a, d, c) { var e = ["R", "G", "B"], h = [d.r, d.g, d.b, d.a]; d = b.createTag("feComponentTransfer"); d.setAttribute("result", c); this.element.appendChild(d); for (c = 0; c < e.length; c++) { var k = b.createTag("feFunc" + e[c]); k.setAttribute("type", "linear"); k.setAttribute("intercept", h[c]); k.setAttribute("Ue", 0); d.appendChild(k) } e = b.createTag("feFuncA"); e.setAttribute("type", "linear"); e.setAttribute("slope", a); e.setAttribute("xh", 0); d.appendChild(e); return this }; this.Fo = function (a,
            d, c) { var e = b.createTag("feOffset"); e.setAttribute("dx", a); e.setAttribute("dy", d); c !== !1 && e.setAttribute("result", c); this.element.appendChild(e); return this }; this.Fg = function (a, d) { var c = b.createTag("feGaussianBlur"); c.setAttribute("stdDeviation", [a, d].join(" ")); this.element.appendChild(c); return this }; this.Com = function (a, d, c, e, h, k) {
                var j = b.createTag("feComposite"); d !== !1 && j.setAttribute("in", d); c !== !1 && j.setAttribute("in2", c); j.setAttribute("operator", a); e != 0 && j.setAttribute("k2", e); h != 0 && j.setAttribute("k3",
                    h); k && j.setAttribute("result", k); this.element.appendChild(j); return this
            }; this.Shadow = function (a) {
                if (a.opt & 128) { var c = b.createTag("feFlood"); c.setAttribute("result", ++this.base); this.element.appendChild(c) } a.opt & 128 ? this.Rgb(d(this.base - 1)) : this.Rgb(d(this.base)); this.Fg(a.blurx, a.blury).Fo(a.dx, a.dy, !1); a.opt & 128 && this.Com("arithmetic", !1, d(this.base), -1, 1); this.Rgba(a.strength, a.color, ++this.base); a.opt & 32 ? a.opt & 64 && a.opt & 128 ? this.Com("in", d(this.base), d(this.base - 2), 0, 0, ++this.base) : a.opt & 64 ? this.Com("out",
                    d(this.base), d(this.base - 1), 0, 0, ++this.base) : a.opt & 128 ? this.Com("atop", d(this.base), d(this.base - 2), 0, 0, ++this.base) : this.Com("over", d(this.base - 1), d(this.base), 0, 0, ++this.base) : a.opt & 128 ? this.Com("in", d(this.base), d(this.base - 2), 0, 0, ++this.base) : a.opt & 64 && this.Com("out", d(this.base), d(this.base - 1), 0, 0, ++this.base)
            }; this.Blur = function (a) {
                var c = b.createTag("feGaussianBlur"); c.setAttribute("in", d(this.base)); c.setAttribute("result", ++this.base); c.setAttribute("stdDeviation", [a.blurx, a.blury].join(" "));
                this.element.appendChild(c)
            }; this.Glow = function (a) {
                if (a.opt & 128) { var c = b.createTag("feFlood"); c.setAttribute("result", ++this.base); this.element.appendChild(c) } a.opt & 128 ? this.Rgb(d(this.base - 1)) : this.Rgb(d(this.base)); this.Fg(a.blurx, a.blury); a.opt & 128 && this.Com("arithmetic", !1, d(this.base), -1, 1); a.opt & 128 ? this.Rgba(a.strength, a.color, d(this.base)) : this.Rgba(a.strength, a.color, ++this.base); a.opt & 64 && a.opt & 128 ? this.Com("in", d(this.base), d(this.base - 1), 0, 0, ++this.base) : a.opt & 64 ? this.Com("out", d(this.base),
                    d(this.base - 1), 0, 0, ++this.base) : a.opt & 128 ? this.Com("atop", d(this.base), d(this.base - 1), 0, 0, ++this.base) : this.Com("over", d(this.base - 1), d(this.base), 0, 0, ++this.base)
            }; this.Bevel = function (a) {
                this.Rgb(d(this.base)).Fg(a.blurx, a.blury).Fo("-" + a.dx, "-" + a.dy, ++this.base).Rgb(d(this.base - 1)).Fg(a.blurx, a.blury).Fo(a.dx, a.dy, ++this.base).Com("arithmetic", d(this.base - 1), d(this.base), 1, -1).Rgba(a.strength, a.highlightColor, ++this.base).Com("arithmetic", d(this.base - 1), d(this.base - 2), 1, -1).Rgba(a.strength, a.color,
                    ++this.base).Com("arithmetic", d(this.base - 1), d(this.base), 1, 1, ++this.base); a.opt & 64 ? a.opt & 16 || (a.opt & 128 ? this.Com("in", this.base, d(this.base - 5), 0, 0, ++this.base) : this.Com("out", this.base, d(this.base - 5), 0, 0, ++this.base)) : a.opt & 128 ? this.Com("atop", this.base, d(this.base - 5), 0, 0, ++this.base) : a.opt & 16 ? this.Com("over", this.base, d(this.base - 5), 0, 0, ++this.base) : this.Com("over", d(this.base - 5), this.base, 0, 0, ++this.base)
            }; this.init = function () {
                var a = this.filters.rect, c = this.filters.record; this.element.setAttribute("width",
                    a.w); this.element.setAttribute("height", a.h); this.element.setAttribute("x", a.x); this.element.setAttribute("y", a.y); this.element.setAttribute("id", this.id); for (a = 0; a < c.length; a++)this.filterDom(c[a]); this.attachFilter()
            }; this.reset = function (a) { for (; this.element.firstChild;)this.element.removeChild(this.element.firstChild); this.base = 0; this.filters = a; this.init() }; this.filterDom = function (a) { if (e[a.type]) this[e[a.type]](a) }; this.attachFilter = function () {
                this.element.childNodes.length > 0 && this.target.setAttribute("filter",
                    "url(#" + this.id + ")")
            }; this.init()
    }; b.sprite = function (a, c) { this.placeObjects = a.ShowFrame; this.sprites = {}; this.depths = {}; this.frame = this.arrayIndex = 0; this.par = c; this.frames = []; for (var e = [], d = 0, g = this.placeObjects.length; d < g; d++) { var f = this.placeObjects[d]; f.type == 14 || f.type == 43 || (e.push(f), f.type == 1 && (this.frames.push(e), e = [])) } b.sprite.instances.push(this); this.debugId = a.id }; b.sprite.instances = []; b.sprite.prototype.showFrame = function () {
        for (var a = this.frames[this.frame], c = a[a.length - 1], b = null, d = 0, g =
            a.length - 1; d < g; d++)b = a[d], this.renderShape(b), this.lastDepth = b.depth; this.lastDepth = null; "action" in c && this.handleAction(c.action); this.pause || this.frame++; if (this.frame == this.frames.length) this.frame = 0
    }; b.sprite.prototype.handleAction = function (a) { for (var c = 0, b = a.length; c < b; c++)this.action(a[c]) }; b.sprite.prototype.action = function (a) { a = a.aslist; for (var c = 0, b = 0, d = a.length; b < d; b++)switch (c = a[b].code, c) { case 7: this.stop(); break; case 129: this.gotoFrame(a[b].frame); break; case 6: this.play() } }; b.sprite.prototype.stop =
        function () { this.pause = !0 }; b.sprite.prototype.gotoFrame = function (a) { this.frame = a }; b.sprite.prototype.gotoAndStop = function (a) { if (this.frames[a]) this.frame = a, this.pause = !0 }; b.sprite.prototype.play = function () { this.pause = !1 }; b.sprite.prototype.renderShape = function (a) { if ("name" in a) this.name = a.name; if ("remove" in a) return this.removeShape(a.depth); this.afterRender("replace" in a ? this.replaceShape(a) : this.getShape(a), a); return !0 }; b.sprite.prototype.replaceShape = function (a) {
            var c = this.par.firstChild.nextSibling,
            b = this.createShape(a), d = a.depth; if (this.depths[d]) { var g = this.par.getAttribute("id") + ":" + d + ":" + this.depths[d], f = document.getElementById(g); if (g == b.id) return f; c.replaceChild(b, f); this.sprites[d + ":" + this.depths[d]] && (this.sprites[d + ":" + this.depths[d]] = null, delete this.sprites[d + ":" + this.depths[d]]); this.buttons && this.buttons[d + ":" + this.depths[d]] && (this.buttons[d + ":" + this.depths[d]] = null, delete this.buttons[d + ":" + this.depths[d]]) } else this.lastDepth ? (g = this.par.getAttribute("id") + ":" + this.lastDepth +
                ":" + this.depths[this.lastDepth], g = document.getElementById(g).nextSibling) : g = c.firstChild, g ? c.insertBefore(b, g) : c.appendChild(b); this.depths[d] = a.id; return b
        }; b.sprite.prototype.removeShape = function (a) {
            if (this.depths[a]) {
                var c = this.depths[a], b = this.par.firstChild.nextSibling; c = this.par.getAttribute("id") + ":" + a + ":" + c; c = document.getElementById(c); b.removeChild(c); this.sprites[a + ":" + this.depths[a]] && (this.sprites[a + ":" + this.depths[a]] = null, delete this.sprites[a + ":" + this.depths[a]]); this.buttons && this.buttons[a +
                    ":" + this.depths[a]] && (this.buttons[a + ":" + this.depths[a]] = null, delete this.buttons[a + ":" + this.depths[a]]); delete this.depths[a]
            } return a
        }; b.sprite.prototype.getShape = function (a) { a = this.par.getAttribute("id") + ":" + a.depth + ":" + a.id; return document.getElementById(a) }; b.sprite.prototype.afterRender = function (a, c) { this.mxTransform(a, c); this.cxTransform(a, c); this.changeOpacity(a, c); this.addFilters(a, c) }; b.sprite.prototype.mxTransform = function (a, c) {
            var b = {
                mask: "moveShape", shape: "moveShape", text: "moveText",
                sprite: "moveSprite", button: "moveButton"
            }; if ("matrix" in c) { var d = a.getAttribute("type"); this[b[d]](a, c) }
        }; b.sprite.prototype.moveShape = function (a, c) { var b = c.matrix; if (a.nodeName.toLowerCase() == "g") a.firstChild.nextSibling.setAttribute("transform", "matrix(" + b + ")"); else for (var d = a.childNodes, g = 0, f = d.length; g < f; g++)d[g].setAttribute("transform", "matrix(" + b + ")") }; b.sprite.prototype.moveText = function (a, c) {
            for (var e = a.firstChild.nextSibling.childNodes, d = c.matrix, g = 0; e[g]; g++) {
                var f = e[g].getAttribute("transform");
                e[g].oriMx = e[g].oriMx || f; f = e[g].oriMx.match(/matrix\(([^(]+)\)/)[1]; f = b.sprite.concatMatrix(f, d); e[g].setAttribute("transform", "matrix(" + f + ")")
            }
        }; b.sprite.prototype.moveSprite = function (a, c) { var e = c.matrix, d = c.depth + ":" + c.id; this.sprites[d] = this.sprites[d] || new b.sprite(b.hash[c.id], a); this.sprites[d].showFrame(); a.firstChild.nextSibling.setAttribute("transform", "matrix(" + e + ")") }; b.sprite.prototype.moveButton = function (a, c) {
            var e = c.depth, d = this.depths[c.depth], g = c.matrix, f = b.hash[c.id]; if (!this.buttons) this.buttons =
                {}; if (this.buttons[e + ":" + d]) for (var i in f = this.buttons[e + ":" + d].sprites, f) f[i].showFrame(); else this.buttons[e + ":" + d] = new b.sprite.Button(a, f); this.buttons[e + ":" + d].element.setAttribute("transform", "matrix(" + g + ")")
        }; b.bindAsEventListener = function (a, c) { var b = Array.prototype.slice.call(arguments, 2); return function (d) { c.apply(a, [d || window.event].concat(b)) } }; b.sprite.Button = function (a, c) {
        this.pid = a.getAttribute("id"); this.element = a.firstChild.nextSibling; this.states = {}; this.sprites = {}; this.init(c);
            this.element.style.cursor = "pointer"
        }; b.sprite.Button.prototype = {
            init: function (a) {
                function c(a) {
                    for (var c = null, d = 0, e = h[a].length; d < e; d++) {
                        c = h[a][d][0].cloneNode(!0); c.style.display = a == "up" || a == "hit" ? "block" : "none"; c.setAttribute("state", a); a == "hit" && (c.style.opacity = 0); l.appendChild(c); var f = h[a][d][1]; "opacity" in f && b.sprite.prototype.changeOpacity(c, f); "cxform" in f && b.sprite.prototype.colorTransform(c, f.cxform); "filters" in f && b.sprite.prototype.addFilters(c, f); if (c.getAttribute("type") == "sprite") {
                            f =
                            c.getAttribute("sid"); var g = a.concat(d); k[g] = k[g] || new b.sprite(b.hash[f], c); k[g].showFrame()
                        }
                    }
                } for (var e = a.record, d, g, f, i = e.length - 1; i >= 0; i--)d = e[i], f = d.state, g = b.defineShapes[d.shapeid].cloneNode(!0), g.setAttribute("transform", d.transform), g.setAttribute("sid", d.shapeid), g.setAttribute("id", this.pid.concat(":", d.shapeid, "_", i)), this.states[f] || (this.states[f] = []), this.states[f].push([g, d]); var l = this.element, h = this.states, k = this.sprites; "up" in this.states && c("up"); "hit" in this.states && c("hit");
                "down" in this.states && c("down"); "over" in this.states && c("over"); this.normalEvents(); "action" in a && this.handleAction(a.action)
            }, normalEvents: function () {
                this.element.addEventListener("mousedown", b.bindAsEventListener(this, this.mousedownHandler), !1); this.element.addEventListener("mouseup", b.bindAsEventListener(this, this.mouseupHandler), !1); this.element.addEventListener("mouseover", b.bindAsEventListener(this, this.mouseoverHandler), !1); this.element.addEventListener("mouseout", b.bindAsEventListener(this,
                    this.mouseoutHandler), !1)
            }, handleAction: function (a) { for (var c = 0, b = a.length; c < b; c++) { var d = a[c]; switch (d.cond) { case "OverDownToOverUp": case "IdleToOverUp": this.handleRelease(d.aslist) } } }, handleRelease: function (a) {
                for (var c = 0, e = a.length; c < e; c++) {
                "url" in a[c] && function (a, c) { a.addEventListener("mouseup", function () { window.open(c) }, !1) }(this.element, a[c].url); var d = a[c].statement; if (/^\S+$/.test(d) && d.indexOf(".") == -1) {
                    d = d.match(/^([^\(]+)\(([^\(]*)\)$/); var g = d[1].trim(); (function (a, c, d, b) {
                        c.addEventListener("mouseup",
                            function () { if (d in a) a[d](b) }, !1)
                    })(b.sprite.instances[0], this.element, g, d[2])
                }
                }
            }, mouseoutHandler: function () { "up" in this.states && this.changeState("up") }, mouseoverHandler: function () { "over" in this.states && this.changeState("over") }, mousedownHandler: function () { "down" in this.states && this.changeState("down") }, mouseupHandler: function () { "up" in this.states && this.changeState("up") }, changeState: function (a) {
                if (a in this.states) for (var c = this.element.childNodes, b = 0, d; d = c[b]; b++)d.style.display = d.getAttribute("state") ==
                    "hit" || d.getAttribute("state") == a ? "block" : "none"
            }
        }; b.sprite.prototype.cxTransform = function (a, c) { "cxform" in c && this.colorTransform(a, c.cxform) }; b.sprite.prototype.colorTransform = function () {
            function a(a, b) {
                var d = a.match(/rgb\(([^(]+)\)/)[1].split(","), g = Math.max(0, Math.min((d[0] - 0) * b.RedMultTerm / 256 + b.RedAddTerm, 255)), f = Math.max(0, Math.min((d[1] - 0) * b.GreenMultTerm / 256 + b.GreenAddTerm, 255)); d = Math.max(0, Math.min((d[2] - 0) * b.BlueMultTerm / 256 + b.BlueAddTerm, 255)); g = parseInt(g); f = parseInt(f); d = parseInt(d);
                return [g, f, d]
            } return function (c, b) {
                var d = c.getAttribute("type"); if ((d == "shape" || d == "text") && c.nodeName.toLowerCase() != "clippath") {
                    d = c.firstChild.nextSibling; try {
                        for (var g = 0, f = d.childNodes.length; g < f; g++) {
                            var i = d.childNodes[g], l = b, h = i.hasAttribute("stroke") ? "stroke" : "fill", k = i.getAttribute(h); if (k) switch (k.match(/^\S{3}/)[0]) {
                                case "rgb": var j = i, m = h; j.oriC = j.oriC || k; var p = a(j.oriC, l); j.setAttribute(m, "rgb(" + p[0] + "," + p[1] + "," + p[2] + ")"); break; case "url": j = i; m = h; var q = k.match(/url\(#([^(]+)\)/)[1], n = "";
                                    switch (m) { case "stroke": n = "l"; break; case "fill": n = "f" }var o = q.indexOf(n); o !== 0 && (q = q.substr(o)); var t = document.getElementById(q); if (t.nodeName != "pattern") {
                                        var w = j.parentNode.previousSibling, r = j.parentNode.parentNode.getAttribute("id") + q; if (document.getElementById(r)) var s = document.getElementById(r); else s = t.cloneNode(!0), s.setAttribute("id", r), w.appendChild(s); var v = t.childNodes, x = s.childNodes; n = 0; for (var y = v.length; n < y; n++) {
                                            var z = v[n].getAttribute("stop-color"), u = a(z, l); x[n].setAttribute("stop-color",
                                                "rgb(" + u[0] + "," + u[1] + "," + u[2] + ")")
                                        } j.setAttribute(m, "url(#" + r + ")")
                                    }
                            }
                        }
                    } catch (A) { }
                } else if (d == "sprite") { f = c.firstChild.nextSibling.childNodes; i = 0; for (h = f.length; i < h; i++)this.colorTransform(f[i], b) }
            }
        }(); b.sprite.prototype.changeOpacity = function (a, c) { var b = 1; "opacity" in c && (b = c.opacity); a.setAttribute("opacity", b) }; b.sprite.prototype.addFilters = function (a, c) { if ("filters" in c) { var e = c.filters; a.filter ? a.filter.reset(e) : a.filter = new b.filterElement(a, e) } }; b.sprite.prototype.getNode = function (a) { return b.defineShapes[a.id].cloneNode(!0) };
    b.sprite.prototype.createShape = function (a) { var c = this.getNode(a), b = this.par.getAttribute("id") + ":" + a.depth + ":" + a.id; "clipDepth" in a ? (this.clipDepthId = b, this.clipDepth = a.clipDepth, this.clipDepthDepth = a.depth, c = this.createClip(a)) : this.clipDepthId && a.depth > this.clipDepthDepth && a.depth <= this.clipDepth && c.setAttribute("clip-path", "url(#" + this.clipDepthId + ")"); c.setAttribute("id", b); return c }; b.sprite.prototype.createClip = function (a) {
        var c = this.getNode(a); switch (c.getAttribute("type")) {
            case "shape": return this.createSimpleClip(c);
            case "sprite": return this.createComplexClip(a)
        }
    }; b.sprite.prototype.createSimpleClip = function (a) { var c = b.createTag("clipPath"); a = a.firstChild.nextSibling.childNodes; for (var e = 0, d = a.length; e < d; e++) { var g = a[e].cloneNode(!0); c.appendChild(g) } c.setAttribute("clippathunits", "userSpaceOnUse"); c.setAttribute("type", "shape"); return c }; b.sprite.prototype.createComplexClip = function (a) { return this.createSimpleClip(b.defineShapes[b.hash[a.id].ShowFrame[0].id]) }; b.sprite.concatMatrix = function (a, c) {
        var b = []; a =
            a.split(","); c = c.split(","); for (var d = 0; a[d]; d++)a[d] -= 0, c[d] -= 0; b.push(a[0] * c[0] + a[1] * c[1]); b.push(a[0] * c[1] + a[1] * c[3]); b.push(a[1] * c[0] + a[3] * c[1]); b.push(a[1] * c[1] + a[3] * c[3]); b.push(c[4] * a[0] + c[5] * a[1] + a[4]); b.push(c[4] * a[1] + c[5] * a[3] + a[5]); return b.join(",")
    }; b.start = function () {
        var a = b.createTag("g"); b.setBackground(b.root); a.setAttribute("id", "0"); a.appendChild(b.createTag("defs")); a.appendChild(b.createTag("g")); b.root.appendChild(a); var c = new b.sprite(o.MainFrame, a); b.timer = setTimeout(function () {
            c.showFrame();
            setTimeout(arguments.callee, b.interval)
        }, b.interval)
    }; b.stop = function () { clearTimeout(b.timer) }; b.resume = function () { b.timer = setTimeout(function () { mainMovie.showFrame(); setTimeout(arguments.callee, b.interval) }, b.interval) }; b.setBackground = function (a) { var c = b.createTag("rect"), e = { x: "0px", y: "0px", viewBox:"0 0 490 417", preserveAspectRatio:"none", fill: o.BackgroundColor }, d; for (d in e) c.setAttribute(d, e[d]); a.appendChild(c) }; b.init(); b.start()
})(data);
