$(function () {

    var showCoords = function (c) {
        $('#img_left').val(c.x);
        $('#img_top').val(c.y);
        $('#img_width').val(c.w);
        $('#img_height').val(c.h);
    };

    $("#sub").click(function (e) {

        $this = $(this);

        if ($("#fileToUpload").val() == "") {
            $.errorMsg($("#msg"), "请选择图片文件！");
        } else {
            $this.text("图片上传中，请稍候。。。");
            $this.attr("disabled", true);
            $.ajaxFileUpload({
                    url: '${_BASE_PATH}/admin/uploadportrait',
                    secureuri: false,
                    fileElementId: 'fileToUpload',
                    dataType: 'json',
                    success: function (data, status) {
                        if (typeof(data.error) != 'undefined') {
                            if (data.error != '') {
                                alert(data.error);
                                $this.text("上传图片，请稍候。。。");
                                $this.attr("disabled", false);
                            } else {
                                $("#uploaddiv").hide();
                                $("#uploadimg").attr("width", data.w);
                                $("#uploadimg").attr("height", data.h);
                                $("#uploadimg").attr("src", "${_BASE_PATH}" + data.msg);
                                $("#uploadimg").show();
                                $("#img_fn").val(data.fn);
                                $('#uploadimg').ready(function(){
                                    $('#uploadimg').Jcrop({
                                        setSelect: [ 10, 10, 210, 210 ],
                                        aspectRatio: 1,
                                        onChange: showCoords,
                                        onSelect: showCoords
                                    });
                                });

                                $("#savediv").show();
                            }
                        }
                    },
                    error: function (data, status, e) {
                        alert(e);
                    }
                }
            )
        }
        e.preventDefault();
    });

    $("#save").click(function (e) {

        $this = $(this);
        $this.text("图片剪切中，请稍候。。。");
        $this.attr("disabled", true);
        $.ajax({
            url: "${_BASE_PATH}/admin/cutportrait",
            data: AKF.formParams($("#form_save")),
            success: function (result) {

                alert("头像更新成功！");
                location.reload();
            }
        })
        e.preventDefault();
    })
});