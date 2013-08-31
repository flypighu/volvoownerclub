<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <title>站务/建议 - 沃尔沃车友俱乐部</title>
</head>
<body>
<#include "/WEB-INF/ftl/common/top.ftl"/>

<div class="container">
<div class="row">
<div class="span8">
    <!-- 回答列表 begin-->
    <div class="QuestionList">
        <div class="page-header">
            <h3><strong>站务/建议</strong></h3>
        </div>
        <div class="tabbable">
            <!--
            <ul class="nav nav-tabs">
                <li class="active"><a href="${_BASE_PATH}/discuss/question">活跃</a></li>
                <li><a href="${_BASE_PATH}/discuss/question?show=updated">最新回答</a></li>
                <li><a href="${_BASE_PATH}/discuss/question?show=time">最新提问</a></li>
                <li><a href="${_BASE_PATH}/discuss/question?show=unanswer">尚未回答</a></li>
                <li><a href="${_BASE_PATH}/discuss/question?show=hot">热门</a></li>
            </ul>
             -->
            <div class="tab-content">
                <div class="tab-pane active">

                <@_pagination pageNumber=rlist.getPageNumber() totalPage=rlist.getTotalPage() url=_BASE_PATH + "/discuss?c=5"/>

                <#list rlist.getList() as x>
                    <ul class="unstyled">
                        <li class="question">
                            <a class="user ShowUserOutline" target="_blank" href="/u/${x.url}">
                                <img
                                        align="absmiddle" class="SmallPortrait" title="${x.name}"
                                        alt="${x.name}"
                                        src="${_getUserPicUrl(x.pic!"")}"></a>

                            <div class="qbody">
                                <h4><a target="_blank" href="/discuss/${rel}_${x.id}">
                                ${x.title}</a></h4>

                                <!--
                                <div class="Tags">
                                    <a title="SimplePie" class="btn btn-small btn-success"
                                       href="http://www.oschina.net/question/tag/simplepie">SimplePie</a>
                                </div>
                                -->
                                <div class="Date">
                                ${x.name} 发布于 ${x.rtime}
                                    <#if x.last_reply?exists>
                                        ，最后回答${x.last_reply}：<a
                                            href="/question/question/${rel}_${x.id}">${x.lastname}»</a>
                                    </#if>

                                </div>
                            </div>
                            <div class="qstat">
                                <ul class="unstyled">
                                    <li class="view">
                                        <p class="text-center"><em>${x.click}</em></p>

                                        <p class="text-center">浏览</p>
                                    </li>
                                    <li class="answer" style="background-color: #41BB19;color: #FFFFFF;">
                                        <p class="text-center"><em>${x.reply}</em></p>
                                        <p class="text-center">回复</p>
                                    </li>
                                </ul>
                            </div>
                            <div class="clear"></div>
                        </li>

                    </ul>
                </#list>

                <@_pagination pageNumber=rlist.getPageNumber() totalPage=rlist.getTotalPage() url=_BASE_PATH + "/discuss?c=5"/>

                </div>
            </div>

        </div>
    </div>
    <!-- 回答列表 end-->
</div>
<div class="span4">
    <ul class="breadcrumb" style="text-align: center">
        <li><p>对我们有什么意见和建议？</p>

            <p><a class="btn btn-primary" href="/discuss/post?c=5">发表意见</a></p></li>
    </ul>
    <!-- 热门标签 begin-->
    <!--
    <div class="hottag">
        <div class="page-header">
            <h4><strong>热门标签</strong></h4>
        </div>
        <p>
            <a class="btn btn-small btn-success" title="编程语言 Java">Java<em>(133)</em></a>
            <a class="btn btn-small btn-success" title="编程语言 Java">Android<em>(133)</em></a>
            <a class="btn btn-small btn-success" title="编程语言 Java">Android<em>(133)</em></a>
            <a class="btn btn-small btn-success" title="编程语言 Java">Android<em>(133)</em></a>
            <a class="btn btn-small btn-success" title="编程语言 Java">Android<em>(133)</em></a>
            <a class="btn btn-small btn-success" title="编程语言 Java">Android<em>(133)</em></a>
            <a class="btn btn-small btn-success" title="编程语言 Java">Android<em>(133)</em></a>
            <a class="btn btn-small btn-success" title="编程语言 Java">Android<em>(133)</em></a>
            <a class="btn btn-small btn-success" title="编程语言 Java">S60日行灯<em>(133)</em></a>
            <a class="btn btn-small btn-success" title="编程语言 Java">S60漫射器<em>(133)</em></a>
            <a class="btn btn-small btn-success" title="编程语言 Java">XC60脚踏板<em>(133)</em></a>
        </p>
    </div>
    -->
    <!-- 热门标签 end-->
    <!-- 活跃会员 begin-->
    <!--
    <div class="hotuser">
        <div class="page-header">
            <h4><strong>活跃会员（TOP20）</strong></h4>
        </div>
        <table class="table table-condensed" style="">
            <tbody>
            <tr>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
            </tr>
            <tr>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
            </tr>
            <tr>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
            </tr>
            <tr>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
            </tr>
            <tr>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
                <td>
                    <img src="${_BASE_PATH}/upload/img/user/186208_100.jpg" class="img-polaroid">
                    <a href="#">小胡</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    -->
    <!-- 活跃会员 end-->
</div>
</div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>

</html>