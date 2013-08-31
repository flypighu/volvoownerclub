$(function () {

    $("input[name='email']").focus();

    showcity("福建", document.getElementById('userCity'));

    showcar("沃尔沃C30", document.getElementById('carPz'));

    $("#sub").click(function (e) {

        $this = $(this);
        var param = AKF.formParams($("#registerForm"));
        if ($("#registerForm").validation()) {

            $this.text("注册中，请稍候。。。");
            $this.attr("disabled", true);
            $.ajax({
                url: "${_BASE_PATH}/u/doRegister",
                data: param,
                success: function (result) {

                    if (result.error) {

                        $.alert(result.error);
                        $this.text("注册新用户");
                        $this.removeAttr("disabled");
                    } else {
                        $("#registerForm").empty();
                        $("#registerForm").append("<p class='text-center'>注册邮件已经发出，请耐心等待管理员审核，一般1个工作日即可，或者可以直接联系车友会的<a href='mailto:flypighu@163.com'>福州屌丝胡</a></p>");
                    }

                }
            })
        }

        e.preventDefault();
    });
});