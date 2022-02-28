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
<style>
    .container {
        margin: 0 auto;
        width: 500px;
    }

    form {
        width: 450px;
        margin: 0 auto;
        background: #F2F6FC;
        border-radius: 15px;
        position: relative;
    }

    h1 {
        font-size: 28px;
        text-align: center;
        color: black;
    }

    .w {
        color: red;
        margin-left: 50px;
        display: inline-block;
    / / 不占单独一行的块级元素
    }

    .p {
        color: red;
        margin-left: 33px;
        display: inline-block;
    / / 不占单独一行的块级元素
    }

    label {
        font-size: 18px;
        font-weight: bold;
    }

    .register {
        height: 35px;
        width: 300px;
    }

    .q {
        color: red;
        margin-left: 17px;
        display: inline-block;
    }

    .submit {
        border-radius: 7px;
        margin-left: 150px;
        height: 35px;
        width: 120px;
        background-color: #000;
        border: none;
        display: block;
        padding: 0;
        color: #FFF;
        font-weight: bold;
        cursor: pointer;
    }

    a {
        text-decoration: none;
        font-weight: bold;
    }

    .msg {
        height: 1%;
        text-align: center;
    }

    .checkPwd {
        font-size: 1.6rem;
        color: green;
    }
</style>
<head>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="margin: 0px;background:#EBEEF5;">
<div class="container">
    <h1>密码修改</h1>
    <br>
    <form id="myForm" method="post" onsubmit="return check()"
          action="${pageContext.request.contextPath}/user/revisePwd">
        <br>
        <span class="p">*</span>
        <label for="username">用户名</label>
        <input type="text" name="username" id="username" placeholder="" class="register" value="${sessionScope.user.username}"
               style="width: 50%" readonly>
        <br><br>
        <span class="p">*</span>
        <label for="pwd">原密码</label>
        <input type="password" id="pwd" class="register" onblur="checkPwd()" style="width: 50%">
        <span class="checkPwd" id="checkPwd"></span><br><br>
        <span class="p">*</span>
        <label for="newpwd">新密码</label>
        <input type="password" name="password" id="newpwd" class="register" style="width: 50%"><br><br>
        <span class="q">*</span>
        <label for="repwd">确认密码</label>
        <input type="password" id="repwd" class="register" style="width: 50%"><br><br>
        <div class="msg">
            <span id="attention" style="color: crimson;font-size: 1.8rem;"></span>
        </div>
        <br><br>
        <input type="submit" name="" value="提交" class="submit"><br>
    </form>
</div>
<script type="text/javascript">
    var checkPassword = document.getElementById('checkPwd')

    function checkPwd() {
        var user={
            'username': $('#username').val(),
            'password': $('#pwd').val()
        }
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/user/checkPwd",
            contentType:'application/json;charset=UTF-8',
            dataType: "text",
            data:JSON.stringify(user),
            success: function (data) {
                if (data == "操作成功") {
                    checkPassword.style.color = "green";
                    $('#checkPwd').html("正确");
                    checkPassword.value = 'true';
                } else {
                    checkPassword.style.color = "crimson";
                    $('#checkPwd').html("请检查密码!");
                    checkPassword.value = null;
                }
            }

        });
    }

    function check() {
        var pwd = document.getElementById("pwd").value;
        var newpwd = document.getElementById("newpwd").value;
        var repwd = document.getElementById("repwd").value;
        if (checkPassword.value == null) {
            return false;
        }
        if (newpwd.length < 6) {
            attention.innerHTML = "密码不能小于6位数！";
            return false;
        }
        if (pwd == newpwd) {
            attention.innerHTML = "新密码不能和原密码一致！";
            return false;
        }
        if (repwd == "" || repwd == null) {
            attention.innerHTML = "请确认密码!";
            return false;
        }
        if (repwd != newpwd) {
            attention.innerHTML = "两次输入的密码不一致！!";
            return false;
        } else {
            var r = confirm("您确定要修改密码吗？");
            if (r == true) {
                alert("修改成功!请您重新登录");
                parent.exit();
                return true;
            } else {
                return false;
            }
        }
    }
</script>
</body>
</html>
