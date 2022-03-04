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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/backstage.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/backstage.js"></script>
</head>
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
                <li onclick="pageChange('薪酬管理','${pageContext.request.contextPath}/salary/mainSalary')"><a
                        href="${pageContext.request.contextPath}/salary/mainSalary"
                        target="content">薪酬管理</a></li>
                <li class="user" style="display: none"
                    onclick="pageChange('用户管理','${pageContext.request.contextPath}/user/mainUser')"><a
                        href="${pageContext.request.contextPath}/user/mainUser"
                        target="content">用户管理</a></li>
                <li onclick="pageChange('登录日志','${pageContext.request.contextPath}/log/mainLog')"><a
                        href="${pageContext.request.contextPath}/log/mainLog" target="content">登录日志</a>
                </li>
                <li onclick="pageChange('通知管理','${pageContext.request.contextPath}/notice/mainNotice')"><a
                        href="${pageContext.request.contextPath}/notice/mainNotice"
                        target="content">通知管理</a></li>
                <li onclick="pageChange('文件管理','${pageContext.request.contextPath}/file/mainFile')"><a
                        href="${pageContext.request.contextPath}/file/mainFile" target="content">文件管理</a>
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
