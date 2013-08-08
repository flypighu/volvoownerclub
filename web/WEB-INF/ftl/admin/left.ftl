<div class="AdminNav">
    <a title="返回我的空间首页" class="u" href="${_BASE_PATH}/u/${_sessionob.getStr("url")}">
        <img align="absmiddle" user="${_sessionob.getInt("id")}" class="SmallPortrait"
             title="${_sessionob.getStr("name")}" alt="${_sessionob.getStr("name")}"
             src="${_BASE_PATH}/${_getUserPicUrl(_sessionob.getStr("pic")!)}">
    </a>
    <a title="返回空间管理首页" class="h" href="${_BASE_PATH}/admin/${_sessionob.getStr("name")}">空间管理</a>
</div>

<div id="adminMenu" class="Mod">
<#if _sessionob.get("level") == "0201" || _sessionob.get("level") == "0202" || _sessionob.get("level") == "0203">
    <ul>
        <li class="caption">
            <div class="page-header">
                <h4><strong>个人信息管理</strong></h4>
            </div>
            <ol>
                <li rel="profile"><a href="${_BASE_PATH}/admin/profile">修改个人资料</a></li>
                <li rel="chpwd"><a href="${_BASE_PATH}/admin/chpwd">修改登录密码</a></li>
                <li rel="portrait"><a href="${_BASE_PATH}/admin/portrait">更改头像图片</a></li>
                <li rel="userSettings"><a href="${_BASE_PATH}/admin/userSettings">空间个性化设置</a></li>
                <li rel="changeEmail"><a href="${_BASE_PATH}/admin/changEmail">修改登录邮箱</a></li>
            </ol>
        </li>
    </ul>
    <ul>
        <li class="caption">
            <div class="page-header">
                <h4><strong>其它方面管理</strong></h4>
            </div>
            <ol>
                <li rel="releases"><a href="${_BASE_PATH}/admin/releases">新闻投递</a></li>
                <#--<li rel="links"><a href="${_BASE_PATH}/admin/links">友情链接管理</a></li>-->
            </ol>
        </li>
    </ul>
</#if>
<#if _sessionob.get("level") == "0202" || _sessionob.get("level") == "0203">
    <ul>
        <li class="caption">
            <div class="page-header">
                <h4><strong>管理员功能</strong></h4>
            </div>
            <ol>
                <li rel="review"><a href="${_BASE_PATH}/admin/review">新闻审核</a></li>
                <#if _sessionob.get("level") == "0203">
                    <li rel="member"><a href="${_BASE_PATH}/admin/member">用户管理</a></li>
                </#if>
            </ol>
        </li>
    </ul>
</#if>


</div>
<script type="text/javascript">
    var rel = "${rel!}";
    $(function () {
        if ("" != rel.trim()) {
            $("#adminMenu").find("li[rel='" + rel + "']").addClass("active");
        }
    });
</script>