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
    <script type="text/javascript">
        function login() {
            if ($('#username').val() == "" || $('#pwd').val().length < 6) {
                checkUser();
                return false;
            }
        }
    </script>
</head>
<style type="text/css">
    .content {
        padding: 0 auto;
        margin: 0 auto;
        height: 450px;
        width: 100%;
        background-size: 100% 450px;
        margin-top: 25px;
    }

    .login-wrap {
        position: absolute;
        width: 320px;
        height: 310px;
        border-radius: 10px;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        right: 37%;
        margin-top: 120px;
        background: gold;
        background-size: 100%;
    }

    .login-wrap h3 {
        color: #fff;
        font-size: 18px;
        text-align: center;
    }

    .name, .code {
        border: 1px solid #fff;
        width: 230px;
        height: 40px;
        margin-left: 38px;
        margin-bottom: 20px;
        padding-left: 40px;
    }
    .name {
        background-position-x: 12px;
    }
    .code {
        background-position-x: 12px;
    }
    .btn input {
        height: 40px;
        width: 120px;
        float: left;
        margin-right: 15px;
        border: none;
        color: #fff;
        font-size: 16px;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        margin-top: 10px;
        cursor: pointer;
    }

    input:active {
        border-color: #147a62
    }

    .submit {
        background: #ea8c37;
        margin-left: 25px;
    }

    .reset {
        background: #bbb;
    }

    /**错误信息提醒**/
    .msg {
        color: #ea8c37;
        font-size: 15px;
        padding-top: 10px;
        clear: both;
        font-weight: bold;
    }

</style>
<body background="${pageContext.request.contextPath}/img/loginBack.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%;
background-attachment: fixed;">
<div class="content">
    <div class="login-wrap">
        <h3>登 录</h3>
        <form id="myForm" method="post" action="/user/login" onsubmit="return login()">
            <input class="name" id="username" name="username" onblur="checkUser()" type="text" value="${username}"
                   placeholder="请输入账号" style="margin-right: 10px;">
            <input class="code" id="pwd" name="password" onblur="checkUser()" type="password" value=""
                   placeholder="请输入密码,长度不小于6位" style="margin-right: 10px" ;>
            <div class="btn" style="height: 30px;">
                <input type="submit" id="submit" class="submit" value="登录">
                <input type="reset" id="reset" class="reset" value="重置">
            </div>
        </form>
        <div style="padding-top: 30px;padding-left: 50px; width:320px;height: 20px;">
            <a href="${pageContext.request.contextPath}/user/register">注册账号</a>
            <a href="${pageContext.request.contextPath}/user/retrieve" style="padding-left: 62px;">忘记密码?</a>
        </div>
        <div id="CheckMsg" class="msg" style="text-align: center"><span id="error"
                                                                        style="color: firebrick">${error}</span></div>
    </div>
</div>

<script type="text/javascript">
    // 回车登录
    $("body").keydown(function () {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#submit').click();//换成按钮的id即可
        }
    });

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
