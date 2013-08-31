<#list list as x>
<li <#if x_index % 2 != 0> class="row_0" </#if>>
    <table width="100%">
        <tbody>
        <tr>
            <td class="portrait">
                <a href="${_BASE_PATH}/u/${x.url}">
                    <img align="absmiddle" src="${_BASE_PATH}${_getUserPicUrl(x.pic!)}">
                </a>
            </td>
            <td class="body">
                <div class="r_title">
                ${x.index + 1}楼：<b>${x.username}</b> 发表于 ${x.commenttime}
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