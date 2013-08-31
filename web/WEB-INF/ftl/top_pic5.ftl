<!-- 滚动图片 bedin-->
<div id="myCarousel" class="carousel slide">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>
    <div class="carousel-inner">
        <#list rlist as x>
            <div class="item <#if x_index == 0>active</#if>">
                <img src="${x.indexpic}" alt="${x.title}">

                <div class="carousel-caption">
                    <h4><a target="_blank" href="/news/${x.id}">${x.title}</a></h4>

                    <p>${x.indexs}</p>
                </div>
            </div>
        </#list>

    </div>

    <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>
<!-- 滚动图片 end-->