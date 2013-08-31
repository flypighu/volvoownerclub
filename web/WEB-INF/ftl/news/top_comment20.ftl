<!-- 最新评论 begin-->
<div class="newsReplies">
    <div class="page-header">
        <h4><strong>最新评论（20）</strong></h4>
    </div>
    <ul>
    <#list rlist as r>
        <li>
            <span class="content">${r.simple}</span>
    	<span class="outline">
			来自 <a target="user" href="/u/${r.url}">${r.name}</a> 对
			<a href="/news/${r.id}">${r.title}</a> 的评论
		</span>
        </li>
    </#list>


    </ul>
</div>
<!-- 最新评论 end-->