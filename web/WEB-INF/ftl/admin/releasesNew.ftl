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
    <script src="${_BASE_PATH}/assets/jcrop/ajaxfileupload.js"></script>
    <script src="${_BASE_PATH}/static/js/admin_releaseNew"></script>

    <title>
    <#if _sessionob.getStr("title")?exists>
        新闻投递 - ${_sessionob.getStr("title")} - 沃尔沃车友俱乐部
    <#else>
        新闻投递 - ${_sessionob.getStr("name")} - 沃尔沃车友俱乐部
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
                <li><a href="${_BASE_PATH}/admin/releases">我的新闻</a> <span class="divider">/</span></li>
                <li class="active">投递新闻</li>
            </ul>
            <div class="page-header">
                <h3><strong>投递新闻</strong></h3>
            </div>
            <div id="msg"></div>
            <div class="row">
                <div class="span5">
                    <form id="releaseForm" class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label">新闻标题：</label>

                            <div class="controls">
                                <input check-type="required" class="input-xlarge" type="text" placeholder="请输入新闻标题" name="title">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">新闻出处：</label>

                            <div class="controls">
                                <input type="text" class="input-xlarge"
                                       placeholder="新闻出处可以不填" name="from">
                                <span class="help-block">如果是原创的新闻，则不需要填写；如果是转载的新闻，则需要填写从哪里转载的</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">是否显示在首页：</label>

                            <div class="controls">
                                <input type="radio" name="isindex" value="N" checked="true" param="false"> 否
                                <input type="radio" name="isindex" value="Y" param="false"> 是
                                <span class="help-block">选择是否该篇新闻显示在首页的图片区域</span>
                            </div>
                        </div>
                        <div class="control-group zhaiyao" style="display: none">
                            <label class="control-label">首页图片摘要：</label>

                            <div class="controls">
                                <textarea class="input-xlarge" rows="2" name="indexpics" placeholder="请输入图片摘要"></textarea>
                            </div>
                        </div>
                        <div class="control-group picfile" style="display: none">
                            <label class="control-label">首页图片文件：</label>

                            <div class="controls">
                                <input class="input-file" id="imgFile" name="imgFile" type="file">

                                <span class="help-block">图片大小最好为700 * 500，尺寸差别太大会变形</span>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <button id="upload" class="btn btn-success" style="display: none">上传图片</button>
                                <button id="sub" class="btn btn-success">保存新闻</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="span3 well">
                    <p>只有经过管理员审批过的新闻才会正式发布在社区资讯中心。</p>
                    <ul>
                        <li>必须是和车相关的新闻内容</li>
                        <li>必须是最近一周内的新闻</li>
                    </ul>
                </div>
            </div>

            <textarea id="editor_id" name="content" style="width: 800px;height: 300px;">

            </textarea>

            <br>
            <img id="uploadimg" style="display: none">
        </div>
    </div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>
</html>