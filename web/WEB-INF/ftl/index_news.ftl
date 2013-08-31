<div class="VVnews">
    <div class="page-header">
        <h3><strong>沃沃资讯</strong>
                    <span class="pull-right">
                        <span class="btn btn-mini btn-primary dot" rel="p1"></span>
                        <span class="btn btn-mini dot" rel="p2"></span>
                        <span class="btn btn-mini dot" rel="p3"></span>
                        <small><a href="/news">更多>></a></small>
                    </span>
        </h3>
    </div>

    <ul class="unstyled p1">
        <#list p1 as x>
            <li class="today">
                <a target="_blank" title="${x.title}" href="/news/${x.id}">${x.title}</a>
                <span>${_checkTimeQian(x.reltime)} By ${x.name}</span>
                <span class="pull-right date">${x.reltime}</span>
            </li>
        </#list>

    </ul>
    <ul class="unstyled p2" style="display: none">
        <#list p2 as x>
            <li class="other">
                <a target="_blank" title="${x.title}" href="/news/${x.id}">${x.title}</a>
                <span>${_checkTimeQian(x.reltime)} By ${x.name}</span>
                <span class="pull-right date">${x.reltime}</span>
            </li>
        </#list>

    </ul>
    <ul class="unstyled p3" style="display: none">
    <#list p3 as x>
        <li class="other">
            <a target="_blank" title="${x.title}" href="/news/${x.id}">${x.title}</a>
            <span>${_checkTimeQian(x.reltime)} By ${x.name}</span>
            <span class="pull-right date">${x.reltime}</span>
        </li>
    </#list>
    </ul>
</div>
<script type="text/javascript">
    $(function () {

        $("div.VVnews div.page-header span.dot").mouseover(function () {

            $("div.VVnews div.page-header span.pull-right > span").removeClass("btn-primary");
            $(this).addClass("btn-primary");

            $("div.VVnews ul").hide();
            $("div.VVnews ul." + $(this).attr("rel") + "").show();
        });
    });
</script>