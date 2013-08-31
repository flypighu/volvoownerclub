<div class="tabbable hotnews">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab1" data-toggle="tab">本周热点</a></li>
        <li><a href="#tab2" data-toggle="tab">本月热点</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab1">
            <ul class="unstyled p1">
                <#list bz as x>
                    <li>
                        <a target="_blank" title="${x.title}" href="/news/${x.id}">${x.title}</a>
                        <span class="pull-right date">发布于 ${x.reltime}</span>
                        <span class="pull-right stat"><em>${x.reply}</em>评论/<em>${x.click}</em>浏览</span>
                    </li>
                </#list>

            </ul>
        </div>
        <div class="tab-pane" id="tab2">
            <ul class="unstyled p2">
            <#list by as x>
                <li>
                    <a target="_blank" title="${x.title}" href="/news/${x.id}">${x.title}</a>
                    <span class="pull-right date">发布于 ${x.reltime}</span>
                    <span class="pull-right stat"><em>${x.reply}</em>评论/<em>${x.click}</em>浏览</span>
                </li>
            </#list>
            </ul>
        </div>
    </div>
</div>