<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>


    <title>窝窝生活的个人页面 - 沃尔沃车友俱乐部</title>
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
                    <li class="active"><a href="${_BASE_PATH}/">首页</a></li>
                    <li><a href="${_BASE_PATH}/news">资讯</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">讨论区 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="${_BASE_PATH}/discuss/question">沃沃问答</a></li>
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
                <#--当前访客身份：游客[ <a href="#" class="navbar-link">登录</a> | <a href="#" class="navbar-link">加入沃沃俱乐部</a> ]-->
                    huxiang,您好 <a href="${_BASE_PATH}/user/huxiang" class="navbar-link">我的空间</a> | <a href="#" class="navbar-link">投递新闻</a>| <a href="#" class="navbar-link">退出</a>
                </div>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="span3">
            <span class="label label-success">
                <a href="http://my.oschina.net/huxiang">
                    <img class="img-polaroid" align="absmiddle" title="flypighu" alt="flypighu" src="http://static.oschina.net/uploads/user/93/186208_100.jpg?t=1371622904000">
                </a>
            </span>
        </div>
        <div class="span9">

        </div>
    </div>
</div>
</body>
</html>