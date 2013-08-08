<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <script src="${_BASE_PATH}/assets/bootstrap/js/bootstrap-validation.js"></script>
    <script src="${_BASE_PATH}/static/js/admin_profile"></script>

    <title>
    <#if _sessionob.getStr("title")?exists>
    修改个人信息 - ${_sessionob.getStr("title")} - 沃尔沃车友俱乐部
    <#else>
    修改个人信息 - ${_sessionob.getStr("name")} - 沃尔沃车友俱乐部
    </#if>

    </title>
</head>
<body>
<#include "/WEB-INF/ftl/common/top.ftl"/>
<div class="container admin">

    <div class="row">
        <div class="span3">
        <#include "/WEB-INF/ftl/admin/left.ftl"/>
        </div>
        <div class="span9">
            <ul class="breadcrumb">
                <li><a href="${_BASE_PATH}/u/${_sessionob.getStr("url")}">空间</a> <span class="divider">/</span></li>
                <li><a href="${_BASE_PATH}/admin/${_sessionob.getStr("name")}">管理</a> <span class="divider">/</span></li>
                <li class="active">修改个人信息</li>
            </ul>
            <div class="page-header">
                <h3><strong>修改个人信息</strong></h3>
            </div>
            <div id="msg"></div>
            <form id="profileForm" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">登录帐号：</label>

                    <div class="controls">
                        <input class="input-xlarge disabled" type="text" placeholder="${user.get("login_email")}" disabled>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">昵称：</label>

                    <div class="controls">
                        <input check-type="required"type="text" class="input-xlarge"
                               placeholder="请输入昵称" value="${user.get("name")}" name="name">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">性别：</label>

                    <div class="controls">
                        <select class="input-medium" name="gender">
                            <option value="0101" <#if user.get("gender") == "0101">selected="true"</#if> >男</option>
                            <option value="0102" <#if user.get("gender") == "0102">selected="true"</#if>>女</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputPassword">居住地区：</label>

                    <div class="controls">
                        <select id="userProvince" class="input-medium"
                                onchange="showcity(this.value, document.getElementById('userCity'));"
                                name="province">
                            <option value="北京">北京</option>
                            <option value="上海">上海</option>
                            <option value="广东">广东</option>
                            <option value="江苏">江苏</option>
                            <option value="浙江">浙江</option>
                            <option value="重庆">重庆</option>
                            <option value="安徽">安徽</option>
                            <option value="福建">福建</option>
                            <option value="甘肃">甘肃</option>
                            <option value="广西">广西</option>
                            <option value="贵州">贵州</option>
                            <option value="海南">海南</option>
                            <option value="河北">河北</option>
                            <option value="黑龙江">黑龙江</option>
                            <option value="河南">河南</option>
                            <option value="湖北">湖北</option>
                            <option value="湖南">湖南</option>
                            <option value="江西">江西</option>
                            <option value="吉林">吉林</option>
                            <option value="辽宁">辽宁</option>
                            <option value="内蒙古">内蒙古</option>
                            <option value="宁夏">宁夏</option>
                            <option value="青海">青海</option>
                            <option value="山东">山东</option>
                            <option value="山西">山西</option>
                            <option value="陕西">陕西</option>
                            <option value="四川">四川</option>
                            <option value="天津">天津</option>
                            <option value="新疆">新疆</option>
                            <option value="西藏">西藏</option>
                            <option value="云南">云南</option>
                            <option value="香港">香港特别行政区</option>
                            <option value="澳门">澳门特别行政区</option>
                            <option value="台湾">台湾</option>
                            <option value="海外">海外</option>
                        </select>
                        <select check-type="required" class="input-medium" name="city" id="userCity"></select>
                        <script src="${_BASE_PATH}/assets/akf/getcity.js" type="text/javascript"></script>
                        <script type="text/javascript">
                            $(function(){
                                init_province_and_city(document.getElementById('userProvince'),'${user.get("province")}',document.getElementById('userCity'),'${user.get("city")}');
                            });
                        </script>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">手机号：</label>

                    <div class="controls">
                        <input type="text" class="input-xlarge" value="${user.get("tel")!}" name="tel">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">QQ：</label>

                    <div class="controls">
                        <input type="text" class="input-xlarge" value="${user.get("qq")!}" name="qq">
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button id="sub" class="btn btn-success">保存修改</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>
</html>