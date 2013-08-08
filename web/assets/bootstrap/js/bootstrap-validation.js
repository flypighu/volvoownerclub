/* =========================================================
 * bootstrap-validation.js 
 * Original Idea: http:/www.newkou.org (Copyright 2012 Stefan Petre)
 * Updated by 不会飞的羊 (https://github.com/FateSheep/Validation-for-Bootstrap)
 * =========================================================
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================= */
!function ($) {
    $.fn.validation = function (options) {
        globalOptions = $.extend({}, $.fn.validation.defaults, options);
        return validationForm(this);
    };

    $.fn.validation.defaults = {
        validRules: [
            {
                name: 'required',
                validate: function (value) {
                    return ($.trim(value) == '');
                },
                defaultMsg: '请输入内容。'
            },
            {
                name: 'number',
                validate: function (value) {
                    if ($.trim(value) == '') {
                        return false;
                    }
                    return (!/^[0-9]\d*$/.test(value));
                },
                defaultMsg: '请输入数字。'
            },
            {
                name: 'mail',
                validate: function (value) {
                    if ($.trim(value) == '') {
                        return false;
                    }
                    return (!/^[a-zA-Z0-9]{1}([\._a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+){1,3}$/
                        .test(value));
                },
                defaultMsg: '请输入邮箱地址。'
            },
            {
                name: 'char',
                validate: function (value) {
                    if ($.trim(value) == '') {
                        return false;
                    }
                    return (!/^[a-z\_\-A-Z]*$/.test(value));
                },
                defaultMsg: '请输入英文字符。'
            },
            {
                name: 'chinese',
                validate: function (value) {
                    if ($.trim(value) == '') {
                        return false;
                    }
                    return (!/^[\u4e00-\u9fff]$/.test(value));
                },
                defaultMsg: '请输入汉字。'
            },
            {
                name: 'ip',
                validate: function (value) {
                    if ($.trim(value) == '') {
                        return false;
                    }
                    var re = /^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g //匹配IP地址的正则表达式
                    if (re.test(value)) {
                        if (RegExp.$1 < 256 && RegExp.$2 < 256 && RegExp.$3 < 256 && RegExp.$4 < 256) return false;
                    }

                    return true;
                },
                defaultMsg: '请输入正确的IP。'
            },
            {
                name: 'rage',
                validate: function (value, params) {
                    if ($.trim(value) == '') {
                        return false;
                    }
                    return  (!(value >= params[0] && value <= params[1]));
                },
                defaultMsg: '输入的值必须在 {0} 和 {1} 之间。',
                desc: '用法'
            }
        ]
    };

    var fieldState = false, wFocus = false, globalOptions = {};

    var validateField = function (field, valid) { // 验证字段

        var el = $(field), error = false, errorMsg = '', params = [];

        for (i = 0; i < valid.length; i++) {
            var x = true, flag = valid[i], msg = (el.attr(flag + '-message') == undefined) ? null
                : el.attr(flag + '-message');

            if (flag.substr(0, 1) == '!') {
                x = false;
                flag = flag.substr(1, flag.length - 1);
            }

            var ff = flag.split(":");
            if (ff.length > 1) {
                params = eval(ff[1]);
                flag = ff[0];
            }


            var rules = globalOptions.validRules;
            for (j = 0; j < rules.length; j++) {
                var rule = rules[j];
                if (flag == rule.name) {
                    if (rule.validate.call(field, el.val(), params) == x) {
                        error = true;
                        errorMsg = (msg == null) ? rule.defaultMsg : msg;
                        errorMsg = $.format(errorMsg, params);
                        break;
                    }
                }
            }

            if (error) {
                break;
            }
        }

        var controls = el.parents('.controls'), controlGroup = el
            .parents('.control-group'), errorEl = controls
            .children('.help-block, .help-inline');

        if (error) {
            if (!controlGroup.hasClass('error')) {
                if (errorEl.length > 0) {
                    var help = errorEl.text();
                    controls.data('help-message', help);
                    errorEl.text(errorMsg);
                } else {
                    controls.append('<span class="help-inline">' + errorMsg
                        + '</span>');
                }
                controlGroup.addClass('error');
            }
        } else {
            if (fieldState) {
                if (errorEl.length > 0) {
                    var help = controls.data('help-message');
                    if (help == undefined) {
                        errorEl.remove();
                    } else {
                        errorEl.text(help);
                    }
                }
                controlGroup.attr('class', 'control-group');
            } else {
                if (errorEl.length > 0) {
                    var help = errorEl.text();
                    controls.data('help-message', help);
                }
            }
        }
        return !error;
    };

    var validationForm = function (obj) { // 表单验证方法

        var validationError = false;
        $('input, textarea', obj)
            .each(
            function () {
                var el = $(this), valid = (el.attr('check-type') == undefined) ? null
                    : el.attr('check-type').split(' ');
                if (valid != null && valid.length > 0) {
                    if (!validateField(el, valid)) {
                        if (wFocus == false) {
                            scrollTo(0, el[0].offsetTop - 60);
                            wFocus = true;
                        }

                        validationError = true;
                    }
                }
            });

        wFocus = false;

        if (validationError) {

            $('input, textarea', obj)
                .each(
                function () {
                    var el = $(this), valid = (el
                        .attr('check-type') == undefined) ? null
                        : el.attr('check-type').split(' ');
                    if (valid != null && valid.length > 0) {
                        el
                            .focus(function () { // 获取焦点时
                                var controls = el
                                    .parents('.controls'), controlGroup = el
                                    .parents('.control-group'), errorEl = controls
                                    .children('.help-block, .help-inline');
                                if (errorEl.length > 0) {
                                    var help = controls
                                        .data('help-message');
                                    if (help == undefined) {
                                        errorEl.remove();
                                    } else {
                                        errorEl.text(help);
                                    }
                                }
                                controlGroup.attr('class',
                                    'control-group');
                            });

                        el.blur(function () { // 失去焦点时
                            validateField(this, valid);
                        });
                    }
                });

            return false;
        }

        return true;

    };
}(window.jQuery);