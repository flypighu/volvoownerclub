$(function () {

    $("input[name='email']").focus();

    showcity("北京", document.getElementById('userCity'));

    $("#sub").click(function (e) {

        $this = $(this);
        var param = AKF.formParams($("#registerForm"));
        if ($("#registerForm").validation()) {

            $this.text("注册中，请稍候。。。");
            $this.removeClass("btn-success");
            $.ajax({
                url: "${_BASE_PATH}/u/doRegister",
                data: param,
                success: function (result) {

                    $("#registerForm").empty();
                    $("#registerForm").append("<p>注册邮件已经发出，请登录邮箱查收。谢谢！</p>");
                }
            })
        }

        e.preventDefault();
    });
});