$(function () {

    var config = {
        resizeType: 1,
        urlType: 'domain',
        shadowMode: false,
        allowPreviewEmoticons: false,
        uploadJson: '${_BASE_PATH}/admin/uploadReleasesImg',
        afterChange: function () {
            this.sync();
        },
        items: ['bold', 'italic', 'underline', 'strikethrough', 'removeformat', '|', 'insertorderedlist', 'insertunorderedlist',
            'forecolor', 'hilitecolor', 'fontname', 'fontsize', '|', 'link', 'unlink', 'emoticons',
            'image', 'flash', 'quote', '|', 'source', 'fullscreen', 'about'],
        htmlTags: {
            script: ['src'],
            font: ['color', 'size', 'face', '.background-color'],
            span: [
                '.color', '.background-color', '.font-size', '.font-family', '.background',
                '.font-weight', '.font-style', '.text-decoration', '.vertical-align', '.line-height'
            ],
            div: [
                'class', 'align', '.border', '.margin', '.padding', '.text-align', '.color',
                '.background-color', '.font-size', '.font-family', '.font-weight', '.background',
                '.font-style', '.text-decoration', '.vertical-align', '.margin-left'
            ],
            table: [
                'border', 'cellspacing', 'cellpadding', 'width', 'height', 'align', 'bordercolor',
                '.padding', '.margin', '.border', 'bgcolor', '.text-align', '.color', '.background-color',
                '.font-size', '.font-family', '.font-weight', '.font-style', '.text-decoration', '.background',
                '.width', '.height', '.border-collapse'
            ],
            'td,th': [
                'align', 'valign', 'width', 'height', 'colspan', 'rowspan', 'bgcolor',
                '.text-align', '.color', '.background-color', '.font-size', '.font-family', '.font-weight',
                '.font-style', '.text-decoration', '.vertical-align', '.background', '.border'
            ],
            a: ['href', 'target', 'name'],
            embed: ['src', 'width', 'height', 'type', 'loop', 'autostart', 'quality', '.width', '.height', 'align', 'allowscriptaccess'],
            img: ['src', 'width', 'height', 'border', 'alt', 'title', 'align', '.width', '.height', '.border'],
            'p,ol,ul,li,blockquote,h1,h2,h3,h4,h5,h6': [
                'align', '.text-align', '.color', '.background-color', '.font-size', '.font-family', '.background',
                '.font-weight', '.font-style', '.text-decoration', '.vertical-align', '.text-indent', '.margin-left'
            ],
            pre: ['class'],
            hr: ['class', '.page-break-after'],
            'br,tbody,tr,strong,b,sub,sup,em,i,u,strike,s,del': []
        }
    };

    var postEditor,replayEditor;

//    KindEditor.ready(function (K) {
//        postEditor = K.create('#cftxt',config);
//        replayEditor = K.create('#cftxt_reply',config);
//    });

    /**
     * 回复关闭
     */
    $("#cfclose_reply").click(function (e) {

        $this = $(this);
        e.preventDefault();
        $("#div_reply").hide();
    });

    /**
     * 绑定所有回复此评论
     */
    $("div.comments ul > li a.reply").live("click", function () {

        $this = $(this);
        $this.closest("td").append($("#div_reply"));
        $("#div_reply input[name='commentid']").val($this.attr("rel"));
        $("#div_reply").show();
    });

    /**
     * 发表评论
     */
    $("#cfbtn").click(function (e) {

        $this = $(this);
        e.preventDefault();

        if ($.trim($("#cftxt").val()) == "") {
            alert("请输入评论内容");
            return;
        } else {
            $this.text("评论信息提交中，请稍候。。。");
            $this.attr("disabled", true);
            var d = AKF.formParams($("#cf"));
            d.push({
                "name": "index",
                "value": $("div.comments ul > li").length
            });
            $.ajax({
                url: "${_BASE_PATH}/discuss/comment",
                data: d,
                dataType: "html",
                success: function (result) {

                    $this.text("发表评论");
                    $this.attr("disabled", false);
                    if (result.indexOf("nologin") != -1) {

                        alert("请先登录，在评论");
                        return;
                    } else {

                        $("div.comments ul").append(result);
                    }

                }
            });
        }
    });


    /**
     * 发表回复
     */
    $("#cfbtn_reply").click(function (e) {

        $this = $(this);
        e.preventDefault();
        if ($.trim($("#cftxt_reply").val()) == "") {
            alert("请输入回复内容");
            return;
        } else {
            $this.text("回复信息提交中，请稍候。。。");
            $this.attr("disabled", true);

            var ref = "<div class='ref'><h4>引用来自“"
                + $this.closest("td").find("div.r_title b").text()
                + "“的评论</h4><p>"
                + $this.closest("td").find("div.r_content").html()
                + "</p></div>";


            $.ajax({
                url: "${_BASE_PATH}/discuss/comment_reply",
                data: {
                    postid : $("#cf_reply input[name='postid']").val(),
                    commentid : $("#cf_reply input[name='commentid']").val(),
                    r : ref,
                    txt : $("#cftxt_reply").val(),
                    index : $("div.comments ul > li").length
                },
                dataType: "html",
                success: function (result) {

                    $this.text("回复");
                    $this.attr("disabled", false);
                    if (result.indexOf("nologin") != -1) {

                        alert("请先登录，在回复");
                        return;
                    } else {

                        $("#cftxt_reply").val("");
                        $("div.comments ul").append(result);
                        $("#div_reply").hide();
                    }

                }
            });
        }
    });
});