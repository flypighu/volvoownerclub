<!DOCTYPE html>
<html lang='zh-CN' xml:lang='zh-CN' xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

<#include "/WEB-INF/ftl/common/include.ftl"/>

    <script src="/getCarJs"></script>

    <title>
    <#if _sessionob.getStr("title")?exists>
        车型维护 - ${_sessionob.getStr("title")} - 沃尔沃车友俱乐部
    <#else>
        车型维护 - ${_sessionob.getStr("name")} - 沃尔沃车友俱乐部
    </#if>
    </title>
</head>
<body>
<#include "/WEB-INF/ftl/common/top.ftl"/>
<div class="container admin">

    <div class="row">
        <div class="span3">
        <#include "/WEB-INF/ftl/admin/left.ftl"/>
        </div>
        <div class="span9">
            <ul class="breadcrumb">
                <li><a href="${_BASE_PATH}/u/${_sessionob.getStr("url")}">空间</a> <span class="divider">/</span></li>
                <li><a href="${_BASE_PATH}/admin/${_sessionob.getStr("name")}">管理</a> <span class="divider">/</span>
                </li>
                <li class="active">我的车型维护</li>
            </ul>
            <div class="page-header">
                <h3><strong>我的车型</strong></h3>
            </div>
            <div id="msg"></div>
            <p>

                <select class="input-medium" name="cType"
                        onchange="showcar(this.value, document.getElementById('carPz'));" id="car">
                    <option value="沃尔沃C30">沃尔沃C30</option>
                    <option value="沃尔沃C70">沃尔沃C70</option>
                    <option value="沃尔沃S40">沃尔沃S40</option>
                    <option value="沃尔沃S60">沃尔沃S60</option>
                    <option value="沃尔沃S80L">沃尔沃S80L</option>
                    <option value="沃尔沃XC60">沃尔沃XC60</option>
                    <option value="沃尔沃XC90">沃尔沃XC90</option>
                    <option value="沃尔沃V40">沃尔沃V40</option>
                    <option value="沃尔沃V60">沃尔沃V60</option>
                </select>

                <select class="input-large" name="carPz" id="carPz"></select></p>
            <p><a class="btn btn-success" href="#" id="addcar">新增车型</a></p>


            <table class="table table-striped table-bordered table-hover" id="otable">
                <thead>
                <tr>
                    <th>车型</th>
                    <th>车辆配置</th>
                    <th style="width:100px;">操作</th>

                </tr>
                </thead>

                <tbody>
                <#list carList as x>
                <tr rel="${x.id!}">

                    <td>${x.ctype}</td>
                    <td>${x.cpz}</td>
                    <td>
                        <#if x_index != 0> <a href="#" rel="${x.id}" oper="del">删除</a></#if>
                    </td>
                </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>





<#include "/WEB-INF/ftl/common/foot.ftl"/>
</div>
</body>
</html>
<script type="">
    $(function () {
        showcar("沃尔沃C30", document.getElementById('carPz'));

        $("#addcar").click(function (e) {

            e.preventDefault();

            $.ajax({
                url: "/admin/addcar",
                data: {
                    ctype: $("#car").val(),
                    cpz: $("#carPz").val()
                },
                success: function (re) {
                    window.location.reload();
                }
            })

        });

        $("#otable a[oper='del']").click(function (e) {

            e.preventDefault();
            $this = $(this);

            $.ajax({
                url: "/admin/delcar",
                data: {id: $this.attr("rel")},
                success: function (re) {
                    window.location.reload();
                }
            })
        });
    })

</script>