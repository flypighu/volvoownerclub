<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

    <#include "/WEB-INF/ftl/common/include.ftl"/>

    <script src="${_BASE_PATH}/static/js/admin_releases"></script>

    <title>
    <#if _sessionob.getStr("title")?exists>
        新闻投递 - ${_sessionob.getStr("title")} - 沃尔沃车友俱乐部
    <#else>
        新闻投递 - ${_sessionob.getStr("name")} - 沃尔沃车友俱乐部
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
                <li class="active">新闻投递</li>
            </ul>

            <div id="msg"></div>
            <p>
                <a href="${_BASE_PATH}/admin/releasesNew" class="btn btn-success">投递新闻</a>
                <a href="${_BASE_PATH}/admin/releases/0501" class="btn <#if shzt == "0501">btn-primary</#if>">未审核</a>
                <a href="${_BASE_PATH}/admin/releases/0502" class="btn <#if shzt == "0502">btn-primary</#if>">已审核</a>
                <a href="${_BASE_PATH}/admin/releases/0504" class="btn <#if shzt == "0504">btn-primary</#if>">已退回</a>
            </p>
            <table class="table table-striped table-bordered table-hover" id="otable">
                <thead>
                <tr>
                    <th>标题</th>
                    <th>状态</th>
                    <th>发布人</th>
                    <th>发布时间</th>
                <#if shzt == "0502">
                    <th>审核人</th>
                    <th>审核时间</th>
                </#if>
                <#if shzt == "0504">
                    <th>退回人</th>
                    <th>退回时间</th>
                </#if>
                <#if shzt == "0501">
                    <th style="width:100px;">操作</th>
                </#if>
                </tr>
                </thead>
                <tbody>

                <#list result.getList() as x>
                <tr rel="${x.id!}">
                    <td><a href="#" onclick="window.open('${_BASE_PATH}/admin/previewnews/${x.id!}')">${x.title!}</a></td>
                    <td>${_getValueByCode(x.status!)}</td>
                    <td>${x.name!}</td>
                    <td>${x.reltime!}</td>
                    <#if shzt == "0502">
                        <td>${x.reviewman!}</td>
                        <td>${x.reviewtime!}</td>
                    </#if>
                    <#if shzt == "0504">
                        <td>${x.backman!}</td>
                        <td>${x.backtime!}</td>
                    </#if>
                    <#if shzt == "0501">
                        <td>
                            <div class="btn-group">
                                <a class="btn btn-primary btn-small" href="#">操作</a>
                                <a class="btn btn-primary btn-small dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${_BASE_PATH}/admin/releasesMod/${x.id}">修改</a></li>
                                    <li><a rel="${x.id}" href="#" oper="del">删除</a></li>
                                </ul>
                            </div>
                        </td>
                    </#if>

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