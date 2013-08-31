<#if rlist?exists>
<!-- 活跃会员 begin-->
<div class="hotuser">
    <div class="page-header">
        <h4><strong>活跃会员（TOP20）</strong></h4>
    </div>
    <ul class="unstyled">
        <#list rlist as x>
            <li>
                <a target="_blank" title="${x.name}" href="/u/${x.url}">
                    <img align="absmiddle" user="${x.id}" title="${x.name}" alt="${x.name}" src="${_getUserPicUrl(x.pic!)}">
                </a>
                <p>
                    <a target="_blank" title="${x.name}" href="/u/${x.url}">${x.name}</a>
                </p>
            </li>
        </#list>
    </ul>
</div>
<!-- 活跃会员 end-->
</#if>



