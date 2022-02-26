<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2021/11/27
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
    .container {
        width: 100%;
        height: 100%;
    }

    .middle {
        width: 60%;
        height: 45%;
        padding-left: 40%;
        padding-top: 13%;
        float: left;
        text-align: center;
        font-size: 3.2rem;
    }

    .middle img {
        width: 52%;
        height: 73%;
    }

    .accordion span {
        font-size: 2.4rem;
        color: #27292C;
    }
</style>
<body>
<div class="container">
    <div class="middle">
        <img src="${pageContext.request.contextPath}/img/success.jpg"><br>
        <span style="padding-left:6% ">${user.username},注册成功！</span><br>
        <a href="${pageContext.request.contextPath}/login.jsp">
            <button type="button" class="btn btn-default btn-lg" style="padding-right: 20%;width: 36%">立即登录</button>
        </a>
        <div class="accordion">
            <span id="message" style="height: 5%;text-align: center"></span><br>
        </div>
    </div>
</div>
<script type="text/javascript">
    var time = 9; //时间,秒
    function Redirect() {
        window.location.href = "login.jsp";
    }

    var i = 0;

    function dis() {
        document.getElementById("message").innerText = (time - i) + "秒后跳转到登录界面";
        i++;
    }

    timer = setInterval('dis()', 1000); //显示时间
    timer = setTimeout('Redirect()', time * 1000); //跳转
</script>
</body>
</html>
