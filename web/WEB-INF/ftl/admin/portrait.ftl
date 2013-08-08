<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <script src="${_BASE_PATH}/assets/bootstrap/js/bootstrap-validation.js"></script>

    <script src="${_BASE_PATH}/assets/jcrop/ajaxfileupload.js"></script>
    <link href="${_BASE_PATH}/assets/jcrop/jquery.Jcrop.min.css" rel="stylesheet">
    <script src="${_BASE_PATH}/assets/jcrop/jquery.Jcrop.min.js"></script>
    <script src="${_BASE_PATH}/static/js/admin_portrait"></script>

    <title>
    <#if _sessionob.getStr("title")?exists>
        更改头像图片 - ${_sessionob.getStr("title")} - 沃尔沃车友俱乐部
    <#else>
        更改头像图片 - ${_sessionob.getStr("name")} - 沃尔沃车友俱乐部
    </#if>

    </title>
</head>
<body>
<#include "/WEB-INF/ftl/common/top.ftl"/>
<div class="container admin">

    <div class="row">
        <div class="span3">
        <#include "/WEB-INF/ftl/admin/left.ftl"/>
        </div>
        <div class="span9">
            <ul class="breadcrumb">
                <li><a href="${_BASE_PATH}/u/${_sessionob.getStr("url")}">空间</a> <span class="divider">/</span></li>
                <li><a href="${_BASE_PATH}/admin/${_sessionob.getStr("name")}">管理</a> <span class="divider">/</span></li>
                <li class="active">更改头像图片</li>
            </ul>
            <div class="page-header">
                <h3><strong>更改头像图片</strong></h3>
            </div>
            <div id="msg"></div>
            <form id="portraitForm" enctype="multipart/form-data" method="POST" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">选择图片文件：</label>

                    <div class="controls">
                        <input check-type="required" class="input-file" id="fileToUpload" name="fileToUpload" type="file">
                    </div>
                </div>
                <div class="control-group" id="uploaddiv">
                    <div class="controls">
                        <button id="sub" class="btn btn-success">上传图片</button>
                    </div>
                </div>
                <div class="control-group" id="savediv" style="display: none">
                    <div class="controls">
                        <button id="save" class="btn btn-success">保存选中区域</button>
                    </div>
                </div>
            </form>
            <img id="uploadimg" style="display: none">
        </div>
    </div>
    <form style="display:none;" id="form_save">
        <input type="hidden" value="0" name="left" id="img_left">
        <input type="hidden" value="0" name="top" id="img_top">
        <input type="hidden" value="0" name="width" id="img_width">
        <input type="hidden" value="0" name="height" id="img_height">
        <input type="hidden" value="0" name="fn" id="img_fn">
    </form>
<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>
</html>