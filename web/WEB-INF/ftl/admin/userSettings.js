$(function () {

    $("#sub").click(function (e) {

        $this = $(this);
        var param = AKF.formParams($("#setForm"));
        if ($("#setForm").validation()) {

            $this.text("保存中，请稍候。。。");
            $this.attr("disabled", true);
            $.ajax({
                url: "${_BASE_PATH}/admin/updateUserSettings",
                data: param,
                success: function (result) {

                    if (result.errormsg) {
                        $.errorMsg($("#msg"), result.errormsg);
                    } else {

                        $.infoMsg($("#msg"), "修改成功！");
                        $this.text("保存修改");
                        $this.attr("disabled", false);
                        $("input[name = 'url']").val(result.url);
                    }

                }
            })
        }
        e.preventDefault();
    });
});