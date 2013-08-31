<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <script charset="utf-8" src="${_BASE_PATH}/assets/kindeditor/kindeditor-min.js"></script>
    <script charset="utf-8" src="${_BASE_PATH}/assets/kindeditor/lang/zh_CN.js"></script>

    <script type="text/javascript" src="${_BASE_PATH}/static/js/dongtan_detail"></script>

    <title><#if rd.title?exists>
    ${rd.title} - 沃尔沃车友俱乐部
    <#else>
    ${rd.name} - 沃尔沃车友俱乐部
    </#if></title>
</head>

<body>
<#include "/WEB-INF/ftl/common/top.ftl"/>


<div class="container news">

<div class="row">
<div class="span9">
<div class="Tweet">
<div class="page-header">
    <h3><strong><a href="/u/${rd.url}">${rd.name}的空间</a> >> 评论列表</strong></h3>
</div>
<table class="ostable">
    <tbody>
    <tr>
        <td class="TweetUser"><a href="/u/${rd.url}">
            <img align="absmiddle" user="${rd.uid}" class="SmallPortrait" title="${rd.name}"
                 alt="${rd.name}"
                 src="${_getUserPicUrl(rd.pic!)}">
        </a></td>
        <td class="TweetContent">
            <h5><a class="user" href="/u/${rd.url}">${rd.name}</a>
                <span class="action">更新了动态</span>
            </h5>

            <div class="post">${rd.content}</div>
            <div class="bottom">
                <div class="opts">
                    <a class="TweetReplyLnk">评论<span>(<span>${rd.comments}</span>)</span></a>
                </div>
                <div class="time">${_checkTimeQian(rd.rtime)} </div>

            </div>
        </td>
    </tr>
    </tbody>
</table>
<#if _ISLOGIN == "true">
<form id="TweetReplyForm">
<input type="hidden" value="${rd.id}" name="dongtanid">
<input type="hidden" value="${rd.uid}" name="userid">
<textarea name="msg" class="TXT_Tweet_Text" id="editor_id"></textarea>

<div class="TweetReplyOptions">
    <input type="button" id="btn_submit" class="btn btn-success" value="发表评论">
</div>
<div class="clear"></div>
</form>
</#if>

</div>

<div class="TweetRpls">
    <ul>

        <#if rlist?exists>
        <#list rlist as x>
            <li>
                <table class="ostable">
                    <tbody><tr>
                        <td class="portrait"><a target="_blank" href="/u/${x.url}">
                            <img align="absmiddle" user="${x.uid}" class="SmallPortrait" title="${x.name}" alt="${x.name}"
                                 src="${_getUserPicUrl(x.pic!)}">
                        </a></td>
                        <td class="TweetReplyBody">
                            <div class="post">
                                <a target="_blank" href="/u/${x.url}">${x.name}</a>
                                ${x.comment}
                            </div>
                            <div class="opts">
                            <#--<span class="links">-->
                            <#--<a href="">回复</a>-->
                            <#--</span>-->
                            ${_checkTimeQian(x.commenttime)} 发布 	</div>
                        </td>
                    </tr>
                    </tbody></table>
            </li>
        </#list>
        </#if>


    </ul>
</div>


</div>

<div class="span3">
    <!-- 广告位1 begin-->
    <div style="height: 100px;margin-top: 10px;border: solid 1px;">
        <p class="text-center">右侧广告位</p>
    </div>
    <!-- 广告位1 end-->
</div>
</div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>

</body>

</html>