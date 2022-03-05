<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2021/11/12
  Time: 8:02
  To change this template use FileOperation | Settings | FileOperation Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" type="text/css">
</head>
<body background="${pageContext.request.contextPath}/img/loginBack.jpg">
<div class="content">
    <div class="login-wrap">
        <h3>登 录</h3>
        <form id="myForm" method="post" action="${pageContext.request.contextPath}/user/login" onsubmit="return login()">
            <input class="name" id="username" name="username" onblur="checkUser()" type="text" value="${username}"
                   placeholder="请输入账号" style="margin-right: 10px;">
            <input class="code" id="pwd" name="password" onblur="checkUser()" type="password" value=""
                   placeholder="请输入密码,长度不小于6位" style="margin-right: 10px" ;>
            <div class="btn" style="height: 30px;">
                <input type="submit" id="submit" class="submit" value="登录">
                <input type="reset" id="reset" class="reset" value="重置">
            </div>
        </form>
        <div class="login-wrap-down">
            <a href="${pageContext.request.contextPath}/user/register">注册账号</a>
            <a href="${pageContext.request.contextPath}/user/retrieve" style="padding-left: 62px;">忘记密码?</a>
        </div>
        <div id="CheckMsg" class="msg" style="text-align: center"><span id="error" style="color: firebrick">${error}</span></div>
    </div>
</div>
<script type="text/javascript">
    // 回车登录
    $("body").keydown(function () {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#submit').click();//换成按钮的id即可
        }
    });
    function login() {
        if ($('#username').val() == "" || $('#pwd').val().length < 6) {
            checkUser();
            return false;
        }
    }
    //检查表单内容
    function checkUser() {
        var username = document.getElementById("username").value
        var pwd = document.getElementById("pwd").value
        if (username == "" || username == null) {
            document.getElementById("error").innerText = "请输入账号！"
            return false;
        }
        if (pwd == "" || pwd.length < 6) {
            document.getElementById("error").innerText = "请输入不小于6位数的密码！"
            return false;
        } else {
            $('#error').html("");
            return true;
        }
    }

</script>
</body>
</html>
