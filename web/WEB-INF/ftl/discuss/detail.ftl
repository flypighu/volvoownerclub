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

    <script type="text/javascript" src="${_BASE_PATH}/static/js/discuss_detail"></script>

    <title>${post.title} - 沃尔沃车友俱乐部</title>
</head>

<body>
<#include "/WEB-INF/ftl/common/top.ftl"/>


<div class="container news">

    <div class="row">
        <div class="span9">
            <div class="detail">
                <div class="page-header">
                    <h3><strong>${post.title}</strong></h3>
                </div>
                <p><a href="/u/${post.url}">${post.name}</a>
                    发布于： ${post.rtime},${post.reply}回/${post.click}阅
                    <#if post.last_reply?exists>
                        最后回答: ${post.last_reply}
                    </#if>
                </p>

                <div class="toolbar">
                    <div class="share">
                        <a class="bshareDiv" href="http://www.bshare.cn/share">分享</a>
                        <script type="text/javascript" charset="utf-8"
                                src="http://static.bshare.cn/b/buttonLite.js#uuid=b255160a-1dfa-4e23-bdac-db791fd50600&style=2&textcolor=#000000&bgcolor=none&bp=sinaminiblog,qqmb,qzone&ssc=false&text=分享"></script>
                    </div>
                </div>
                <div class="newscontent textcontent">
                    <p class="c">
                    ${post.content}
                    </p>

                    <a name="comments"></a>
                </div>
            </div>

            <div class="comments">
                <h2>
                    <a class="more" href="#">回到顶部</a>
                    <a style="margin-right:10px;color:#ff3;" class="more" href="#CommentForm">发表评论</a>
                    共 ${comments.getTotalRow()} 个评论
                </h2>
                <ul>
                <#list comments.getList() as x>
                    <li <#if x_index % 2 != 0> class="row_0" </#if>>
                        <table width="100%">
                            <tbody>
                            <tr>
                                <td class="portrait">
                                    <a href="${_BASE_PATH}/u/${x.getStr("url")}">
                                        <img align="absmiddle" src="${_BASE_PATH}${_getUserPicUrl(x.get("pic")!)}">
                                    </a>
                                </td>
                                <td class="body">
                                    <div class="r_title">
                                    ${x_index + 1}楼：<b>${x.username}</b> 发表于 ${x.commenttime}
                                        <span class="opts">
											<a href="javascript:void(0);" class="reply" rel="${x.id}">回复此评论</a>
							            </span>
                                    </div>
                                    <div class="r_content TextContent">
                                    ${x.comment}
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </li>
                </#list>
                </ul>
            </div>
            <div class="commentForm">
                <a name="CommentForm"></a>
                <form class="form-horizontal" id="cf">
                    <input type="hidden" name="c" value="${c}">
                    <input type="hidden" name="postid" value="${post.id}">
                    <div class="control-group">
                        <textarea  style="width: 392px; height: 135px;" name="txt" id="cftxt"></textarea>
                    </div>
                    <div>
                        <button class="btn btn-success" id="cfbtn">发表评论</button>
                        <span class="help-inline">与内容无关的评论将被删除，严重者禁用帐号</span>
                    </div>
                </form>
                <a class="more" href="#">回到顶部</a>
                <a class="more" href="#comments">回到评论列表</a>
            </div>
            <div class="commentForm" id="div_reply" style="display: none;padding-left:0;">
                <form class="form-horizontal" id="cf_reply">
                    <input type="hidden" name="c" value="${c}">
                    <input type="hidden" name="postid" value="${post.id}">
                    <input type="hidden" name="commentid">
                    <div class="control-group">
                        <textarea  style="width: 400px; height: 80px;" name="txt_reply" id="cftxt_reply"></textarea>
                    </div>
                    <div>
                        <button class="btn btn-success" id="cfbtn_reply">回复</button>
                        <button class="btn" id="cfclose_reply">关闭</button>
                        <span class="help-inline">文明上网，理性发言</span>
                    </div>
                </form>
            </div>
        </div>

        <div class="span3">
            <!-- 广告位1 begin-->
            <div style="height: 100px;margin-top: 10px;border: solid 1px;">
                <p class="text-center">右侧广告位</p>
            </div>
            <!-- 广告位1 end-->
        </div>
    </div>

<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>

</body>

</html>