<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">
<#include "/WEB-INF/ftl/common/include.ftl"/>
    <script src="${_BASE_PATH}/assets/bootstrap/js/bootstrap-validation.js"></script>
    <script src="${_BASE_PATH}/static/js/admin_chpwd"></script>

    <title>
    <#if _sessionob.getStr("title")?exists>
        修改登录密码 - ${_sessionob.getStr("title")} - 沃尔沃车友俱乐部
    <#else>
        修改登录密码 - ${_sessionob.getStr("name")} - 沃尔沃车友俱乐部
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
                <li class="active">修改登录密码</li>
            </ul>
            <div class="page-header">
                <h3><strong>修改登录密码</strong></h3>
            </div>
            <div id="msg"></div>
            <form id="chpwdForm" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">旧的登录密码：</label>

                    <div class="controls">
                        <input check-type="required" class="input-xlarge" type="password" placeholder="请输入旧的登录密码" name="oldpassword">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">新密码：</label>

                    <div class="controls">
                        <input check-type="required" type="password" class="input-xlarge"
                               placeholder="请输入新密码" name="newpassword">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">确认新密码：</label>

                    <div class="controls">
                        <input check-type="required" type="password" class="input-xlarge"
                               placeholder="请重新输入新密码" name="confirmpassword">
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button id="sub" class="btn btn-success">修改密码</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>
</html>