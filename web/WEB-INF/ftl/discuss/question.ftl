<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>


    <title>沃沃问答 - 沃尔沃车友俱乐部</title>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#">沃尔沃车友俱乐部</a>

            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li><a href="${_BASE_PATH}/">首页</a></li>
                    <li><a href="${_BASE_PATH}/news">资讯</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">讨论区 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="active"><a href="${_BASE_PATH}/discuss/question">沃沃问答</a></li>
                            <li><a href="${_BASE_PATH}/discuss/repair">维修改装</a></li>
                            <li><a href="${_BASE_PATH}/discuss/selfdriving">自驾游</a></li>
                            <li><a href="${_BASE_PATH}/discuss/photography">沃友摄影</a></li>
                            <li><a href="${_BASE_PATH}/discuss/advice">站务/建议</a></li>
                        </ul>
                    </li>
                    <li><a href="#">博客</a></li>
                    <li><a href="#about">车友圈</a></li>
                </ul>
                <div class="navbar-text pull-right" style="color: #ddd;">
                    当前访客身份：游客[ <a href="#" class="navbar-link">登录</a> | <a href="#" class="navbar-link">加入沃沃俱乐部</a> ]
                </div>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</div>

<div class="container">
<div class="row">
<div class="span8">
<!-- 回答列表 begin-->
<div class="QuestionList">
<div class="page-header">
    <h3><strong>沃沃问答</strong></h3>
</div>
<div class="tabbable">
<ul class="nav nav-tabs">
    <li class="active"><a href="${_BASE_PATH}/discuss/question">活跃</a></li>
    <li><a href="${_BASE_PATH}/discuss/question?show=updated">最新回答</a></li>
    <li><a href="${_BASE_PATH}/discuss/question?show=time">最新提问</a></li>
    <li><a href="${_BASE_PATH}/discuss/question?show=unanswer">尚未回答</a></li>
    <li><a href="${_BASE_PATH}/discuss/question?show=hot">热门</a></li>
</ul>
<div class="tab-content">
<div class="tab-pane active">
<div class="pagination">
    <ul>
        <li><a href="#">&larr;</a></li>
        <li class="active"><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&rarr;</a></li
    </ul>
</div>
<ul class="unstyled">
<li class="question">
    <a class="user ShowUserOutline" target="_blank" href="http://my.oschina.net/jpyscn"><img
            align="absmiddle" user="996860" class="SmallPortrait" title="jpyscn"
            alt="jpyscn"
            src="http://static.oschina.net/uploads/user/498/996860_50.jpg?t=1362494104000"></a>

    <div class="qbody">
        <h4><a target="_blank" href="http://www.oschina.net/question/996860_117223">
            有人用过simplepie解析RSS吗 为什么输出的正文都是编码过的</a></h4>

        <div class="Tags">
            <a title="SimplePie" class="btn btn-small btn-success"
               href="http://www.oschina.net/question/tag/simplepie">SimplePie</a></div>
        <div class="Date">
            jpyscn 发布于 2小时前
            ，最后回答(2分钟前)：<a
                href="http://www.oschina.net/question/996860_117223?sort=time#answers">sofire»</a>
        </div>
    </div>
    <div class="qstat">
        <ul class="unstyled">
            <li class="view">
                <p class="text-center"><em>13</em></p>

                <p class="text-center">浏览</p></span>
            </li>
            <li class="answer">
                <span class="badge badge-success"><p class="text-center"><em>1</em></p><p class="text-center">
                    回答</p></span>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</li>
<li class="question">
    <a class="user ShowUserOutline" target="_blank" href="http://my.oschina.net/jpyscn"><img
            align="absmiddle" user="996860" class="SmallPortrait" title="jpyscn"
            alt="jpyscn"
            src="http://static.oschina.net/uploads/user/498/996860_50.jpg?t=1362494104000"></a>

    <div class="qbody">
        <h4><a target="_blank" href="http://www.oschina.net/question/996860_117223">
            有人用过simplepie解析RSS吗 为什么输出的正文都是编码过的</a></h4>

        <div class="Tags">
            <a title="SimplePie" class="btn btn-small btn-success"
               href="http://www.oschina.net/question/tag/simplepie">SimplePie</a></div>
        <div class="Date">
            jpyscn 发布于 2小时前
            ，最后回答(2分钟前)：<a
                href="http://www.oschina.net/question/996860_117223?sort=time#answers">sofire»</a>
        </div>
    </div>
    <div class="qstat">
        <ul class="unstyled">
            <li class="view">
                <p class="text-center"><em>13</em></p>

                <p class="text-center">浏览</p></span>
            </li>
            <li class="answer">
                <span class="badge badge-success"><p class="text-center"><em>1</em></p><p class="text-center">
                    回答</p></span>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</li>
<li class="question">
    <a class="user ShowUserOutline" target="_blank" href="http://my.oschina.net/jpyscn"><img
            align="absmiddle" user="996860" class="SmallPortrait" title="jpyscn"
            alt="jpyscn"
            src="http://static.oschina.net/uploads/user/498/996860_50.jpg?t=1362494104000"></a>

    <div class="qbody">
        <h4><a target="_blank" href="http://www.oschina.net/question/996860_117223">
            有人用过simplepie解析RSS吗 为什么输出的正文都是编码过的</a></h4>

        <div class="Tags">
            <a title="SimplePie" class="btn btn-small btn-success"
               href="http://www.oschina.net/question/tag/simplepie">SimplePie</a></div>
        <div class="Date">
            jpyscn 发布于 2小时前
            ，最后回答(2分钟前)：<a
                href="http://www.oschina.net/question/996860_117223?sort=time#answers">sofire»</a>
        </div>
    </div>
    <div class="qstat">
        <ul class="unstyled">
            <li class="view">
                <p class="text-center"><em>13</em></p>

                <p class="text-center">浏览</p></span>
            </li>
            <li class="answer">
                <span class="badge badge-success"><p class="text-center"><em>1</em></p><p class="text-center">
                    回答</p></span>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</li>
<li class="question">
    <a class="user ShowUserOutline" target="_blank" href="http://my.oschina.net/jpyscn"><img
            align="absmiddle" user="996860" class="SmallPortrait" title="jpyscn"
            alt="jpyscn"
            src="http://static.oschina.net/uploads/user/498/996860_50.jpg?t=1362494104000"></a>

    <div class="qbody">
        <h4><a target="_blank" href="http://www.oschina.net/question/996860_117223">
            有人用过simplepie解析RSS吗 为什么输出的正文都是编码过的</a></h4>

        <div class="Tags">
            <a title="SimplePie" class="btn btn-small btn-success"
               href="http://www.oschina.net/question/tag/simplepie">SimplePie</a></div>
        <div class="Date">
            jpyscn 发布于 2小时前
            ，最后回答(2分钟前)：<a
                href="http://www.oschina.net/question/996860_117223?sort=time#answers">sofire»</a>
        </div>
    </div>
    <div class="qstat">
        <ul class="unstyled">
            <li class="view">
                <p class="text-center"><em>13</em></p>

                <p class="text-center">浏览</p></span>
            </li>
            <li class="answer">
                <span class="badge badge-success"><p class="text-center"><em>1</em></p><p class="text-center">
                    回答</p></span>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</li>
<li class="question">
    <a class="user ShowUserOutline" target="_blank" href="http://my.oschina.net/jpyscn"><img
            align="absmiddle" user="996860" class="SmallPortrait" title="jpyscn"
            alt="jpyscn"
            src="http://static.oschina.net/uploads/user/498/996860_50.jpg?t=1362494104000"></a>

    <div class="qbody">
        <h4><a target="_blank" href="http://www.oschina.net/question/996860_117223">
            有人用过simplepie解析RSS吗 为什么输出的正文都是编码过的</a></h4>

        <div class="Tags">
            <a title="SimplePie" class="btn btn-small btn-success"
               href="http://www.oschina.net/question/tag/simplepie">SimplePie</a></div>
        <div class="Date">
            jpyscn 发布于 2小时前
            ，最后回答(2分钟前)：<a
                href="http://www.oschina.net/question/996860_117223?sort=time#answers">sofire»</a>
        </div>
    </div>
    <div class="qstat">
        <ul class="unstyled">
            <li class="view">
                <p class="text-center"><em>13</em></p>

                <p class="text-center">浏览</p></span>
            </li>
            <li class="answer">
                <span class="badge badge-success"><p class="text-center"><em>1</em></p><p class="text-center">
                    回答</p></span>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</li>
<li class="question">
    <a class="user ShowUserOutline" target="_blank" href="http://my.oschina.net/jpyscn"><img
            align="absmiddle" user="996860" class="SmallPortrait" title="jpyscn"
            alt="jpyscn"
            src="http://static.oschina.net/uploads/user/498/996860_50.jpg?t=1362494104000"></a>

    <div class="qbody">
        <h4><a target="_blank" href="http://www.oschina.net/question/996860_117223">
            有人用过simplepie解析RSS吗 为什么输出的正文都是编码过的</a></h4>

        <div class="Tags">
            <a title="SimplePie" class="btn btn-small btn-success"
               href="http://www.oschina.net/question/tag/simplepie">SimplePie</a></div>
        <div class="Date">
            jpyscn 发布于 2小时前
            ，最后回答(2分钟前)：<a
                href="http://www.oschina.net/question/996860_117223?sort=time#answers">sofire»</a>
        </div>
    </div>
    <div class="qstat">
        <ul class="unstyled">
            <li class="view">
                <p class="text-center"><em>13</em></p>

                <p class="text-center">浏览</p></span>
            </li>
            <li class="answer">
                <span class="badge badge-success"><p class="text-center"><em>1</em></p><p class="text-center">
                    回答</p></span>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</li>
<li class="question">
    <a class="user ShowUserOutline" target="_blank" href="http://my.oschina.net/jpyscn"><img
            align="absmiddle" user="996860" class="SmallPortrait" title="jpyscn"
            alt="jpyscn"
            src="http://static.oschina.net/uploads/user/498/996860_50.jpg?t=1362494104000"></a>

    <div class="qbody">
        <h4><a target="_blank" href="http://www.oschina.net/question/996860_117223">
            有人用过simplepie解析RSS吗 为什么输出的正文都是编码过的</a></h4>

        <div class="Tags">
            <a title="SimplePie" class="btn btn-small btn-success"
               href="http://www.oschina.net/question/tag/simplepie">SimplePie</a></div>
        <div class="Date">
            jpyscn 发布于 2小时前
            ，最后回答(2分钟前)：<a
                href="http://www.oschina.net/question/996860_117223?sort=time#answers">sofire»</a>
        </div>
    </div>
    <div class="qstat">
        <ul class="unstyled">
            <li class="view">
                <p class="text-center"><em>13</em></p>

                <p class="text-center">浏览</p></span>
            </li>
            <li class="answer">
                <span class="badge badge-success"><p class="text-center"><em>1</em></p><p class="text-center">
                    回答</p></span>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</li>
<li class="question">
    <a class="user ShowUserOutline" target="_blank" href="http://my.oschina.net/jpyscn"><img
            align="absmiddle" user="996860" class="SmallPortrait" title="jpyscn"
            alt="jpyscn"
            src="http://static.oschina.net/uploads/user/498/996860_50.jpg?t=1362494104000"></a>

    <div class="qbody">
        <h4><a target="_blank" href="http://www.oschina.net/question/996860_117223">
            有人用过simplepie解析RSS吗 为什么输出的正文都是编码过的</a></h4>

        <div class="Tags">
            <a title="SimplePie" class="btn btn-small btn-success"
               href="http://www.oschina.net/question/tag/simplepie">SimplePie</a></div>
        <div class="Date">
            jpyscn 发布于 2小时前
            ，最后回答(2分钟前)：<a
                href="http://www.oschina.net/question/996860_117223?sort=time#answers">sofire»</a>
        </div>
    </div>
    <div class="qstat">
        <ul class="unstyled">
            <li class="view">
                <p class="text-center"><em>13</em></p>

                <p class="text-center">浏览</p></span>
            </li>
            <li class="answer">
                <span class="badge badge-success"><p class="text-center"><em>1</em></p><p class="text-center">
                    回答</p></span>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</li>
<li class="question">
    <a class="user ShowUserOutline" target="_blank" href="http://my.oschina.net/jpyscn"><img
            align="absmiddle" user="996860" class="SmallPortrait" title="jpyscn"
            alt="jpyscn"
            src="http://static.oschina.net/uploads/user/498/996860_50.jpg?t=1362494104000"></a>

    <div class="qbody">
        <h4><a target="_blank" href="http://www.oschina.net/question/996860_117223">
            有人用过simplepie解析RSS吗 为什么输出的正文都是编码过的</a></h4>

        <div class="Tags">
            <a title="SimplePie" class="btn btn-small btn-success"
               href="http://www.oschina.net/question/tag/simplepie">SimplePie</a></div>
        <div class="Date">
            jpyscn 发布于 2小时前
            ，最后回答(2分钟前)：<a
                href="http://www.oschina.net/question/996860_117223?sort=time#answers">sofire»</a>
        </div>
    </div>
    <div class="qstat">
        <ul class="unstyled">
            <li class="view">
                <p class="text-center"><em>13</em></p>

                <p class="text-center">浏览</p></span>
            </li>
            <li class="answer">
                <span class="badge badge-success"><p class="text-center"><em>1</em></p><p class="text-center">
                    回答</p></span>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</li>
<li class="question">
    <a class="user ShowUserOutline" target="_blank" href="http://my.oschina.net/jpyscn"><img
            align="absmiddle" user="996860" class="SmallPortrait" title="jpyscn"
            alt="jpyscn"
            src="http://static.oschina.net/uploads/user/498/996860_50.jpg?t=1362494104000"></a>

    <div class="qbody">
        <h4><a target="_blank" href="http://www.oschina.net/question/996860_117223">
            有人用过simplepie解析RSS吗 为什么输出的正文都是编码过的</a></h4>

        <div class="Tags">
            <a title="SimplePie" class="btn btn-small btn-success"
               href="http://www.oschina.net/question/tag/simplepie">SimplePie</a></div>
        <div class="Date">
            jpyscn 发布于 2小时前
            ，最后回答(2分钟前)：<a
                href="http://www.oschina.net/question/996860_117223?sort=time#answers">sofire»</a>
        </div>
    </div>
    <div class="qstat">
        <ul class="unstyled">
            <li class="view">
                <p class="text-center"><em>13</em></p>

                <p class="text-center">浏览</p></span>
            </li>
            <li class="answer">
                <span class="badge badge-success"><p class="text-center"><em>1</em></p><p class="text-center">
                    回答</p></span>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</li>
</ul>
<div class="pagination">
    <ul>
        <li><a href="#">&larr;</a></li>
        <li class="active"><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&rarr;</a></li
    </ul>
</div>
</div>
</div>

</div>
</div>
<!-- 回答列表 end-->
</div>
<div class="span4">
    <div class="input-append">
        <input class="span3" id="appendedInputButton" type="text" placeholder="搜索所有沃沃内容">
        <button class="btn btn-primary" type="button">搜索</button>
    </div>
    <ul class="breadcrumb" style="text-align: center">
        <li><p>找不到我想要的答案？ </p>

            <p><a class="btn btn-primary" href="#">我要提问</a></p></li>
    </ul>
    <!-- 热门标签 begin-->
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
    <!-- 热门标签 begin-->
    <!-- 活跃会员 begin-->
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
    <!-- 活跃会员 end-->
</div>
</div>

<hr>

<footer id="footer">
    <div class="links">
        <a href="#">友情链接1</a>
        <a href="#">友情链接1</a>
        <a href="#">友情链接1</a>
        <a href="#">友情链接1</a>
        <a href="#">友情链接1</a>
        <a href="#">友情链接1</a>
        <a href="#">友情链接1</a>
    </div>
    <div class="about">
        <p class="text-center"><a class="btn" href="#">关于我们</a><a class="btn" href="mailto:flypighu@163.com">广告联系</a>
        </p>

        <p class="text-center"><strong>© 沃沃车友俱乐部(VolvoOwnerClub)</strong></p>
    </div>

</footer>
</div>
</body>

</html>