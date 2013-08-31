<div class="span3">

    <!-- 个人头像区 begin-->
    <div class="owner label-success">
        <a class="Img" href="${_BASE_PATH}/u/${u.url}">
            <img class="img-polaroid" src="${_BASE_PATH}${_getUserPicUrl(u.pic!)}">
        </a>
                <span class="U">
                    <a class="Name" title="男" href="${_BASE_PATH}/u/${u.url}">${u.name}</a>
		            <span class="opts">
                        <#if u.gender="0101"><img class="img-rounded" title="男" src="${_BASE_PATH}/assets/img/men.png"></#if>
                        <#if u.gender="0102"><img class="img-rounded" title="女" src="${_BASE_PATH}/assets/img/women.png"></#if>
                        <#if _sessionob?exists && _sessionob.id = u.id>
                            <a href="${_BASE_PATH}/admin/profile">修改资料</a>
			                    <a href="${_BASE_PATH}/admin/portrait">更换头像</a>
                        <#else>
                            <a title="成为TA的粉丝" href="#" id="follows" rel="${u.id}">关注此人</a>
                        </#if>

        		    </span>
                </span>
        <div class="clear"></div>
        <div class="stat">
            <a href="#" id="f">关注(${u.follow})</a>
            <a href="#" id="fans">粉丝(${u.befollowed})</a>
        <#--<a title="查看OSCHINA积分规则" href="http://www.oschina.net/question/3307_20931">积分(26)</a>-->
        </div>
    </div>
    <!-- 个人头像区 end-->

    <!-- 个性签名区和按钮功能 begin-->
    <div class="Resume" style="">这个人很懒，啥也没写</div>
    <div class="Opts clearfix">
    <#if _sessionob?exists && _sessionob.id = u.id>
        <a class="a1 blog" href="#"><i>.</i><span>发表博文</span></a>
        <a class="a2 admin" href="${_BASE_PATH}/admin/${_sessionob.getStr("name")}"><i>.</i><span>空间管理</span></a>
    </#if>

    </div>
    <!-- 个性签名区和按钮功能 end-->

    <!-- 粉丝区 begin-->
    <div id="Fellows" class="Mod Users">
        <div class="page-header">
            <h4><strong>关注</strong></h4>
        </div>
        <ul class="clearfix">
        <#if follow?exists>
            <#list follow as x>
                <li>
                    <a title="${x.name}" href="/u/${x.url}">
                        <img align="absmiddle" user="${x.id}" class="SmallPortrait" title="${x.name}" alt="${x.name}"
                             src="${_getUserPicUrl(x.pic!)}">
                    </a>
                </li>
            </#list>
        <#else>
            <p class="text-center">还没有关注任何人哦！</p>
        </#if>

        </ul>
        <div class="more">
            <a href="#">显示所有关注(${u.follow})</a>
        </div>
    </div>
    <div id="Fans" class="Mod Users">
        <div class="page-header">
            <h4><strong>粉丝</strong></h4>
        </div>
        <ul class="clearfix">
        <#if befollowed?exists>
            <#list befollowed as x>
                <li>
                    <a title="${x.name}" href="/u/${x.url}">
                        <img align="absmiddle" user="${x.id}" class="SmallPortrait" title="${x.name}" alt="${x.name}"
                             src="${_getUserPicUrl(x.pic!)}">
                    </a>
                </li>
            </#list>
        <#else>
            <p class="text-center">还没有粉丝哦！</p>
        </#if>
        </ul>
        <div class="more">
            <a href="#">显示所有粉丝(${u.befollowed})</a>
        </div>
    </div>
    <!--
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
    -->
    <!-- 粉丝区 end-->

</div>