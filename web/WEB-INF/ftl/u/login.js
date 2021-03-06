$(function () {

    $("input[name='email']").focus();

    $("#sub").click(function (e) {

        e.preventDefault();

        $this = $(this);
        var param = AKF.formParams($("#loginForm"));
        if($("input[name='remindme']").attr("checked") == "checked") {
            param.push({
                name : "remindme",
                value : "true"
            })
        }
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

    });
});