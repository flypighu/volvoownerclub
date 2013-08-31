<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <title>
    ${news.getStr("title")} - 预览新闻 - 沃尔沃车友俱乐部
    </title>
</head>
<body>
<#include "/WEB-INF/ftl/common/top.ftl"/>
<div class="container news">

    <div class="row">

        <div class="span10 offset1 detail">
            <div class="page-header">
                <h3><strong>${news.getStr("title")}</strong></h3>
            </div>
            <p><a href="${_BASE_PATH}/u/${news.get("relman")}">${news.getStr("relmanname")}</a>
                发布于： ${news.get("reltime")}</p>

            <div class="newscontent textcontent">
                <p>
                ${news.get("content")}
                </p>

            <#if news.get("source")?exists>
                <blockquote>
                    <p>本文转载自: ${news.get("source")}</p>
                    <small> (本站只作转载,不代表本站同意文中观点或证实文中信息)</small>
                </blockquote>
            <#else>
                <blockquote>
                    <p>本站文章除注明转载外，均为本站原创或编译</p>

                    <p>欢迎任何形式的转载，但请务必注明出处，尊重他人劳动共创沃沃社区</p>
                    <small>转载请注明：文章转载自：<strong>沃尔沃车友俱乐部</strong> [<a href="http://www.volvoownerclub.com">http://www.volvoownerclub.com</a>]
                    </small>
                    <small>本文标题：${news.get("title")}</small>
                    <small>本文地址：<a href="http://www.volvoownerclub.com/news/${news.get("id")}">http://www.volvoownerclub.com/news/${news.get("id")}</a>
                    </small>
                </blockquote>
            </#if>
            </div>
        </div>


    </div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>
</html>