$(function () {

    $("#sub").click(function (e) {

        $this = $(this);
        var param = AKF.formParams($("#chpwdForm"));
        if ($("#chpwdForm").validation()) {

            if ($("input[name='newpassword']").val() != $("input[name='confirmpassword']").val()) {
                $.errorMsg($("#msg"), "确认新密码不正确！");
                $("input[name='confirmpassword']").attr("value", "");
                $("input[name='confirmpassword']").focus();
            } else {
                $this.text("修改中，请稍候。。。");
                $this.attr("disabled", true);
                $.ajax({
                    url: "${_BASE_PATH}/admin/updatePassword",
                    data: param,
                    success: function (result) {

                        if (result.akfstate == "0") {
                            $.errorMsg($("#msg"), result.result);
                            $("input[name='oldpassword']").attr("value", "");
                            $("input[name='oldpassword']").focus();
                        } else {
                            $.infoMsg($("#msg"), "修改成功！");
                        }
                        $this.text("修改密码");
                        $this.attr("disabled", false);
                    }
                })
            }
        }
        e.preventDefault();
    });
});