$(function () {

    $("input[name='email']").focus();

    $("#sub").click(function (e) {

        $this = $(this);
        var param = AKF.formParams($("#loginForm"));
        if ($("#loginForm").validation()) {

            $this.text("登录中，请稍候。。。");
            $this.attr("disabled",true);
            $.ajax({
                url: "${_BASE_PATH}/u/doLogin",
                data: param,
                success: function (result) {

                    if (result.akfstate == "0") {

                        $.errorMsg($("#msg"), result.result, {closed: false});
                        $this.text("登录");
                        $this.attr("disabled",false);
                    } else {
                        window.location.href = "${_BASE_PATH}/";
                    }

                }
            })
        }

        e.preventDefault();
    });
});