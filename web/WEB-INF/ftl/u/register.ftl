<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <script src="${_BASE_PATH}/assets/bootstrap/js/bootstrap-validation.js"></script>
    <script src="${_BASE_PATH}/static/js/u_register"></script>

    <title>加入沃沃俱乐部 - 沃尔沃车友俱乐部</title>
</head>
<body>

<#include "/WEB-INF/ftl/common/top.ftl"/>

<div class="container">
    <div class="row">
        <div class="span8 offset2 reg">
            <div class="page-header">
                <h3><strong>加入沃沃俱乐部</strong></h3>
            </div>
            <form id="registerForm" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">电子邮箱：</label>

                    <div class="controls">
                        <input check-type="required mail" name="email" class="input-xlarge" type="text"
                               placeholder="请填写真实邮箱，用于接收您的帐号">
                        <span class="help-block">本社区没有开放注册，您的注册经过我们审核之后，会把帐号、密码发送到您的邮箱。</span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">姓名：</label>

                    <div class="controls">
                        <input check-type="required" name="username" class="input-xlarge" type="text"
                               placeholder="不能超过10个字">
                        <span class="help-block">是您在本社区的名称哦</span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">车牌号码：</label>

                    <div class="controls">
                        <input check-type="required" name="carNo" class="input-xlarge" type="text"
                               placeholder="请填写真实的车牌号码">
                        <span class="help-block">本社区是一个真实的社区，因此需要您的真实信息，车牌号码不会在本社区的任何地方公开。</span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">车友会车标号：</label>

                    <div class="controls">
                        <input name="flagNo" class="input-xlarge" type="text"
                               placeholder="请填写车友会车标号">
                        <span class="help-block">没有车标号的可以不填写，注册成功后可以在线申请车标。</span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">性别：</label>

                    <div class="controls">
                        <select class="input-medium" name="gender">
                            <option value="0101">男</option>
                            <option value="0102">女</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">居住地区：</label>

                    <div class="controls">
                        <select class="input-medium"
                                onchange="showcity(this.value, document.getElementById('userCity'));"
                                name="province">
                            <option value="北京">北京</option>
                            <option value="上海">上海</option>
                            <option value="广东">广东</option>
                            <option value="江苏">江苏</option>
                            <option value="浙江">浙江</option>
                            <option value="重庆">重庆</option>
                            <option value="安徽">安徽</option>
                            <option value="福建" selected>福建</option>
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
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">选择车型：</label>

                    <div class="controls">
                        <select class="input-medium"
                                onchange="showcar(this.value, document.getElementById('carPz'));"
                                name="cType">
                            <option value="沃尔沃C30">沃尔沃C30</option>
                            <option value="沃尔沃C70">沃尔沃C70</option>
                            <option value="沃尔沃S40">沃尔沃S40</option>
                            <option value="沃尔沃S60">沃尔沃S60</option>
                            <option value="沃尔沃S80L">沃尔沃S80L</option>
                            <option value="沃尔沃XC60">沃尔沃XC60</option>
                            <option value="沃尔沃XC90">沃尔沃XC90</option>
                            <option value="沃尔沃V40">沃尔沃V40</option>
                            <option value="沃尔沃V60">沃尔沃V60</option>
                        </select>
                        <select check-type="required" class="input-large" name="carPz" id="carPz"></select>
                        <script src="${_BASE_PATH}/getCarJs" type="text/javascript"></script>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <a id="sub" class="btn btn-success">注册新用户</a>
                    </div>
                </div>
            </form>

        </div>

    </div>
<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>
