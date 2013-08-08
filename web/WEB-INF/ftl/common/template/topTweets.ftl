<#list list as x>
<li log="${x.moveid}">
    <span class="portrait">
        <a target="_blank" href="${_BASE_PATH}/u/${x.userurl}">
            <img align="absmiddle" user="${x.userid}" class="SmallPortrait" title="${x.username}" alt="${x.username}"
                                    src="${_BASE_PATH}${_getUserPicUrl(x.userpic!)}">
        </a>
    </span>
	<span class="body">
		<span class="user"><a href="${_BASE_PATH}/u/${x.userurl}">${x.username}</a>：</span>
        <span class="log">${x.txt}</span>
        <span class="time">${x.dTime}(<a href="${_BASE_PATH}/dongtan/${x.moveid}">${x.comments}评</a>)</span>
	</span>

    <div class="clear"></div>
</li>
</#list>