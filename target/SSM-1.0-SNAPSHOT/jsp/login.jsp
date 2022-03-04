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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
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
</body>
</html>
