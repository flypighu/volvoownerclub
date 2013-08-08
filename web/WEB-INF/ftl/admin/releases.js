$(function () {

    $("#otable").find("ul.dropdown-menu a[oper='del']").click(function (e) {

        e.preventDefault();

        $this = $(this);
        $.ajax({
            url: "${_BASE_PATH}/admin/delrelease",
            data: {id: $this.attr("rel")},
            success: function (result) {

                alert("删除成功！");
                location.reload();
            }
        })
    });
});