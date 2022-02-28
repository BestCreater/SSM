<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2021/11/26
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>主页面</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            if ('${sessionScope.user.role_id}' == 0 || '${sessionScope.user.role_id}' == 1) {
                $('.user').addClass("show");
            } else {
                $('.user').addClass("none");
            }
        })

        function pageChange(value, href) {
            $("#kiu").find("li:eq(1)").remove();
            $("#kiu").append("<li><a href='" + href + "' target='content' style='color: #0F0F10'>" + value + "</a></li>");
        }

        function exit() {
            window.location.href = "${pageContext.request.contextPath}/user/logout";
        }

        function logoff() {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/re",
                dataType: "text",
                success: function (data) {
                    var r = confirm("您自注册以来,已经与我们共同度过了" + data + "天,真的要狠心离开吗？");
                    if (r == true) {
                        var attention = confirm("账号注销后,所有信息将丢失且无法还原,您是否确认要注销？");
                        if (attention == true) {
                            $.ajax({
                                type: "POST",
                                url: "${pageContext.request.contextPath}/UserServlet?method=delete",
                                dataType: "text",
                                success: function (data) {
                                    alert(data);
                                    window.location.href = "login.jsp";
                                }
                            });
                        }
                    }
                }
            });
        }
    </script>
</head>
<style>
    .none {
        display: none;
    }

    .show {
        display: block
    }

    .container {
        width: 100%;
        height: 100%;
        background: chartreuse;
        padding: 0px;

    }

    .left {
        width: 12%;
        height: 100%;
        float: left;
        padding: 0px;
    }

    .left-up {
        width: 100%;
        height: 12%;
        background: #4E92E7;
        /*background: #6D88A4;*/
        float: left;
        margin: 0px;
        padding: 0px;
    }

    .left-up img {
        padding-top: 15%;
        padding-left: 10%;
        width: 92%;
    }

    .left-down {
        width: 100%;
        height: 88%;
        background: #202121;
        float: left;
    }

    .left-down ul li a {
        padding-left: 25%;
        font-size: 2rem;
        color: #fefefe;
    }

    .right {
        width: 88%;
        height: 100%;
        float: right;
        padding: 0px;
    }

    .right-up {
        width: 100%;
        height: 12%;
        background: #4E92E7;
    }

    .right-up-up {
        width: 100%;
        height: 70%;
        background: #4E92E7;
    }

    .right-up-right {
        width: 20%;
        height: 100%;
        float: right;
        padding-right: 30px;
        padding-top: 2%;
    }

    .right-up-right img {
        width: 58%;
        height: 73%;
        padding-left: 47%;
        padding-top: 0.6%;
    }

    .right-up-right a {
        text-decoration: none;
        color: black;
        font-size: 1.6rem;
    }

    .right-up-right li {
        list-style: none;
        position: relative;
        float: right;
        text-align: center;
        border-radius: 4px;
        border: 1px solid black;
        line-height: 26px;
        width: 42%;
        height: 76%;
        background: white;
    }

    .right-up-right ul {
        position: absolute;
        display: none;
        padding: 0px;
        margin: 0px;
    }

    .right-up-right li:hover > .abc {
        display: block;
    }

    .right-up-right ul li {
        float: right;
        width: 100%;
        height: 13%;
        background-color: white;
        font-size: 1.6rem;
    }

    .abc li:hover > a {
        background-color: gainsboro;
    }

    .right-up-down {
        width: 100%;
        height: 30%;
        background: #4E92E7;
    }

    .right-up-down-left img {
        width: 2.1%;
        height: 100%;
        /*padding-bottom: 0.1%;*/
    }

    .right-up-down-right img {
        width: 5%;
        height: 75%;
        margin-right: 20%;
        margin-top: 1%;
    }

    .right-down {
        width: 100%;
        height: 88%;
        background: #E4E7ED;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        border-radius: 2px;
        border: 1px solid #6e6767;

    }

    .right-down-middle {
        width: 100%;
        height: 95%;
        background: #EBEEF5;
    }

    .right-down-middle table {
        float: left;
        width: 75%;
        margin-left: 130px;
        margin-top: 20px;
        border: 1px solid;
        text-align: center;
        font-size: 1.5rem;
        letter-spacing: 0.5rem;
        border: 2px solid black;
    }

    .right-down-middle td, th {
        border: 1px solid #6e6767;
        text-align: center;
    }

    .right-down-last {
        width: 100%;
        height: 5%;
        background: #DCDFE6;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        border-radius: 4px
    }

    .last {
        width: 100%;
        height: 100%;
    }

    .last span {
        padding-left: 31%;
        padding-top: 0.4%;
        font-size: 1.3rem;
        color: black;
    }

</style>
<body style="margin: 0px">
<div class="container">
    <div class="left">
        <div class="left-up">
            <a href="${pageContext.request.contextPath}/user/index"><img
                    src="${pageContext.request.contextPath}/img/logo1.jpg"></a>
        </div>
        <div class="left-down">
            <ul class="nav nav-pills nav-stacked">
                <li onclick="pageChange('员工管理','${pageContext.request.contextPath}/staff/mainStaff')"><a
                        href="${pageContext.request.contextPath}/staff/mainStaff"
                        target="content">员工管理</a></li>
                <li onclick="pageChange('薪酬管理','${pageContext.request.contextPath}/SalaryServlet?method=mainSalary')"><a
                        href="${pageContext.request.contextPath}/SalaryServlet?method=mainSalary"
                        target="content">薪酬管理</a></li>
                <li class="user" style="display: none"
                    onclick="pageChange('用户管理','${pageContext.request.contextPath}/user/mainUser')"><a
                        href="${pageContext.request.contextPath}/user/mainUser"
                        target="content">用户管理</a></li>
                <li onclick="pageChange('登录日志','${pageContext.request.contextPath}/log/mainLog')"><a
                        href="${pageContext.request.contextPath}/log/mainLog" target="content">登录日志</a>
                </li>
                <li onclick="pageChange('通知管理','${pageContext.request.contextPath}/NoticeServlet?method=mainNotice')"><a
                        href="${pageContext.request.contextPath}/NoticeServlet?method=mainNotice"
                        target="content">通知管理</a></li>
                <li onclick="pageChange('文件管理','${pageContext.request.contextPath}/FileServlet?method=mainFile')"><a
                        href="${pageContext.request.contextPath}/FileServlet?method=mainFile" target="content">文件管理</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="right">
        <div class="right-up">
            <div class="right-up-up">
                <div class="right-up-right">
                    <img src="${pageContext.request.contextPath}/img/user.jpg">
                    <li>${user.username}
                        <ul class="abc">
                            <li><a href="${pageContext.request.contextPath}/user/logout">退出登录</a></li>
                            <li onclick="pageChange('修改密码','${pageContext.request.contextPath}/user/revisePwd')"><a
                                    href="${pageContext.request.contextPath}/user/revisePwd"
                                    target="content">修改密码</a></li>
                            <li><a href="javascript:logoff()">注销账号</a></li>
                        </ul>
                    </li>
                </div>
            </div>

            <div class="right-up-down">
                <div class="right-up-down-left" style="height: 100%;width: 70%;float: left;">
                    <ul style="height: 100%;font-size: 1.5rem;background: #4E92E7" id="kiu" class="breadcrumb">
                        <a href="${pageContext.request.contextPath}/backstage.jsp"><img
                                src="${pageContext.request.contextPath}/img/homepage.png"></a>
                        <li><a href="${pageContext.request.contextPath}/backstage.jsp" style="color:#0F0F10;">首页</a>
                        </li>
                    </ul>
                </div>
                <div class="right-up-down-right" style="height: 100%;width: 30%;float: left">
                    <a href="#"><img
                            src="${pageContext.request.contextPath}/img/refresh.png" style="float: right"></a>
                </div>

            </div>
        </div>
        <div class="right-down">
            <div class="right-down-middle">
                <iframe name="content" src="${pageContext.request.contextPath}/public/main.jsp" width="100%" height="100%" frameborder="0" ></iframe>
            </div>
            <div class="right-down-last">
                <div class="last">
                    <span>Copyright2021©  苏格拉没有底  版权所有  请升级IE至最新版本，或使用Chrome、FireFox等浏览器</span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
