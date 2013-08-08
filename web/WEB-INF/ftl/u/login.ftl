<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <script src="${_BASE_PATH}/assets/bootstrap/js/bootstrap-validation.js"></script>
    <script src="${_BASE_PATH}/static/js/u_login"></script>

    <title>登录 - 沃尔沃车友俱乐部</title>
</head>
<body>

<#include "/WEB-INF/ftl/common/top.ftl"/>

<div class="container">
    <div class="row">
        <div class="span8 offset2 reg">
            <div class="page-header">
                <h3><strong>登录沃沃俱乐部</strong></h3>
            </div>
            <div id="msg"></div>
            <form id="loginForm" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">电子邮箱：</label>

                    <div class="controls">
                        <input check-type="required mail" name="email" class="input-xlarge" type="text"
                               placeholder="请输入邮箱帐号">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">登录密码：</label>

                    <div class="controls">
                        <input check-type="required" name="password" class="input-xlarge" type="password"
                               placeholder="请输入密码">
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button id="sub" class="btn btn-success">登录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>