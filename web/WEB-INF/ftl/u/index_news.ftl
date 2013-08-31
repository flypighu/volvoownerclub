<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <script src="${_BASE_PATH}/static/js/u_index"></script>

    <title>
    <#if u.title?exists>
    ${u.title} - 沃尔沃车友俱乐部
    <#else>
    ${u.name} - 沃尔沃车友俱乐部
    </#if>

    </title>
</head>
<body>

<#include "/WEB-INF/ftl/common/top.ftl"/>

<div class="container">
    <div class="row member">
        <!-- 左边 begin-->
    <#include "/WEB-INF/ftl/u/index_left.ftl"/>
        <!-- 左边 end-->

        <!-- 中间 begin-->
        <div class="span6">

        <#include "/WEB-INF/ftl/u/index_center_top.ftl"/>

            <!-- 主区域 begin-->
            <div id="Logs" class="MMod">
                <ul class="nav nav-tabs">
                    <li><a href="/u/${u.url}">动弹</a></li>
                    <li><a href="/u/${u.url}?t=discuss">讨论区</a></li>
                    <li class="active"><a href="/u/${u.url}?t=news">新闻</a></li>
                </ul>
            <#--<div class="ref">-->
            <#--<div class="p"><a target="_blank" href="http://my.oschina.net/pes21gamer">@暴走游侠</a>：-->
            <#--其实刚刚Git@OSC的LOGO只露两个眼睛那个感觉挺好的：）<a target="_blank" class="referer" href="http://my.oschina.net/javayou">@红薯</a>  <a target="_blank" class="referer" href="http://my.oschina.net/jack230230">@王振威</a>  <a target="_blank" class="referer" href="http://my.oschina.net/happysha">@曾沙</a>-->
            <#--<a href="http://my.oschina.net/pes21gamer/tweet/2282623">查看»</a>-->
            <#--</div>-->
            <#--</div>-->
                <div class="tabbable">
                    <div class="tab-content">
                        <div class="tab-pane active" id="A">
                            <ul id="MyTweet" class="UserLogs">
                            <#list rlist.getList() as x>
                                <li class="Tweet">
                                    <table class="ostable">
                                        <tbody>
                                        <tr>
                                            <td class="TweetUser">
                                                <a href="/u/${x.url}">
                                                    <img align="absmiddle" user="${x.uid}" class="SmallPortrait" title="${x.name}" alt="${x.name}"
                                                         src="${_getUserPicUrl(x.pic!)}"></a>
                                            </td>
                                            <td class="TweetContent">
                                                <h5>
                                                    <a class="user" href="/u/${x.url}">${x.name}</a>
                                                    <span class="action">发表了资讯
                                                        <a target="_blank" href="/news/${x.id}">${x.ntitle}</a>
                                                    </span>
                                                </h5>
                                                <div class="post">
                                                    ${x.sim_content}
                                                </div>
                                                <div class="bottom">
                                                    <div class="opts">
                                                        <a class="TweetReplyLnk" href="/news/${x.id}">评论<span>(${x.reply})</span></a>
                                                    </div>
                                                    <div class="time">${_checkTimeQian(x.reltime)} </div>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </li>
                            </#list>

                            </ul>
                        <@_pagination pageNumber=rlist.getPageNumber() totalPage=rlist.getTotalPage() url="/u/${u.url}?t=news"/>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 主区域 end-->
        </div>
        <!-- 中间 end-->

        <div class="span3">
        <#include "/WEB-INF/ftl/u/index_right.ftl"/>
        </div>
    </div>
<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>