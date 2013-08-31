<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <title>
    <#if _sessionob.getStr("title")?exists>
        用户管理 - ${_sessionob.getStr("title")} - 沃尔沃车友俱乐部
    <#else>
        用户管理 - ${_sessionob.getStr("name")} - 沃尔沃车友俱乐部
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
                <li class="active">用户管理</li>
            </ul>
            <div id="msg"></div>
        <@_pagination pageNumber=result.getPageNumber() totalPage=result.getTotalPage() url="/admin/member"/>
            <table class="table table-striped table-bordered table-hover" id="otable">
                <thead>
                <tr>
                    <th>邮箱</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>地区</th>
                    <th>注册时间</th>
                    <th>是否激活</th>
                    <th style="width:100px;">操作</th>

                </tr>
                </thead>

                <tbody>
                <#list result.getList() as x>
                <tr rel="${x.id!}">

                    <td>${x.login_email}</td>
                    <td>${x.name}</td>
                    <td><#if x.gender = "0101">男</#if><#if x.gender = "0102">女</#if></td>
                    <td>${x.province} -- ${x.city}</td>
                    <td>${x.regtime}</td>
                    <td><#if x.active_time?exists>是<#else>否</#if></td>
                    <td><a class="btn btn-small btn-success" href="/admin/memberview?i=${x.id}">
                        <#if x.active_time?exists>
                            查看
                        <#else>
                            激活
                        </#if>
                        </a>
                    </td>
                </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>
</html>