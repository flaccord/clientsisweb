/*
! function(a) {
    var b = Array.prototype.slice,
        c = Array.prototype.splice,
        d = {
            topSpacing: 0,
            bottomSpacing: 0,
            className: "is-sticky",
            wrapperClassName: "sticky-wrapper",
            center: !1,
            getWidthFrom: "",
            widthFromWrapper: !0,
            responsiveWidth: !1
        },
        e = a(window),
        f = a(document),
        g = [],
        h = e.height(),
        i = function() {
            for (var b = e.scrollTop(), c = f.height(), d = c - h, i = b > d ? d - b : 0, j = 0; j < g.length; j++) {
                var k = g[j],
                    l = k.stickyWrapper.offset().top,
                    m = l - k.topSpacing - i;
                if (k.stickyWrapper.css("height", 0), m >= b) null !== k.currentTop && (k.stickyElement.css({
                    width: "",
                    position: "",
                    top: ""
                }), k.stickyElement.parent().removeClass(k.className), k.stickyElement.trigger("sticky-end", [k]), k.currentTop = null);
                else {
                    var n = c - k.stickyElement.outerHeight() - k.topSpacing - k.bottomSpacing - b - i;
                    if (0 > n ? n += k.topSpacing : n = k.topSpacing, k.currentTop != n) {
                        var o;
                        k.getWidthFrom ? o = a(k.getWidthFrom).width() || null : k.widthFromWrapper && (o = k.stickyWrapper.width()), null == o && (o = k.stickyElement.width()), k.stickyElement.css("width", o).css("position", "fixed").css("top", n), k.stickyElement.parent().addClass(k.className), null === k.currentTop ? k.stickyElement.trigger("sticky-start", [k]) : k.stickyElement.trigger("sticky-update", [k]), k.currentTop === k.topSpacing && k.currentTop > n || null === k.currentTop && n < k.topSpacing ? k.stickyElement.trigger("sticky-bottom-reached", [k]) : null !== k.currentTop && n === k.topSpacing && k.currentTop < n && k.stickyElement.trigger("sticky-bottom-unreached", [k]), k.currentTop = n
                    }
                }
            }
        },
        j = function() {
            h = e.height();
            for (var b = 0; b < g.length; b++) {
                var c = g[b],
                    d = null;
                c.getWidthFrom ? c.responsiveWidth === !0 && (d = a(c.getWidthFrom).width()) : c.widthFromWrapper && (d = c.stickyWrapper.width()), null != d && c.stickyElement.css("width", d)
            }
        },
        k = {
            init: function(b) {
                var c = a.extend({}, d, b);
                return this.each(function() {
                    var b = a(this),
                        e = b.attr("id"),
                        f = b.outerHeight(),
                        h = e ? e + "-" + d.wrapperClassName : d.wrapperClassName,
                        i = a("<div></div>").attr("id", h).addClass(c.wrapperClassName);
                    b.wrapAll(i);
                    var j = b.parent();
                    c.center && j.css({
                        width: b.outerWidth(),
                        marginLeft: "auto",
                        marginRight: "auto"
                    }), "right" == b.css("float") && b.css({
                        "float": "none"
                    }).parent().css({
                        "float": "right"
                    }), j.css("height", f), c.stickyElement = b, c.stickyWrapper = j, c.currentTop = null, g.push(c)
                })
            },
            update: i,
            unstick: function(b) {
                return this.each(function() {
                    for (var b = this, d = a(b), e = -1, f = g.length; f-- > 0;) g[f].stickyElement.get(0) === b && (c.call(g, f, 1), e = f); - 1 != e && (d.unwrap(), d.css({
                        width: "",
                        position: "",
                        top: "",
                        "float": ""
                    }))
                })
            }
        };
    window.addEventListener ? (window.addEventListener("scroll", i, !1), window.addEventListener("resize", j, !1)) : window.attachEvent && (window.attachEvent("onscroll", i), window.attachEvent("onresize", j)), a.fn.sticky = function(c) {
        return k[c] ? k[c].apply(this, b.call(arguments, 1)) : "object" != typeof c && c ? void a.error("Method " + c + " does not exist on jQuery.sticky") : k.init.apply(this, arguments)
    }, a.fn.unstick = function(c) {
        return k[c] ? k[c].apply(this, b.call(arguments, 1)) : "object" != typeof c && c ? void a.error("Method " + c + " does not exist on jQuery.sticky") : k.unstick.apply(this, arguments)
    }, a(function() {
        setTimeout(i, 0)
    })
}(jQuery), */

$(function() {
    function a() {
        $(window).width() < 980 ? $("#wrap").addClass("mobile-wrap-container") : $("#wrap").removeClass("mobile-wrap-container")
    }

    function b(a, b, c) {
        function d() {
            var d = Math.floor($(window).width() / (a + 100));
            e = c - d, e = e > 0 ? e : 0, f = 0, $(b).get(0).style.left = "0px"
        }
        var e = 0,
            f = 0;
        return $(b).addClass("smoothTransition"), d(), $(window).resize(d), $(b).length > 0 ? {
            prev: function() {
                return e > f && (f++, $(b).get(0).style.left = -a * f + "px"), this
            },
            next: function() {
                return f > 0 && (f--, $(b).get(0).style.left = -a * f + "px"), this
            }
        } : {}
    }

    function c(a) {
        l.x = event.touches[0].pageX, l.y = event.touches[0].pageY
    }

    function d(a) {
        m.x = l.x - event.touches[0].pageX, m.y = l.y - event.touches[0].pageY
    }

    function e(a) {
        m.x > 150 ? k.next() : m.x < -150 && k.prev()
    }

    function f() {
        if ($(".info_grid_container").length > 0)
            if ($(window).width() <= 640) {
                var a = function(a) {
                    var b = 0;
                    return {
                        next: function() {
                            return a - 1 > b && b++, this.goToIndex(b), this
                        },
                        prev: function() {
                            return b > 0 && b--, this.goToIndex(b), this
                        },
                        getIndex: function() {
                            return b
                        },
                        goToIndex: function(a) {
                            return b = a, $(".info_grid").css("overflow", "hidden"), $(".info_grid").stop().animate({
                                scrollLeft: a * $(window).width()
                            }, "100", "swing", function() {
                                $(".info_grid").css("overflow", "auto")
                            }), this
                        }
                    }
                }($(".info_grid_container .item").length);
                $(".photo_slider_controls .left").on("click", function() {
                    a.prev()
                }), $(".photo_slider_controls .right").on("click", function() {
                    a.next()
                }), $(".info_grid").scroll(function() {
                    clearTimeout($.data(this, "scrollTimer")), $.data(this, "scrollTimer", setTimeout(function() {
                        var b = Math.round($(".info_grid").scrollLeft() / $(window).width());
                        a.goToIndex(b)
                    }, 350))
                }), $(".info_grid_container").css("width", ($(window).width() + 5) * $(".info_grid_container .item").length), $(".info_grid_container .item").width($(window).width()), $(".info_grid").css("overflow", "auto"), $(".photo_slider_controls").css("display", "block")
            } else $(".info_grid_container").css("width", "100%"), $(".info_grid_container .item").width("33%"), $(".info_grid").css("overflow", "none"), $(".photo_slider_controls").css("display", "none")
    }
    
    $("#a_sublist").hover(function() {
        $(this).addClass("hover"), $(".nav_list_sub").fadeIn()
    }, function() {
        $(this).removeClass("hover"), $(".nav_list_sub").fadeOut()
    }), $(".nav_list_sub").hover(function() {
        $(".nav_btn").addClass("hover")
    }, function() {
        $(".nav_btn").removeClass("hover")
    });
    
    var g = 0;
    $(".login_button").on("click", function(a) {
        a.preventDefault, 0 === g ? ($(".login_wrap").fadeIn(), g = 1) : 1 === g && ($(".login_wrap").fadeOut(), g = 0)
    });
    var h = !1;
    $("#abre").on("click", function(a) {
        h ? ($("#wrap").css("transform", "translate3d(0%,0,0)"), $(".login_wrap").fadeOut(), $("body").css("overflow", "auto"), $(".mobile-menu-container"),$(".mobile-menu-container").delay(500).hide(0)) : ($("#wrap").css("transform", "translate3d(-80%,0,0)"), $("body").css("overflow", "hidden"), $(".mobile-menu-container").show()),h = !h
    }), $("#cierra").on("click", function(a) {
        $("#wrap").css("transform", "translate3d(0%,0,0)")
    }), $(window).resize(function() {
        a(), f()
    });
    "undefined" != typeof $(".owl-main-slider").owlCarousel ? $(".owl-main-slider").owlCarousel({
        dots: !0,
        autoHeight: !0,
        items: 1
    }) : {};
    a(), $("#submenu_prov").on("click", function(a) {
        a.preventDefault, $(".submenu_res").toggleClass("open")
    });
    /*var i = $(".mi-item").length,
        j = b(180, ".slider_footer_items", 10);
    $(".customPrevBtn").click(function() {
        j.prev()
    }), $(".customNextBtn").click(function() {
        j.next()
    });*/





    /*var k = function() {
        var a = [],
            b = 0;
        return {
            init: function() {
                return $(".modal-image").get(0).addEventListener("touchstart", c, !1), $(".modal-image").get(0).addEventListener("touchmove", d, !1), $(".modal-image").get(0).addEventListener("touchend", e, !1), $(".info_grid .item").each(function(b) {
                    a.push({
                        index: $(this).attr("index"),
                        url: $(this).data('image')
                    })
                }), this
            },
            show: function(b) {
                var c = b || 0;
                return $(".modal").removeClass("hide"), $(".background-listener").removeClass("hide"), $(".modal-container .modal-image").attr("src", a[c].url), this
            },
            hide: function() {
                return $(".modal-container").addClass("hide"), $(".background-listener").addClass("hide"), this
            },
            getCurrentElement: function() {
                return a[b]
            },
            prev: function() {
                return b < a.length - 1 && b++, this.show(b), this
            },
            next: function() {
                return b > 0 && b--, this.show(b), this
            },
            getElementByIndex: function(b) {
                for (var c = !1, d = 0; d < a.length; d++) a[d].index === b && (c = a[d]);
                return c
            }

        }
    }();*/


   /* $(".modal-image").length > 0 && k.init();
    var l = {
            x: 0,
            y: 0
        },
        m = {};
    $(".modal-image").on("swipeleft", function(a) {
        k.next()
    }), $(".modal-image").on("swiperight", function(a) {
        k.prev()
    }), $(".info_grid .item").on("click", function(a) {
        k.show($(this).attr("index"))
    }), $(".background-listener, .slider_modal_controls .close").on("click", function(a) {
        $(".background-listener, .modal").addClass("hide")
    }), $(".slider_modal_controls .left").on("click", function() {
        k.prev()
    }), $(".slider_modal_controls .right").on("click", function() {
        k.next()
    }), f()*/
});