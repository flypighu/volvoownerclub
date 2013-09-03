<html>
<head></head>
<body>
<p>

<h1>${user.name} 用户申请激活</h1>
</p>
<p>
<table>
    <tbody>
    <tr>
        <td>邮箱：</td>
        <td>${user.login_email}</td>
    </tr>
    <tr>
        <td>用户名：</td>
        <td>${user.name}</td>
    </tr>
    <tr>
        <td>性别：</td>
        <td><#if user.gender = "0101">男</#if><#if user.gender = "0102">女</#if></td>
    </tr>
    <tr>
        <td>地区：</td>
        <td>${user.province} -- ${user.city}</td>
    </tr>
    <tr>
        <td>车牌号码：</td>
        <td>${user.car_no}</td>
    </tr>
    <tr>
        <td>车标号：</td>
        <td>${user.flag_no!""}</td>
    </tr>
    <tr>
        <td>车型：</td>
        <td>${cType} -- ${carPz}</td>
    </tr>
    </tbody>
</table>
</p>
<hr>
<p>
    请不要回复该邮件，该邮件是沃沃车友会官方邮件。
</p>
</body>
</html>