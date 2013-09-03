<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">
<#include "/WEB-INF/ftl/common/include.ftl"/>

    <title>
    <#if _sessionob.getStr("title")?exists>
    ${user.name} 详细信息 - ${_sessionob.getStr("title")} - 沃尔沃车友俱乐部
    <#else>
    ${user.name} 详细信息 - ${_sessionob.getStr("name")} - 沃尔沃车友俱乐部
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
                <li><a href="${_BASE_PATH}/admin/${_sessionob.getStr("name")}">管理</a> <span class="divider">/</span>
                </li>
                <li class="active">${user.name} 详细信息</li>
            </ul>
            <div class="page-header">
                <h3><strong><img class="img-polaroid" src="${_BASE_PATH}${_getUserPicUrl(user.pic!)}"> ${user.name}</strong></h3>
            </div>
            <p>
            <#if !user.active_time?exists>
                <button id="sub" class="btn btn-success">激活</button>
                <script type="text/javascript">
                    $(function () {
                        $("#sub").click(function (e) {

                            e.preventDefault();

                            $.ajax({
                                url: "/admin/memberactive",
                                data: {id:${user.id}},
                                success: function (result) {

                                    alert("激活成功！");
                                    window.location.reload();
                                }
                            })
                        });
                    })
                </script>
            </#if>
                <a class="btn" href="javascript:history.go(-1);">返回</a>
            </p>
            <table class="table table-bordered " >
                <tbody>
                    <tr>
                        <td>邮箱：</td>
                        <td>${user.login_email}</td>
                    </tr>
                    <tr>
                        <td>用户名：</td>
                        <td>${user.name}</td>
                    </tr>
                    <tr>
                        <td>性别：</td>
                        <td><#if user.gender = "0101">男</#if><#if user.gender = "0102">女</#if></td>
                    </tr>
                    <tr>
                        <td>地区：</td>
                        <td>${user.province} -- ${user.city}</td>
                    </tr>
                    <tr>
                        <td>车牌号码：</td>
                        <td>${user.car_no}</td>
                    </tr>
                    <tr>
                        <td>车标号：</td>
                        <td>${user.flag_no!""}</td>
                    </tr>
                    <tr>
                        <td>车型：</td>
                        <td> <#list carlist as x>
                        ${x.ctype} -- ${x.cpz} <br>
                        </#list></td>
                    </tr>
                    <tr>
                        <td>注册时间：</td>
                        <td>${user.regtime}</td>
                    </tr>
                    <tr>
                        <td>最后一次登录时间：</td>
                        <td>${user.lastlogintime!}</td>
                    </tr>
                    <tr>
                        <td>激活时间：</td>
                        <td>${user.active_time!}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>
</html>
