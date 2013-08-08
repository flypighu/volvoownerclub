<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <title>
    <#if _sessionob.getStr("title")?exists>
    ${_sessionob.getStr("title")} - 沃尔沃车友俱乐部
    <#else>
    ${_sessionob.getStr("name")} - 沃尔沃车友俱乐部
    </#if>

    </title>
</head>
<body>

<#include "/WEB-INF/ftl/common/top.ftl"/>

<div class="container">
    <div class="row member">
        <!-- 左边 begin-->
        <div class="span3">

            <!-- 个人头像区 begin-->
            <div class="owner label-info">
                <a class="Img" href="${_BASE_PATH}/u/${_sessionob.getStr("url")}">
                    <img class="img-polaroid" src="${_BASE_PATH}/${_getUserPicUrl(_sessionob.get("pic")!)}">
                </a>
                <span class="U">
                    <a class="Name" title="男" href="${_BASE_PATH}/u/${_sessionob.getStr("url")}">flypighu</a>
		            <span class="opts">
			            <img class="img-rounded" title="男" src="${_BASE_PATH}/assets/img/men.png">
        			        <a href="${_BASE_PATH}/admin/profile">修改资料</a>
			                <a href="${_BASE_PATH}/admin/portrait">更换头像</a>
        		    </span>
                </span>
                <div class="clear"></div>
                <div class="stat">
                    <a href="http://my.oschina.net/huxiang/fellow">关注(11)</a>
                    <a href="http://my.oschina.net/huxiang/fans">粉丝(2)</a>
                    <#--<a title="查看OSCHINA积分规则" href="http://www.oschina.net/question/3307_20931">积分(26)</a>-->
                </div>
            </div>
            <!-- 个人头像区 end-->

            <!-- 个性签名区和按钮功能 begin-->
            <div class="Resume" style="">这个人很懒，啥也没写</div>
            <div class="Opts clearfix">
                <a class="a1 blog" href="#"><i>.</i><span>发表博文</span></a>
                <a class="a2 admin" href="${_BASE_PATH}/admin/${_sessionob.getStr("name")}"><i>.</i><span>空间管理</span></a>
            </div>
            <!-- 个性签名区和按钮功能 end-->

            <!-- 粉丝区 begin-->
            <div id="Fellows" class="Mod Users">
                <div class="page-header">
                    <h4><strong>关注</strong></h4>
                </div>
                <ul class="clearfix">
                    <li>
                        <a title="王春生" href="http://my.oschina.net/easysoft"><img align="absmiddle" user="9476" class="SmallPortrait" title="王春生" alt="王春生" src="http://static.oschina.net/uploads/user/4/9476_50.jpg?t=1369054452000"></a>
                    </li>
                    <li>
                        <a title="JFinal" href="http://my.oschina.net/jfinal"><img align="absmiddle" user="201137" class="SmallPortrait" title="JFinal" alt="JFinal" src="http://static.oschina.net/uploads/user/100/201137_50.jpg?t=1370343372000"></a>
                    </li>
                    <li>
                        <a title="龙影" href="http://my.oschina.net/loyin"><img align="absmiddle" user="105457" class="SmallPortrait" title="龙影" alt="龙影" src="http://static.oschina.net/uploads/user/52/105457_50.jpg?t=1370350294000"></a>
                    </li>
                    <li>
                        <a title="FrankHui" href="http://my.oschina.net/ielts0909"><img align="absmiddle" user="589742" class="SmallPortrait" title="FrankHui" alt="FrankHui" src="http://static.oschina.net/uploads/user/294/589742_50.jpg?t=1364258461000"></a>
                    </li>
                    <li>
                        <a title="红薯" href="http://my.oschina.net/javayou"><img align="absmiddle" user="12" class="SmallPortrait" title="红薯" alt="红薯" src="http://static.oschina.net/uploads/user/0/12_50.jpg?t=1372173756000"></a>
                    </li>
                    <li>
                        <a title="虫虫" href="http://my.oschina.net/zhlmmc"><img align="absmiddle" user="28" class="SmallPortrait" title="虫虫" alt="虫虫" src="http://static.oschina.net/uploads/user/0/28_50.jpg?t=1355825992000"></a>
                    </li>
                    <li>
                        <a title="wenshao" href="http://my.oschina.net/wenshao"><img align="absmiddle" user="127152" class="SmallPortrait" title="wenshao" alt="wenshao" src="http://static.oschina.net/uploads/user/63/127152_50.jpg?t=1373815704000"></a>
                    </li>
                    <li>
                        <a title="闲.大赋" href="http://my.oschina.net/u/567839"><img align="absmiddle" user="567839" class="SmallPortrait" title="闲.大赋" alt="闲.大赋" src="http://static.oschina.net/uploads/user/283/567839_50.jpg?t=1369726276000"></a>
                    </li>
                    <li>
                        <a title="Roddy" href="http://my.oschina.net/luolonghao"><img align="absmiddle" user="96323" class="SmallPortrait" title="Roddy" alt="Roddy" src="http://static.oschina.net/uploads/user/48/96323_50.jpg"></a>
                    </li>
                    <li>
                        <a title="张慧华" href="http://my.oschina.net/dwz"><img align="absmiddle" user="57574" class="SmallPortrait" title="张慧华" alt="张慧华" src="http://static.oschina.net/uploads/user/28/57574_50.jpg"></a>
                    </li>
                    <li>
                        <a title="ueditor" href="http://my.oschina.net/u/437849"><img align="absmiddle" user="437849" class="SmallPortrait" title="ueditor" alt="ueditor" src="${_BASE_PATH}/assets/img/portrait.gif"></a>
                    </li>
                </ul>
                <div class="more">
                    <a href="http://my.oschina.net/huxiang/fellow">显示所有关注(11)</a>
                </div>
            </div>
            <div id="Fans" class="Mod Users">
                <div class="page-header">
                    <h4><strong>粉丝</strong></h4>
                </div>
                <ul class="clearfix">
                    <li><a title="柳韩" href="http://my.oschina.net/liujianmao"><img align="absmiddle" user="78930" class="SmallPortrait" title="柳韩" alt="柳韩" src="http://static.oschina.net/uploads/user/39/78930_50.jpg"></a></li>
                    <li><a title="haorizi" href="http://my.oschina.net/haorizi"><img align="absmiddle" user="103439" class="SmallPortrait" title="haorizi" alt="haorizi" src="http://static.oschina.net/uploads/user/51/103439_50.jpg"></a></li>
                </ul>
                <div class="more">
                    <a href="http://my.oschina.net/huxiang/fans">显示所有粉丝(2)</a>
                </div>
            </div>
            <div id="Stat" class="Mod">
                <div class="page-header">
                    <h4><strong>访客统计</strong></h4>
                </div>
                <ul>
                    <li>今日访问：2 (<a href="http://my.oschina.net/huxiang/visitors">查看最新访客»</a>)</li>
                    <li>昨日访问：8</li>
                    <li>本周访问：13</li>
                    <li>本月访问：59</li>
                    <li>所有访问：170</li>
                </ul>
            </div>
            <!-- 粉丝区 end-->

        </div>
        <!-- 左边 end-->

        <!-- 中间 begin-->
        <div class="span6">
            <!-- 动弹 begin-->
            <div id="MyTweetForm">
                <div id="TFormTitle">
                    <span class="r">还可以输入<em id="TweetContentLength">160</em>字</span>
                    今天你动弹了吗？
                </div>
                <form id="TForm">
                    <div id="TFormEditor">
                        <textarea id="TXT_Tweet_Text" name="msg"></textarea>
                    </div>
                </form>
                <div id="TFormOpts">
                    <button class="B">发布</button>
                    <div style="clear:right;"></div>
                </div>
            </div>
            <!-- 动弹 end-->

            <!-- 主区域 begin-->
            <div id="Logs" class="MMod">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#A" data-toggle="tab">动弹</a></li>
                    <li><a href="#B" data-toggle="tab">讨论区</a></li>
                    <li><a href="#C" data-toggle="tab">新闻</a></li>
                    <li><a href="#D" data-toggle="tab">博客</a></li>
                </ul>
                <div class="tabbable">
                    <div class="tab-content">
                        <div class="tab-pane active" id="A">
                            <ul id="MyTweet" class="UserLogs">
                                <li class="Tweet">
                                    <table class="ostable">
                                        <tbody>
                                            <tr>
                                                <td class="TweetUser">
                                                    <a href="http://my.oschina.net/zhlmmc"><img align="absmiddle" user="28" class="SmallPortrait" title="虫虫" alt="虫虫" src="http://static.oschina.net/uploads/user/0/28_50.jpg?t=1355825992000"></a>
                                                </td>
                                                <td class="TweetContent">
                                                    <h5>
                                                        <a class="user" href="http://my.oschina.net/zhlmmc">虫虫</a>
                                                        <span class="action">回复了动态</span>
                                                    </h5>
                                                    <div class="post">同感 <img alt="20" src=""></div>
                                                    <div class="ref">
                                                        <div class="p"><a target="_blank" href="http://my.oschina.net/pes21gamer">@暴走游侠</a>：
                                                            其实刚刚Git@OSC的LOGO只露两个眼睛那个感觉挺好的：）<a target="_blank" class="referer" href="http://my.oschina.net/javayou">@红薯</a>  <a target="_blank" class="referer" href="http://my.oschina.net/jack230230">@王振威</a>  <a target="_blank" class="referer" href="http://my.oschina.net/happysha">@曾沙</a>
                                                            <a href="http://my.oschina.net/pes21gamer/tweet/2282623">查看»</a>
                                                        </div>
                                                    </div>
                                                    <div class="bottom">
                                                        <div class="opts">
                                                            <a class="TweetReplyLnk" href="javascript:tweet_reply(2282630)">评论<span>(<span id="log_reply_count_2282630">2</span>)</span></a>
                                                        </div>
                                                        <div class="time">19分钟前 </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
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
                        <div class="tab-pane" id="B">
                            <p>Howdy, I'm in Section B.</p>
                        </div>
                        <div class="tab-pane" id="C">
                            <p>What up girl, this is Section C.</p>
                        </div>
                        <div class="tab-pane" id="D">
                            <p>What up girl, this is Section C.</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 主区域 end-->
        </div>
        <!-- 中间 end-->

        <div class="span3"></div>
    </div>
<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>