<#--
    分页标签：用于显示数据分页链接。
    page：分页对象。
    url：链接地址
-->

<#assign pageNumber=pageNumber!1>
<#assign totalPage=totalPage!1>
<#assign url=url!"">

<#macro buildUrl baseurl addurl>
    <#if baseurl?index_of("?") == -1>
    ${baseurl}?${addurl}
    <#else>
    ${baseurl}&${addurl}
    </#if>
</#macro>

<div class="pagination">
    <ul>

    <#if pageNumber != 1>
        <li><a href="<@buildUrl baseurl=url addurl="p="+(pageNumber-1)/>">&larr;</a></li>

    </#if>

    <#assign start = 1>
    <#if (start < pageNumber - 3)>
        <#assign start = pageNumber - 3>
        <li><a href="<@buildUrl baseurl=url addurl="p=1"/>">1</a></li>
    </#if>

    <#assign end = pageNumber + 4>
    <#if totalPage < end>
        <#assign end = totalPage>
    </#if>


    <#list start..end as i>
        <li class="<#if i == pageNumber>active</#if>"><a href="<@buildUrl baseurl=url addurl="p=" + i/>">${i}</a></li>
    </#list>

    <#if (totalPage - 1 >= end)>
        <li><a href="<@buildUrl baseurl=url addurl="p="+totalPage/>">${totalPage}</a></li>
    </#if>

    <#if pageNumber != totalPage>
        <li><a href="<@buildUrl baseurl=url addurl="p="+(pageNumber+1)/>">&rarr;</a></li>
    </#if>

    </ul>
</div>