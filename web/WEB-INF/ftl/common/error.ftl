<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>抱歉，出现错误</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <style type="text/css">
        body {margin-top:100px;background:#fff;font-family: Verdana, Tahoma;}
        a {color:#CE4614;}
        #msg-box {color: #CE4614; font-size:0.9em;text-align:center;}
        #msg-box .logo {border-bottom:5px solid #ECE5D9;margin-bottom:20px;padding-bottom:10px;}
        #msg-box .title {font-size:1.4em;font-weight:bold;margin:0 0 10px 0;}
        #msg-box .nav {margin-top:20px;}
    </style>
</head>
<body>
<div id='msg-box'>
    <div class='logo'><a href="/"></a></div>
    <div class='title'>抱歉，系统报告以下错误：</div>
    <div class='msg'>${_error!}</div>
    <div class='nav'><a href="javascript:history.go(-1)">返回上页</a> <a href="${_BASE_PATH}/">返回首页</a></div>
</div>
</div>
</body>
</html>