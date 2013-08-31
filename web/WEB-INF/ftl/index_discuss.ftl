
<div class="discuss">
    <div class="page-header">
        <h3><strong>讨论区</strong>
            <small>
                <a class="btn" href="/discuss?c=1">沃沃问答</a>
                <a class="btn" href="/discuss?c=2">维修改装</a>
                <a class="btn" href="/discuss?c=3">自驾游</a>
                <a class="btn" href="/discuss?c=5">站务/建议</a>
            </small>
                    <span class="pull-right">
                        <small><a href="/discuss">更多>></a></small>
                    </span>
        </h3>
    </div>
    <!--
    <div class="hotlabel">
        热门标签：
        <a class="btn btn-success btn-small" href="#">KN进气</a>
        <a class="btn btn-success btn-small" href="#">S60日行灯</a>
        <a class="btn btn-success btn-small" href="#">XC60脚踏板</a>
        <a class="btn btn-success btn-small" href="#">KN进气</a>
        <a class="btn btn-success btn-small" href="#">S60日行灯</a>
        <a class="btn btn-success btn-small" href="#">XC60脚踏板</a>
        <a class="btn btn-success btn-small" href="#">KN进气</a>
    </div>
    -->
    <table class="table table-condensed p1">
        <tbody>
        <#list p1 as x>
            <tr>
                <td class="thread"><a class="<#if x.disid == 1>thread_type_2<#else>thread_type_1</#if>"
                                      href="/discuss/${x.disid}_${x.id}" title="${x.title}"
                                      target="_blank">${x.title}</a><span
                        class="stat">${_checkTimeQian(x.rtime)} By ${x.name}</span>
                </td>
                <td class="lastpost">${x.reply}回/${x.click}阅</td>
            </tr>
        </#list>

        </tbody>
    </table>
    <table class="table table-condensed p2" style="display: none">
        <tbody>
        <#list p2 as x>
        <tr>
            <td class="thread"><a class="<#if x.disid == 1>thread_type_2<#else>thread_type_1</#if>"
                                  href="/discuss/${x.disid}_${x.id}" title="${x.title}"
                                  target="_blank">${x.title}</a><span
                    class="stat">${_checkTimeQian(x.rtime)} By ${x.name}</span>
            </td>
            <td class="lastpost">${x.reply}回/${x.click}阅</td>
        </tr>
        </#list>

        </tbody>
    </table>
    <table class="table table-condensed p3" style="display: none">
        <tbody>
        <#list p3 as x>
        <tr>
            <td class="thread"><a class="<#if x.disid == 1>thread_type_2<#else>thread_type_1</#if>"
                                  href="/discuss/${x.disid}_${x.id}" title="${x.title}"
                                  target="_blank">${x.title}</a><span
                    class="stat">${_checkTimeQian(x.rtime)} By ${x.name}</span>
            </td>
            <td class="lastpost">${x.reply}回/${x.click}阅</td>
        </tr>
        </#list>

        </tbody>
    </table>
    <div>
        <span class="btn btn-mini dot btn-primary" rel="p1"></span>
        <span class="btn btn-mini dot" rel="p2"></span>
        <span class="btn btn-mini dot" rel="p3"></span>
        <span class="pull-right">
             <small><a href="/discuss">更多>></a></small>
        </span>

    </div>
</div>
<script type="text/javascript">
    $(function () {

        $("div.discuss span.dot").mouseover(function () {

            $("div.discuss span.dot").removeClass("btn-primary");
            $(this).addClass("btn-primary");

            $("div.discuss table").hide();
            $("div.discuss table." + $(this).attr("rel") + "").show();
        });
    });
</script>