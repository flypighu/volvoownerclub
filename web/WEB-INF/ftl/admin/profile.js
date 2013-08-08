$(function(){

    $("#sub").click(function(e){

        $this = $(this);
        var param = AKF.formParams($("#profileForm"));
        if ($("#profileForm").validation()) {

            $this.text("修改中，请稍候。。。");
            $this.attr("disabled",true);
            $.ajax({
                url: "${_BASE_PATH}/admin/updateProfile",
                data: param,
                success: function (result) {

                    $.infoMsg($("#msg"),"修改成功！");
                    $this.text("保存修改");
                    $this.attr("disabled",false);
                }
            })
        }
        e.preventDefault();
    });
});