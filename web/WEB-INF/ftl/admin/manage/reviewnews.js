$(function () {

    $("#pass").click(function (e) {

        e.preventDefault();

        $.ajax({
            url: "${_BASE_PATH}/admin/reviewpass",
            data: {id: $("#id").val()},
            success: function (result) {

                alert("审核通过！");
                location.href = "${_BASE_PATH}/admin/review";
            }
        });
    });

    $("#back").click(function (e) {

        e.preventDefault();

        $.ajax({
            url: "${_BASE_PATH}/admin/reviewpass",
            data: {id: $("#id").val()},
            success: function (result) {

                alert("审核通过！");
                location.href = "${_BASE_PATH}/admin/review";
            }
        });
    });
});