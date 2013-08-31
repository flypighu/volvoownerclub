<#if _sessionob?exists && _sessionob.id = u.id>
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
<#else>
<div id="MyTweetForm">
<table class="table table-bordered ">
    <tr>
        <td><strong>加入时间：</strong></td>
        <td>${u.regtime}<#if u.lastlogintime?exists> , 最近登录：${_checkTimeQian(u.lastlogintime)}</#if></td>
    </tr>
    <tr>
        <td><strong>来自：</strong></td>
        <td>${u.province} -- ${u.city}</td>
    </tr>
</table>
</div>
</#if>