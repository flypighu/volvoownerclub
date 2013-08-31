<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>


    <title>大家都在动弹什么？ - 沃尔沃车友俱乐部</title>
</head>

<body>

<#include "/WEB-INF/ftl/common/top.ftl"/>

<div class="container">

    <div class="row">

        <div class="span8 leftContent">

            <!-- 动弹列表 begin-->
            <div class="page-header">
                <h3><strong>大家在动弹什么？</strong></h3>
            </div>

        <@_pagination pageNumber=rlist.getPageNumber() totalPage=rlist.getTotalPage() url=_BASE_PATH + "/dongtan"/>
            <ul class="logs">
                <#list rlist.getList() as x>
                    <li>
                        <a class="portrait" target="_blank" href="/u/${x.url}">
                            <img align="absmiddle" user="${x.uid}" class="SmallPortrait" title="${x.name}" alt="${x.name}"
                                 src="${_getUserPicUrl(x.pic!)}">
                        </a>
                        <div class="tweet">
                            <p class="txt"><a target="_blank" href="/u/${x.url}">${x.name}</a> : ${x.content}</p>
                            <p class="outline">发布于 ${_checkTimeQian(x.rtime)} (<a target="_blank" href="/dongtan/${x.id}">${x.comments}评</a>)
                            </p>
                        </div>
                    </li>
                </#list>
            </ul>
        <@_pagination pageNumber=rlist.getPageNumber() totalPage=rlist.getTotalPage() url=_BASE_PATH + "/dongtan"/>

            <!-- 新闻列表 end-->
        </div>
        <div class="span4 rightContent">
            广告区域
        </div>

    </div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>

</html>