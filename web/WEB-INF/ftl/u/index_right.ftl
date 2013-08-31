<!-- 车型信息 begin-->
<div class="RMod">
    <div class="page-header">
        <h4><strong>车型信息</strong></h4>
    </div>
    <ul>

    <#if u.flag_no?exists>
        <li>
            <strong>车标号：</strong>

            <p>${u.flag_no}</p>
        </li>
    <#else>
        <#if _sessionob?exists && _sessionob.id = u.id>
            <li>
                <strong>还没有车标号？</strong>

                <p><a href="#">我要申请</a></p>
            </li>
        </#if>
    </#if>


    <#if carList?exists>
        <li>
            <strong>车型：</strong>

            <#list carList as x>
                <p><a target="_blank" href="${x.pz_url}">${x.ctype} -- ${x.cpz}</a></p>
            </#list>
        </li>
    </#if>

    </ul>
</div>
<!-- 车型信息 end-->