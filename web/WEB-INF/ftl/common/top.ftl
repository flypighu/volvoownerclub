<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="/">沃沃 旅行游记 分享</a>

            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li rel="index"><a href="${_BASE_PATH}/">首页</a></li>
                    <li rel="news"><a href="${_BASE_PATH}/news">资讯</a></li>
                    <li rel="1"><a href="${_BASE_PATH}/discuss?c=1">沃沃问答</a></li>
                    <li rel="2"><a href="${_BASE_PATH}/discuss?c=2">维修改装</a></li>
                    <li rel="3"><a href="${_BASE_PATH}/discuss?c=3">自驾游</a></li>
                    <!--
                    <li rel="4"><a href="${_BASE_PATH}/discuss?c=4">沃友摄影</a></li>
                    -->
                    <li rel="5"><a href="${_BASE_PATH}/discuss?c=5">站务/建议</a></li>
                    <!--
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">讨论区 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        </ul>
                    </li>

                    <li rel="blog"><a href="#">博客</a></li>
                    <li rel="community"><a href="#about">车友圈</a></li>
                    -->
                </ul>
                <div class="navbar-text pull-right" style="color: #ddd;">
                <#if _sessionob?exists>
                ${ _sessionob.getStr("name")},您好 <a href="${_BASE_PATH}/u/${ _sessionob.getStr("url")}"
                                                    class="navbar-link">我的空间</a> | <a href="${_BASE_PATH}/admin/releasesNew"
                                                                                      class="navbar-link">投递新闻</a> | <a
                        id="logout" href="#" class="navbar-link">退出</a>
                <#else>
                    当前访客身份：游客[ <a href="${_BASE_PATH}/u/login" class="navbar-link">登录</a> | <a
                        href="${_BASE_PATH}/u/register" class="navbar-link">加入沃沃俱乐部</a> ]
                </#if>
                </div>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</div>
<script type="text/javascript">
    var rel = "${rel!}";
    var isLogin = ${_ISLOGIN!};
    $(function () {
        if ("" != rel.trim()) {
            $("ul.nav").find("li[rel='" + rel + "']").addClass("active");
        }
        $("#logout").click(function (e) {

            $.ajax({
                url: "${_BASE_PATH}/u/logout",
                success: function (result) {

                    window.location.href = "${_BASE_PATH}/";
                }
            });

            e.preventDefault();
        })
    });
</script>