$(function () {

    var editor;

    KindEditor.ready(function (K) {
        editor = K.create('#editor_id', {
            resizeType: 1,
            urlType: 'domain',
            shadowMode: false,
            allowPreviewEmoticons: false,
            uploadJson: '${_BASE_PATH}/admin/uploadReleasesImg',
            afterChange: function () {
                this.sync();
            },
            items: ['bold', 'italic', 'underline', 'strikethrough', 'removeformat', '|', 'insertorderedlist', 'insertunorderedlist',
                'forecolor', 'hilitecolor', 'fontname', 'fontsize', '|', 'link', 'unlink', 'emoticons',
                'image', 'flash', 'quote', '|', 'source', 'fullscreen', 'about'],
            htmlTags: {
                script: ['src'],
                font: ['color', 'size', 'face', '.background-color'],
                span: [
                    '.color', '.background-color', '.font-size', '.font-family', '.background',
                    '.font-weight', '.font-style', '.text-decoration', '.vertical-align', '.line-height'
                ],
                div: [
                    'class', 'align', '.border', '.margin', '.padding', '.text-align', '.color',
                    '.background-color', '.font-size', '.font-family', '.font-weight', '.background',
                    '.font-style', '.text-decoration', '.vertical-align', '.margin-left'
                ],
                table: [
                    'border', 'cellspacing', 'cellpadding', 'width', 'height', 'align', 'bordercolor',
                    '.padding', '.margin', '.border', 'bgcolor', '.text-align', '.color', '.background-color',
                    '.font-size', '.font-family', '.font-weight', '.font-style', '.text-decoration', '.background',
                    '.width', '.height', '.border-collapse'
                ],
                'td,th': [
                    'align', 'valign', 'width', 'height', 'colspan', 'rowspan', 'bgcolor',
                    '.text-align', '.color', '.background-color', '.font-size', '.font-family', '.font-weight',
                    '.font-style', '.text-decoration', '.vertical-align', '.background', '.border'
                ],
                a: ['href', 'target', 'name'],
                embed: ['src', 'width', 'height', 'type', 'loop', 'autostart', 'quality', '.width', '.height', 'align', 'allowscriptaccess'],
                img: ['src', 'width', 'height', 'border', 'alt', 'title', 'align', '.width', '.height', '.border'],
                'p,ol,ul,li,blockquote,h1,h2,h3,h4,h5,h6': [
                    'align', '.text-align', '.color', '.background-color', '.font-size', '.font-family', '.background',
                    '.font-weight', '.font-style', '.text-decoration', '.vertical-align', '.text-indent', '.margin-left'
                ],
                pre: ['class'],
                hr: ['class', '.page-break-after'],
                'br,tbody,tr,strong,b,sub,sup,em,i,u,strike,s,del': []
            }
        });
    });

    $("#sub").click(function (e) {
        e.preventDefault();

        $this = $(this);
        var param = AKF.formParams($("#releaseForm"));
        var html = editor.html();
        if ($("#releaseForm").validation()) {

            if (html == "") {
                alert("请输入内容！");
                return;
            } else {
                param.push({
                    name: "html",
                    value: html
                })
                $this.text("保存中，请稍候。。。");
                $this.attr("disabled", true);
                $.ajax({
                    url: "${_BASE_PATH}/admin/updateReleases",
                    data: param,
                    success: function (result) {

                        window.location.href = "${_BASE_PATH}/admin/releases";
                    }
                })
            }

        }

    });

});