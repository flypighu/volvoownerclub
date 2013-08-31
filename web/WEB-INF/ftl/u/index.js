$(function () {

    $("#follows").click(function (e) {

        e.preventDefault();

        if (!isLogin) {
            $.confirm("请先登录，然后才能关注此人！", function () {
                window.location.href = "/u/login";
            });
            return;
        }

        $this = $(this);
        $.ajax({

            url: "/u/follow",
            data: {fid: $this.attr("rel")},
            success: function (result) {

                if (result.msg) {
                    $.alert(result.msg);
                    return;
                }
                $.alert("关注" + result.f_name + "成功！");
            }
        });
    });
});
