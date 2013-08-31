<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <script src="${_BASE_PATH}/static/js/index"></script>

    <title>沃行天下，沃沃生活 - 沃尔沃车友俱乐部</title>
</head>
<body>

<#include "/WEB-INF/ftl/common/top.ftl"/>

<div class="container">
    <div class="row">
        <div class="span8 leftContent">

            <!-- 滚动图片 bedin-->
        <#include "/WEB-INF/ftl/static/top_pic5.html"/>
            <!-- 滚动图片 end-->

            <!-- 沃沃资讯 bedin-->
        <#include "/WEB-INF/ftl/static/index_news.html"/>
            <!-- 沃沃资讯 end-->

            <!-- 广告位1 bedin-->
            <div class="leftAd">
                <p class="text-center">左侧广告位</p>
            </div>
            <!-- 广告位1 end-->

            <!-- 讨论区 begin-->
        <#include "/WEB-INF/ftl/static/index_discuss.html"/>
            <!-- 讨论区 end-->

        </div>
        <div class="span4 rightContent">
            <!-- 动弹 begin-->
            <div class="move">
                <div class="page-header">
                    <h4><i class="icon-share"></i> <strong>大家在动弹什么?</strong>
                <span class="pull-right">
                        <small><a href="/dongtan">更多动弹>></a></small>
                    </span>
                    </h4>

                </div>
                <div id="msg"></div>
                <div class="input-append">
                    <textarea id="dongtanTxt" <#if _ISLOGIN == "true">placeholder="今天你动弹了吗？"<#else>placeholder="必须登录才能发表动弹哦。" disabled </#if>  class="input-xlarge"
                              style="height: 40px; resize: none;"></textarea>
                    <button id="postDT" class="btn btn-primary" type="button" style="height: 50px;" <#if _ISLOGIN == "false"> disabled </#if>>动弹</button>
                </div>
                <ul class="TopTweets">
                <#include "/WEB-INF/ftl/common/template/topTweets.ftl"/>
                </ul>
            </div>
            <!-- 动弹 end-->

        <#include "/WEB-INF/ftl/static/top_users20.html"/>
        </div>
    </div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>


</body>

</html>
<script type="text/javascript">
    $(function () {
        $('.carousel').carousel();
    });
</script>