$(function () {

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
                url: "${_BASE_PATH}/news/comment",
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
                url: "${_BASE_PATH}/news/comment_reply",
                data: {
                    newsid : $("#cf_reply input[name='newsid']").val(),
                    commentid : $("#cf_reply input[name='commentid']").val(),
                    r : ref,
                    rs : $(ref).text(),
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
});