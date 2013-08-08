$(function () {

    var getTop5Tweets = function(){

        $.ajax({
            url: "${_BASE_PATH}/dongtan/top5",
            dataType : "html",
            success: function (result) {

                $(".TopTweets").empty();
                $(".TopTweets").append(result);
            }
        })
    };
    /**
     * 新增动弹
     */
    $("#postDT").click(function (e) {

        var $this = $(this);
        if ($("#dongtanTxt").val().trim() == "") {
            $.errorMsg($("#msg"), "请输入内容！");
        } else if (isLogin == "false") {
            $.errorMsg($("#msg"), "请先登录！");
        } else {
            $.ajax({
                url: "${_BASE_PATH}/dongtan/add",
                data: {txt: $("#dongtanTxt").val()},
                dataType : "html",
                success: function (result) {

                    $("#dongtanTxt").val("");
                    $(".TopTweets").find("li:last").remove();
                    $(".TopTweets").prepend(result);
                }
            })
        }
        e.preventDefault();
    });

    if(isLogin){
        window.setInterval(function () {
            getTop5Tweets();
        }, 5000);
    }

});