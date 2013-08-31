<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>


    <title>新闻资讯 - 沃尔沃车友俱乐部</title>
</head>

<body>

<#include "/WEB-INF/ftl/common/top.ftl"/>

<div class="container">

    <div class="row">

        <div class="span8 leftContent">

            <!-- 热点新闻 begin-->
        <#include "/WEB-INF/ftl/static/hotnews.html"/>
            <!-- 热点新闻 end-->

            <!-- 新闻列表 begin-->
            <div class="page-header">
                <h3><strong>全部资讯</strong></h3>
            </div>

        <@_pagination pageNumber=result.getPageNumber() totalPage=result.getTotalPage() url=_BASE_PATH + "/news"/>

            <ul class="newsList">
            <#list result.getList() as x>
                <li>
                    <h2><a target="_blank" href="${_BASE_PATH}/news/${x.id}">${x.title}</a></h2>

                    <p class="date"><a href="${_BASE_PATH}/u/${x.url}">${x.username}</a> 发布于 ${x.reltime} - 0评</p>

                    <p class="detail">${x.sim_content}</p>

                    <#if x.sim_pic?exists>
                        <p class="newsImg"><a target="_blank" href="${_BASE_PATH}/news/${x.id}"
                                              title="${x.title}">${x.sim_pic}</a></p>
                    </#if>
                    <p class="more"><a class="more" target="_blank" href="${_BASE_PATH}/news/${x.id}">显示全文</a></p>
                </li>
            </#list>

            </ul>

        <@_pagination pageNumber=result.getPageNumber() totalPage=result.getTotalPage() url=_BASE_PATH + "/news"/>


            <!-- 新闻列表 end-->
        </div>
        <div class="span4 rightContent">

        <#include "/WEB-INF/ftl/static/top_comment20.html"/>

        </div>

    </div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>

</html>