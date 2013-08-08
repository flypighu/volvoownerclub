<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <title>加入沃沃俱乐部 - 用户激活 - 沃尔沃车友俱乐部</title>
</head>
<body>

<#include "/WEB-INF/ftl/common/top.ftl"/>

<div class="container">
    <div class="row">
        <div class="span8 offset2 reg" style="text-align: center;">
        <#if flag == "1">
            <p>用户不存在，无法激活！</p>
        </#if>

        <#if flag == "2">
            <p>${username} 用户激活成功！</p>

            <p><a class="btn btn-success" href="${_BASE_PATH}/u/login">点我登录</a></p>
        </#if>

        <#if flag == "3">
            <p>${username} 用户在${active_time}已经激活</p>

            <p><a class="btn btn-success" href="${_BASE_PATH}/u/login">点我登录</a></p>
        </#if>
        </div>
    </div>
<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>

</body>