/*
 * jQuery Web Sockets Plugin v0.0.1
 * http://code.google.com/p/jquery-websocket/
 *
 * This document is licensed as free software under the terms of the
 * MIT License: http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright (c) 2010 by shootaroo (Shotaro Tsubouchi).
 */
(function ($) {
    $.extend({
        websocketSettings: {
            open: function () {
            },
            close: function () {
            },
            message: function () {
            },
            options: {},
            events: {}
        },
        websocket: function (url, s) {
            if(!window.WebSocket){
                alert("您的浏览器不支持 Web Socket.请使用IE9+、Chrome、FireFox。");
                return;
            }
            var ws = window.WebSocket ? new WebSocket(url) : {
                send: function () {
                    return false
                },
                close: function () {
                }
            };
            $(ws)
                .bind('open', $.websocketSettings.open)
                .bind('close', $.websocketSettings.close)
                .bind('message', $.websocketSettings.message)
                .bind('message', function (e) {
                    var m = $.evalJSON(e.originalEvent.data);
                    var h = $.websocketSettings.events[m.type];
                    if (h) h.call(this, m);
                });
            ws._settings = $.extend($.websocketSettings, s);
            ws._send = ws.send;
            ws.send = function (type, data) {
                var m = {type: type};
                m = $.extend(true, m, $.extend(true, {}, $.websocketSettings.options, m));
                if (data) m['data'] = data;
                return this._send($.toJSON(m));
            }
            $(window).unload(function () {
                ws.close();
                ws = null
            });
            return ws;
        }
    });
})(jQuery);
