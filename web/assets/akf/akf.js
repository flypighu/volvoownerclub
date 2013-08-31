/**
 * 常用工具类
 */

var AKF = {
    keyCode: {
        ENTER: 13,
        ESC: 27,
        END: 35,
        HOME: 36,
        SHIFT: 16,
        TAB: 9,
        LEFT: 37,
        RIGHT: 39,
        UP: 38,
        DOWN: 40,
        DELETE: 46,
        BACKSPACE: 8
    },
    jsonEval: function (json) {
        try {
            return eval('(' + json + ')');
        } catch (e) {
            return {};
        }
    },
    /**
     * 获取制定表单的所有input元素，拼装成AJAX请求的参数
     *
     * @param p
     *            页面表单的对象
     *
     * @return data
     *
     * @author huxiang
     */
    formParams: function (p) {
        if (p == undefined) {
            return;
        }

        var data = new Array;

        // 将表单数据放到数组中，本方法配合formParams方法使用
        var putParam = function (obj, dataList) {
            if ($(obj).attr("name") != '') {
                dataList.push({
                    name: $(obj).attr("name"),
                    value: $(obj).attr("value")
                });
            }
        }

        $(p).find(":input").each(function (i, n) {
            var flag = "false";
            if ($(n).attr("param") == undefined) {
                flag = "true";
            } else {
                flag = $(n).attr("param");
            }
            if (flag == true || flag == "true") {
                if ($(n).attr('type') == "text"
                    || $(n).attr('type') == "password"
                    || $(n).attr('type') == "hidden") {
                    putParam(n, data);
                }
            }
        });
        $(p).find("textarea").each(function (i, n) {
            var flag = "false";
            if ($(n).attr("param") == undefined) {
                flag = "true";
            } else {
                flag = $(n).attr("param");
            }
            if (flag == true || flag == "true") {
                putParam(n, data);
            }
        });
        $(p).find("select").each(function (i, n) {
            var flag = "false";
            if ($(n).attr("param") == undefined) {
                flag = "true";
            } else {
                flag = $(n).attr("param");
            }
            if (flag == true || flag == "true") {
                if ($.trim($(n).attr('value')) != '') {
                    putParam(n, data);
                } else {
                    if ($(n).attr("name") != '') {
                        data.push({
                            name: $(n).attr("name"),
                            value: ''
                        });
                    }
                }
            }
        });
        return data;
    }
};

// 公共扩展
(function ($) {
    // 数组扩展
    $.extend(Array.prototype, {
        indexOf: function (object) {
            for (var i = 0; i < this.length; i++) {
                if (this[i] == Object) {
                    return i;
                }
            }
            return -1;
        },
        // 深度拷贝,这个方法非常简单，它返回一个深度拷贝的数组。
        copy: function () {
            return [].concat(this);
        },
        // 去除数组中的重复项
        // 方法 unique 将返回一个仅包含不重复元素的数组
        unique: function () {
            var a = [];
            var l = this.length;
            for (var i = 0; i < l; i++) {
                for (var j = i + 1; j < l; j++) {
                    if (this[i] === this[j])
                        j = ++i;
                }
                a.push(this[i]);
            }
            return a;
        },
        // 获取数组中不相同的元素
        // 当一个数组调用 diff 方法，将得到这个数组中元素与其他数组中元素所不同的元素。
        diff: function () {
            var a1 = this;
            var a = a2 = null;
            var n = 0;
            while (n < arguments.length) {
                a = [];
                a2 = arguments[n];
                var l = a1.length;
                var l2 = a2.length;
                var diff = true;
                for (var i = 0; i < l; i++) {
                    for (var j = 0; j < l2; j++) {
                        if (a1[i] === a2[j]) {
                            diff = false;
                            break;
                        }
                    }
                    diff ? a.push(a1[i]) : diff = true;
                }
                a1 = a;
                n++;
            }
            return a.unique();
        },
        // 合并数组
        // 这个方法将传入的数组进行合并，并返回合并后的新数组
        union: function () {
            var a = [].concat(this);
            var l = arguments.length;
            for (var i = 0; i < l; i++) {
                a = a.concat(arguments[i]);
            }
            return a;
        },
        // 交集
        // intersect 将返回传入几的数组中相同的元素
        intersect: function () {
            if (!arguments.length)
                return [];
            var a1 = this;
            var a = a2 = null;
            var n = 0;
            while (n < arguments.length) {
                a = [];
                a2 = arguments[n];
                var l = a1.length;
                var l2 = a2.length;
                for (var i = 0; i < l; i++) {
                    for (var j = 0; j < l2; j++) {
                        if (a1[i] === a2[j])
                            a.push(a1[i]);
                    }
                }
                a1 = a;
                n++;
            }
            return a.unique();
        }
    });
    /**
     * String
     */

    $.extend(String.prototype, {
        isPositiveInteger: function () {
            return (new RegExp(/^[1-9]\d*$/).test(this));
        },
        isInteger: function () {
            return (new RegExp(/^\d+$/).test(this));
        },
        isNumber: function (value, element) {
            return (new RegExp(/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/)
                .test(this));
        },
        trim: function () {
            return this.replace(/(^\s*)|(\s*$)|\r|\n/g, "");
        },
        trans: function () {
            return this.replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(
                /&quot;/g, '"');
        },
        replaceAll: function (os, ns) {
            return this.replace(new RegExp(os, "gm"), ns);
        },
        replaceTm: function ($data) {
            if (!$data)
                return this;
            return this.replace(RegExp("({[A-Za-z_]+[A-Za-z0-9_]*})", "g"),
                function ($1) {
                    return $data[$1.replace(/[{}]+/g, "")];
                });
        },
        replaceTmById: function (_box) {
            var $parent = _box || $(document);
            return this.replace(RegExp("({[A-Za-z_]+[A-Za-z0-9_]*})", "g"),
                function ($1) {
                    var $input = $parent.find("#"
                        + $1.replace(/[{}]+/g, ""));
                    return $input.size() > 0 ? $input.val() : $1;
                });
        },
        isFinishedTm: function () {
            return !(new RegExp("{[A-Za-z_]+[A-Za-z0-9_]*}").test(this));
        },
        skipChar: function (ch) {
            if (!this || this.length === 0) {
                return '';
            }
            if (this.charAt(0) === ch) {
                return this.substring(1).skipChar(ch);
            }
            return this;
        },
        isValidPwd: function () {
            return (new RegExp(/^([_]|[a-zA-Z0-9]){6,32}$/).test(this));
        },
        isValidMail: function () {
            return (new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)
                .test(this.trim()));
        },
        isSpaces: function () {
            for (var i = 0; i < this.length; i += 1) {
                var ch = this.charAt(i);
                if (ch != ' ' && ch != "\n" && ch != "\t" && ch != "\r") {
                    return false;
                }
            }
            return true;
        },
        isPhone: function () {
            return (new RegExp(/(^([0-9]{3,4}[-])?\d{3,8}(-\d{1,6})?$)|(^\([0-9]{3,4}\)\d{3,8}(\(\d{1,6}\))?$)|(^\d{3,8}$)/)
                .test(this));
        },
        isUrl: function () {
            return (new RegExp(/^[a-zA-z]+:\/\/([a-zA-Z0-9\-\.]+)([-\w .\/?%&=:]*)$/)
                .test(this));
        },
        isExternalUrl: function () {
            return this.isUrl() && this.indexOf("://" + document.domain) == -1;
        }
    });

    /**
     * date
     */
    $.extend(Date.prototype, {
        // 将指定的毫秒数加到此实例的值上
        addMilliseconds: function (value) {
            var millisecond = this.getMilliseconds();
            this.setMilliseconds(millisecond + value);
            return this;
        },
        // 将指定的秒数加到此实例的值上
        addSeconds: function (value) {
            var second = this.getSeconds();
            this.setSeconds(second + value);
            return this;
        },
        // 将指定的分钟数加到此实例的值上
        addMinutes: function (value) {
            var minute = this.addMinutes();
            this.setMinutes(minute + value);
            return this;
        },
        // 将指定的小时数加到此实例的值上
        addHours: function (value) {
            var hour = this.getHours();
            this.setHours(hour + value);
            return this;
        },
        // 将指定的天数加到此实例的值上
        addDays: function (value) {
            var date = this.getDate();
            this.setDate(date + value);
            return this;
        },
        // 将指定的星期数加到此实例的值上
        addWeeks: function (value) {
            return this.addDays(value * 7);
        },
        // 将指定的月份数加到此实例的值上
        addMonths: function (value) {
            var month = this.getMonth();
            this.setMonth(month + value);
            return this;
        },
        // 将指定的年份数加到此实例的值上
        addYears: function (value) {
            var year = this.getFullYear();
            this.setFullYear(year + value);
            return this;
        },
        // 格式化日期显示 format="yyyy-MM-dd hh:mm:ss";
        format: function (format) {
            var o = {
                "M+": this.getMonth() + 1, // month
                "d+": this.getDate(), // day
                "h+": this.getHours(), // hour
                "m+": this.getMinutes(), // minute
                "s+": this.getSeconds(), // second
                "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
                "S": this.getMilliseconds()
                // millisecond
            };
            if (/(y+)/.test(format)) {
                format = format.replace(RegExp.$1, (this.getFullYear() + "")
                    .substr(4 - RegExp.$1.length));
            }
            for (var k in o) {
                if (new RegExp("(" + k + ")").test(format)) {
                    format = format.replace(RegExp.$1, RegExp.$1.length == 1
                        ? o[k]
                        : ("00" + o[k]).substr(("" + o[k]).length));
                }
            }
            return format;
        }
    });

    $.alert = function (msg, fnOK) {

        if ($(".alertmsgbox").length == 0) {
            $(document.body)
                .append("<div class='modal hide fade alertmsgbox' tabindex='-1' data-backdrop='static'><div class='modal-body'></div><div class='modal-footer'><a href='#' class='btn btn-small btn-info ok'>确定</a></div></div>");
        }
        if (msg) {
            $(".alertmsgbox .modal-body").html("<p>" + msg + "</p>");
        }
        $(".alertmsgbox .modal-footer .ok").unbind("click");
        $(".alertmsgbox .modal-footer .ok").bind("click", function (event) {

            $(".alertmsgbox").modal('hide');
            if ($.isFunction(fnOK)) {
                fnOK();
            }
            event.preventDefault();
        });
        $(".alertmsgbox").modal('show');
    };


    $.infoMsg = function (selector, msg, settings) {
        var defaults = {
            closed: true
        };
        settings = $.extend({}, defaults, settings);

        var d = $("<div></div>").addClass("alert").addClass("alert-success");

        var t = '<button type="button" class="close" data-dismiss="alert">&times;</button>';
        $(d).html(t + msg);
        $(selector).html(d);
        $(selector).show("slow");
        window.setTimeout(function () {
            if (settings.closed) {
                $(selector).hide("slow");
            }

        }, 2000);
    };

    $.errorMsg = function (selector, msg, settings) {

        var defaults = {
            closed: true
        };
        settings = $.extend({}, defaults, settings);

        var d = $("<div></div>").addClass("alert").addClass("alert-error");

        var t = '<button type="button" class="close" data-dismiss="alert">&times;</button>';
        $(d).html(t + msg);
        $(selector).html(d);
        $(selector).show("slow");
        window.setTimeout(function () {
            if (settings.closed) {
                $(selector).hide("slow");
            }
        }, 2000);
    };

    $.confirm = function (msg, fnOK, fnCancel) {
        if ($(".confirmmsgbox").length == 0) {
            $(document.body)
                .append("<div class='modal hide fade confirmmsgbox' tabindex='-1'  data-backdrop='static'><div class='modal-body'></div><div class='modal-footer'><a href='#' class='btn btn-small btn-primary ok'>确定</a><a href='#' class='btn btn-small cancel'>关闭</a></div></div>");
        }
        if (msg) {
            $(".confirmmsgbox .modal-body").html("<p>" + msg + "</p>");
        }
        $(".confirmmsgbox .modal-footer .ok").unbind("click");
        $(".confirmmsgbox .modal-footer .ok").bind("click", function (event) {

            $(".confirmmsgbox").modal('hide');
            if ($.isFunction(fnOK)) {
                fnOK();
            }
            event.preventDefault();
        });
        $(".confirmmsgbox .modal-footer .cancel").bind("click",
            function (event) {

                $(".confirmmsgbox").modal('hide');
                if ($.isFunction(fnCancel)) {
                    fnCancel();
                }
                event.preventDefault();
            });
        $(".confirmmsgbox").modal('show');
    };

    $.dialog = function (settings) {
        var defaults = {
            id: "default_",
            url: "",
            data: {},
            container: false,
            width: "560px"
        };
        settings = $.extend({}, defaults, settings);
        var $p;
        if (!_dialogStack.containsKey(settings.id)) {
            $(document.body)
                .append("<div rel='"
                    + settings.id
                    + "' class='modal hide fade' tabindex='-1' data-backdrop='static'></div>");

            $p = $("div[rel='" + settings.id + "']");
            _dialogStack.put(settings.id, $p);
        } else {
            $p = _dialogStack.get(settings.id);
        }

        $.ajax({
            url: settings.url,
            data: settings.data,
            cache: false,
            async: false,
            dataType: "html",
            success: function (data) {
                $p.html(data);

                initUDF($p);
            }
        });

        if (settings.container) {
            $p.addClass("container");
        } else {
            $p.attr("data-width", settings.width);
        }
        $p.modal("show");

    };

    $.getDialog = function (id) {
        return _dialogStack.get(id);
    };

    // 表单重置函数
    $.resetForm = function (form) {
        var $form = $(form);
        $form.find("input").each(function (i, n) {
            var t = $(n).attr("type");
            if (t == "text" || t == "password") {
                $(n).attr("value", "");
            }
        });
        $form.find("textarea").each(function (i, n) {
            $(n).text("");
        });
    };

    //格式化字符串用
    /*调用方法
     var text = "a{0}b{0}c{1}d\nqq{0}";
     var p =[1,2];
     var text2 = $.format(text, p);
     alert(text2);
     */
    $.format = function (source, params) {
        if (arguments.length == 1)
            return function () {
                var args = $.makeArray(arguments);
                args.unshift(source);
                return $.format.apply(this, args);
            };
        if (arguments.length > 2 && params.constructor != Array) {
            params = $.makeArray(arguments).slice(1);
        }
        if (params.constructor != Array) {
            params = [params];
        }
        $.each(params, function (i, n) {
            source = source.replace(new RegExp("\\{" + i + "\\}", "g"), n);
        });
        return source;
    };


})(jQuery);

// 应用扩展
(function ($) {

})(jQuery);

/**
 * You can use this map like this: var myMap = new Map();
 * myMap.put("key","value"); var key = myMap.get("key"); myMap.remove("key");
 */
function Map() {

    this.elements = new Array();

    this.size = function () {
        return this.elements.length;
    };

    this.isEmpty = function () {
        return (this.elements.length < 1);
    };

    this.clear = function () {
        this.elements = new Array();
    };

    this.put = function (_key, _value) {
        this.remove(_key);
        this.elements.push({
            key: _key,
            value: _value
        });
    };

    this.remove = function (_key) {
        try {
            for (i = 0; i < this.elements.length; i++) {
                if (this.elements[i].key == _key) {
                    this.elements.splice(i, 1);
                    return true;
                }
            }
        } catch (e) {
            return false;
        }
        return false;
    };

    this.get = function (_key) {
        try {
            for (i = 0; i < this.elements.length; i++) {
                if (this.elements[i].key == _key) {
                    return this.elements[i].value;
                }
            }
        } catch (e) {
            return null;
        }
    };

    this.element = function (_index) {
        if (_index < 0 || _index >= this.elements.length) {
            return null;
        }
        return this.elements[_index];
    };

    this.containsKey = function (_key) {
        try {
            for (i = 0; i < this.elements.length; i++) {
                if (this.elements[i].key == _key) {
                    return true;
                }
            }
        } catch (e) {
            return false;
        }
        return false;
    };

    this.values = function () {
        var arr = new Array();
        for (i = 0; i < this.elements.length; i++) {
            arr.push(this.elements[i].value);
        }
        return arr;
    };

    this.keys = function () {
        var arr = new Array();
        for (i = 0; i < this.elements.length; i++) {
            arr.push(this.elements[i].key);
        }
        return arr;
    };
}
function copyProperties(to, from) {
    if (!to || !from) {
        return;
    }
    if ($.isArray(to) && $.isArray(from)) {
        $.each(from, function (i, n) {
            var flag = false;
            $.each(to, function (j, m) {
                if (n.name == m.name) {
                    m.value = n.value;
                    flag = true;
                    return;
                }
            });
            if (!flag) {
                to.push(n);
            }
            return;
        });
        return to;
    }
}

/*
 * I think it can work for Chinese Users.
 * Lewis Lv lzlhero@gmail.com
 */
;(function ($) {
    if ($.fn.textbox) {
        return;
    }
    $.fn.textbox = function (settings) {
        var defaults = {
            maxLength: -1,
            onInput: null,
            _pasteHandler: function (event) {
                var textarea = this;
                window.setTimeout(function () {
                    inputHandler.call(textarea, event);
                }, 0);
            },
            _cutHandler: function (event) {
                var textarea = this;
                window.setTimeout(function () {
                    inputHandler.call(textarea, event);
                }, 0);
            },
            _keyupHandler: function (event) {
                if (opts.maxLength < 0) {
                    if ($.isFunction(opts.onInput)) {
                        opts.onInput.call(this, event, {maxLength: opts.maxLength, leftLength: -1});
                    }
                }
                else {
                    inputHandler.call(this, event);
                }
            },
            _blurHandler: function (event) {
                fixLength(this);
            }
        };
        var opts = $.extend(defaults, settings);
// This is the prefect get caret position function.
// You can use it cross browsers.
        function getInsertPos(textbox) {
            var iPos = 0;
            if (textbox.selectionStart || textbox.selectionStart == "0") {
                iPos = textbox.selectionStart;
            }
            else if (document.selection) {
                textbox.focus();
                var range = document.selection.createRange();
                var rangeCopy = range.duplicate();
                rangeCopy.moveToElementText(textbox);
                while (range.compareEndPoints("StartToStart", rangeCopy) > 0) {
                    range.moveStart("character", -1);
                    iPos++;
                }
            }
            return iPos;
        }

// This is the prefect set caret position function.
// You can use it cross browsers.
        function setInsertPos(textbox, iPos) {
            textbox.focus();
            if (textbox.selectionStart || textbox.selectionStart == "0") {
                textbox.selectionStart = iPos;
                textbox.selectionEnd = iPos;
            }
            else if (document.selection) {
                var range = textbox.createTextRange();
                range.moveStart("character", iPos);
                range.collapse(true);
                range.select();
            }
        }

        function isGreateMaxLength(strValue, strDelete) {
            if (opts.maxLength > 0) {
                return strValue.replace(/\r/g, "").length - (strDelete ? strDelete.replace(/\r/g, "").length : 0) > opts.maxLength;
            }
            else {
                return false;
            }
        }

        function fixLength(textbox) {
            if (opts.maxLength > 0) {
                var strValue = textbox.value.replace(/\r/g, "");
                if (isGreateMaxLength(strValue)) {
                    textbox.value = strValue.substr(0, opts.maxLength);
                }
            }
        }

        function inputHandler(event) {
            var strValue = this.value.replace(/\r/g, "");
            if (isGreateMaxLength(strValue)) {
                var scrollTop = this.scrollTop;
                var iInsertToStartLength = getInsertPos(this) - (strValue.length - opts.maxLength);
                this.value = strValue.substr(0, iInsertToStartLength) + strValue.substr(getInsertPos(this));
                setInsertPos(this, iInsertToStartLength);
                this.scrollTop = scrollTop;
            }
            if ($.isFunction(opts.onInput)) {
// callback for input handler
                opts.onInput.call(this, event, {
                    maxLength: opts.maxLength,
                    leftLength: opts.maxLength - this.value.replace(/\r/g, "").length
                });
            }
        };
        function getSelectedText(textbox) {
            var strText = "";
            if (textbox.selectionStart || textbox.selectionStart == "0") {
                strText = textbox.value.substring(textbox.selectionStart, textbox.selectionEnd);
            }
            else {
                strText = document.selection.createRange().text;
            }
            return strText.replace(/\r/g, "");
        }

        function unbindEvents(textbox, opts) {
            $(textbox)
                .unbind("paste", opts._pasteHandler)
                .unbind("cut", opts._cutHandler)
                .unbind("keyup", opts._keyupHandler)
                .unbind("blur", opts._blurHandler);
        }

        function bindEvents(textbox, opts) {
            var $textbox = $(textbox);
            if (opts.maxLength < 0) {
                $textbox.bind("keyup", opts._keyupHandler);
            }
            else {
                $textbox
                    .bind("paste", opts._pasteHandler)
                    .bind("cut", opts._cutHandler)
                    .bind("keyup", opts._keyupHandler)
                    .bind("blur", opts._blurHandler);
                fixLength(textbox);
            }
        }

        this.maxLength = function (maxLength) {
            if (maxLength) {
                opts.maxLength = maxLength;
                return this.filter("textarea").each(function () {
                    unbindEvents(this, $(this).data("textbox-opts"));
                    $(this).data("textbox-opts", opts);
                    bindEvents(this, opts);
                }).end();
            }
            else {
                return opts.maxLength;
            }
        };
        this.input = function (callback) {
            if ($.isFunction(callback)) {
                opts.onInput = callback;
                return this.filter("textarea").each(function () {
                    $(this).data("textbox-opts", opts);
                }).end();
            }
            return this;
        };
        this.fixLength = function () {
            return this.filter("textarea").each(function () {
                fixLength(this);
            }).end();
        };
        this.insertText = function (strText) {
            strText = strText.replace(/\r/g, "");
            return this.filter("textarea").each(function () {
                if (!isGreateMaxLength(this.value + strText, getSelectedText(this))) {
                    if (this.selectionStart || this.selectionStart == "0") {
                        var startPos = this.selectionStart;
                        var endPos = this.selectionEnd;
                        var scrollTop = this.scrollTop;
                        this.value = this.value.substring(0, startPos) +
                            strText + this.value.substring(endPos, this.value.length);
                        this.focus();
                        var cPos = startPos + strText.length;
                        this.selectionStart = cPos;
                        this.selectionEnd = cPos;
                        this.scrollTop = scrollTop;
                    }
                    else if (document.selection) {
                        this.focus();
                        var range = document.selection.createRange();
                        range.text = strText;
                        range.collapse(true);
                        range.select();
                    }
// fired when insert text has finished
                    if ($.isFunction(opts.onInput)) {
                        opts.onInput.call(this, {type: "insert"}, {
                            maxLength: opts.maxLength,
                            leftLength: opts.maxLength - this.value.replace(/\r/g, "").length
                        });
                    }
                }
            }).end();
        };
        return this.filter("textarea").each(function () {
            var $textbox = $(this);
            if (settings) {
                if ($textbox.data("textbox-opts")) {
                    unbindEvents(this, $textbox.data("textbox-opts"));
                    $textbox.data("textbox-opts", opts);
                    bindEvents(this, opts);
                }
                else {
                    $textbox.data("textbox-opts", opts);
                    bindEvents(this, opts);
                }
            }
            else {
                if ($textbox.data("textbox-opts")) {
                    opts = $textbox.data("textbox-opts");
                }
            }
        }).end();
    };
})(jQuery);

/**
 * 界面默认初始化
 */
if ($.browser.msie && /6.0/.test(navigator.userAgent)) {
    try {
        document.execCommand("BackgroundImageCache", false, true);
    } catch (e) {
    }
}
//清理浏览器内存,只对IE起效
if ($.browser.msie) {
    window.setInterval("CollectGarbage();", 10000);
}

// 设置全局ajax的默认参数
$.ajaxSetup({
    async: true,
    type: "POST",
    dataType: "json",
    cache: false,
    error: function (XMLHttpRequest, textStatus, errorThrown) {

        alert(textStatus + "  " + errorThrown);
    },
    dataFilter: function (data, type) {

        if (data.indexOf("_nomsg") != -1) {
            var t = AKF.jsonEval(data);
            if (t._nomsg == "nologin") {
                alert("用户没有登录，请刷新界面并重新登录！");
                return;
            }
        }

        return data;
    }
});


/**
 * 整个系统的UI初始化
 *
 * @param {}
 *            _box
 */
function initUDF(_box) {

    var $p = $(_box || document);

    $("button[type='reset']", $p).click(function (e) {
        $.resetForm($(this).closest("form"));
        e.preventDefault();
    });
}

var ajaxbg = $("#background,#progressBar");
ajaxbg.hide();
$(document).ajaxStart(function () {
    ajaxbg.show();
}).ajaxStop(function () {
        ajaxbg.hide();
    });

initUDF();
var _dialogStack = new Map();

