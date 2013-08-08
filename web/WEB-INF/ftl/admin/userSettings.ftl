<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <script src="${_BASE_PATH}/assets/bootstrap/js/bootstrap-validation.js"></script>
    <script src="${_BASE_PATH}/static/js/admin_userSettings"></script>

    <title>
    <#if _sessionob.getStr("title")?exists>
        空间个性化设置 - ${_sessionob.getStr("title")} - 沃尔沃车友俱乐部
    <#else>
        空间个性化设置 - ${_sessionob.getStr("name")} - 沃尔沃车友俱乐部
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
                <li class="active">空间个性化设置</li>
            </ul>
            <div class="page-header">
                <h3><strong>空间个性化设置</strong></h3>
            </div>
            <div id="msg"></div>
            <form id="setForm" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">个性化URL：</label>

                    <div class="controls">
                        <span>www.volvoownerclub.com/u/</span>
                        <input check-type="required" type="text" placeholder="请输入url内容，不能有/" name="url" value="${_sessionob.get("url")!}">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">个性化网页标题：</label>

                    <div class="controls">
                        <input check-type="required" type="text" class="input-xlarge"
                               placeholder="请输入网页标题" name="title" value="${_sessionob.get("title")!}">
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button id="sub" class="btn btn-success">保存修改</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>
</html>