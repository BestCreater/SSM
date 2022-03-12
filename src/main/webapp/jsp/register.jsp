<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2021/12/2
  Time: 12:45
  To change this template use FileOperation | Settings | FileOperation Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.3.1/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css" type="text/css">
</head>
<body background="${pageContext.request.contextPath}/img/back_01.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%;
background-attachment: fixed;margin: 0px">
<div class="container">
    <form id="myForm" action="${pageContext.request.contextPath}/user/registerUser" method="post">
        <br>
        <h1>新用户注册</h1>
        <br>
        <span class="p">*</span>
        <label for="username">用户名</label>
        <input type="text" name="username" id="username" placeholder="" class="register" style="width: 50%"
               onblur="checkUsername()" value="${user.username}">&nbsp;
        <span class="checkUser" id="checkUser"></span><br><br>
        <span class="q">*</span>
        <label for="pwd">登录密码</label>
        <input type="password" name="password" id="pwd" class="register" style="width: 50%" value="${user.password}"><br><br>
        <span class="q">*</span>
        <label for="repwd">确认密码</label>
        <input type="password" name="" id="repwd" class="register" style="width: 50%" value="${user.password}"><br><br>
        <span class="w">*</span>
        <label for="email">邮箱</label>
        <input type="text" name="email" id="email" class="register" style="width: 50%" value="${user.email}">&nbsp;<button
            class="btn btn-default" id="sent" type="button"></button>
        <br><br>
        <span class="p">*</span>
        <label for="code">验证码</label>
        <input type="text" id="code" class="register" name="code" style="width: 50%"><br><br>
        <div class="msg">
            <span id="attention" style="color: crimson;font-size: 1.8rem;">${error1}</span>
        </div>
        <br><br>
        <input type="button" onclick="check()" value="注册" class="submit"><br>
        <a href="${pageContext.request.contextPath}/user/login" class="left">返回登录</a>
    </form>
</div>
<script type="text/javascript">
    var checkUser = document.getElementById("checkUser");
    var waitTime = 60;
    var sent = document.getElementById("sent");
    sent.innerHTML = "发送验证";
    var attention = document.getElementById("attention")
    document.getElementById("sent").onclick = function () {
        time(this);
    }
    function checkUsername() {
        if ($('#username').val() == "") {
            checkUser.style.color = "crimson";
            checkUser.innerHTML = "请输入用户名！";
            return;
        } else {
            $.ajax({
                type: "POST",
                data:{"username": $('#username').val()},
                url: "${pageContext.request.contextPath}/user/checkUsername",
                dataType: "text",
                success: function (data) {
                    if (data == "已存在") {
                        checkUser.style.color = "crimson";
                        checkUser.value = null;
                        $('#checkUser').html('已存在!');
                    } else {
                        checkUser.style.color = "green";
                        checkUser.value = 'true';
                        $('#checkUser').html('可用');
                    }
                }, error() {
                    alert("服务器繁忙！");
                }
            });
        }
    }

    function checkEmail() {
        var reg = RegExp(/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/);
        var email = $("#email").val();
        if (email == null || email == "") {
            attention.innerHTML = "请输入您的邮箱！";
            return false;
        }
        if (reg.test(email)==false){
            attention.innerHTML = "邮箱格式错误！";
            return false;
        }else {
            return true;
        }
    }
    function time(ele) {
        if (checkEmail()){
            if (waitTime == 0) {
                ele.disabled = false;
                ele.innerHTML = "发送验证";
                waitTime = 60;
            } else {
                ele.disabled = true;
                ele.innerHTML = "发送(" + waitTime + ")";
                waitTime--;
                setTimeout(function () {
                    time(ele)// 关键处-定时循环调用
                }, 1000)
            }
        }
    }
    $('#sent').click(function () {
        if (checkEmail()){
            attention.innerHTML="";
            $.ajax({
                type: "POST",
                data: {"email":$('#email').val()},
                url:"${pageContext.request.contextPath}/user/checkEmail",
                dataType: "text",
                success:function (data) {
                    if (data=="可用"){
                        sendCode();
                        attention.value='true';
                    }else {
                        attention.value='false';
                        attention.innerHTML="邮箱已被注册！";
                        waitTime=0;
                    }
                }
            });
        }
    });
    function sendCode() {
        $.ajax({
            type: "POST",
            data: {"email":$('#email').val()},
            url:"${pageContext.request.contextPath}/user/sendEmail",
            dataType: "text",
            success:function (data) {
                if (data=="服务器繁忙"){
                    alert(data);
                }
                return;
            },error(error) {
                console.log(error);
            }
        });
    }

    function check() {
        var username = document.getElementById("username").value;
        var pwd = document.getElementById("pwd").value;
        var repwd = document.getElementById("repwd").value;
        var email = document.getElementById("email").value;
        var code = document.getElementById("code").value;
        var checkUser = document.getElementById("checkUser").value;
        if (username == "" || username == null) {
            attention.innerHTML = "用户名不能为空!";
            return;
        }if (checkUser == null) {
            attention.innerHTML = "请输入有效用户名!";
            return;
        }if (pwd == null || pwd.length < 6) {
            attention.innerHTML = "密码不能小于6位数！"
            return;
        }if (repwd == "" || repwd == null) {
            attention.innerHTML = "请确认密码!";
            return;
        }if (repwd != pwd) {
            attention.innerHTML = "两次输入的密码不一致！!";
            return;
        }
        if (email == "" || email == null) {
            attention.innerHTML = "邮箱不能为空!";
            return;
        }
        if (code == "" || code == null) {
            attention.innerHTML = "验证码不能为空!";
            return;
        }if (attention.value==null||attention.value=='false'){
            attention.innerHTML = "请输入有效的邮箱!";
            return;
        }
        else {
            $.ajax({
                type: "POST",
                data: {"code":$('#code').val()},
                url:"${pageContext.request.contextPath}/user/code",
                dataType: "text",
                success:function (data) {
                    if (data=="true"){
                        $('#myForm').submit();
                    }else {
                        attention.innerHTML="验证码有误";
                        return;
                    }
                },error(error) {
                    console.log(error);
                }
            });
        }
    }
</script>
</body>
</html>
