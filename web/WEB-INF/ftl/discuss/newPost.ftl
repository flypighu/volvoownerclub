<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <script src="${_BASE_PATH}/assets/bootstrap/js/bootstrap-validation.js"></script>
    <script charset="utf-8" src="${_BASE_PATH}/assets/kindeditor/kindeditor-min.js"></script>
    <script charset="utf-8" src="${_BASE_PATH}/assets/kindeditor/lang/zh_CN.js"></script>

    <script src="${_BASE_PATH}/static/js/discuss_newPost"></script>

    <title>
    <#if _sessionob.getStr("title")?exists>
        我要发帖 - ${_sessionob.getStr("title")} - 沃尔沃车友俱乐部
    <#else>
        我要发帖 - ${_sessionob.getStr("name")} - 沃尔沃车友俱乐部
    </#if>

    </title>
</head>
<body>
<#include "/WEB-INF/ftl/common/top.ftl"/>
<div class="container admin">

    <div class="row">
        <div class="span12">
            <div class="page-header">
                <h3><strong>我要发帖</strong></h3>
            </div>
            <div id="msg"></div>
            <div class="row">
                <div class="span8">
                    <form id="releaseForm" class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label">标题：</label>

                            <div class="controls">
                                <input check-type="required" class="input-xxlarge" type="text" name="title">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">分类：</label>

                            <div class="controls">
                                <button class="btn <#if c == 1>btn-info</#if>" rel="1">沃沃问答</button>
                                <button class="btn <#if c == 2>btn-info</#if>" rel="2">维修装修</button>
                                <button class="btn <#if c == 3>btn-info</#if>" rel="3">自驾游</button>
                                <button class="btn <#if c == 4>btn-info</#if>" rel="4">沃友摄影</button>
                                <button class="btn <#if c == 5>btn-info</#if>" rel="5">站务/建议</button>
                            </div>
                        </div>
                    </form>
                    <h4><strong> 请对帖子进行详细描述：</strong></h4>
                    <textarea id="editor_id" name="content" style="width: 720px;height: 300px; margin-left: 20px;">

                    </textarea>
                    <div style="margin-top: 30px;">
                        <button id="sub" class="btn btn-success">发帖</button>
                    </div>

                </div>
                <div class="span3 well">
                    <p style="color: mediumvioletred">提问和发帖必读</p>
                    <ul>
                        <li>跟车无关的请不要发布</li>
                        <li>上传真实头像，可使问题获更好排位</li>
                        <li>模糊或过于简单的标题会被降低排位</li>
                        <li>提问1小时后且有人回答即不允许修改和删除</li>
                        <li>图片上传请勿超过200K</li>
                    </ul>
                </div>
            </div>


        </div>
    </div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>
</html>