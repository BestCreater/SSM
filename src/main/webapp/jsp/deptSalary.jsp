<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2021/12/9
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/deptSalary.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/deptSalary.js"></script>
</head>
<body style="padding: 0;margin: 0">
<div class="main">
    <div class="content">
        <ul class="nav nav-tabs" style="width: 24%;background: #C0C4CC">
            <li><a href="javascript:dept(1)">管理部</a></li>
            <li><a href="javascript:dept(2)">研发部</a></li>
            <li><a href="javascript:dept(3)">实习部</a></li>
        </ul>
        <br><br><br>
        <div id="manage" class="manage">
            <form class="form-inline">
                <label for="salary">基本工资:</label>
                <input type="text" class="form-control" id="salary" value="${dept.base_salary}">元/级/月<br><br>
                <label for="subsidy">职级补贴:</label>
                <input type="text" class="form-control" id="subsidy" value="${dept.base_subsidy}">元/级/月<br><br>
                <label for="bonus">职级奖金:</label>
                <input type="text" class="form-control" id="bonus" value="${dept.base_bonus}">元/级/月<br><br>
                <label for="annual">年薪基数:</label>
                <input type="text" class="form-control" id="annual" value="${dept.base_annual}">月/年<br><br>
            </form>
        </div>
        <div class="last">
            <a href="javascript:reviseSalary()">
                <button class="btn btn-primary btn-sm">更新</button>
            </a>
            <a href="${pageContext.request.contextPath}/salary/mainSalary">
                <button id="mainSalary" class="btn btn-primary btn-sm">返回</button>
            </a>
        </div>
    </div>
</div>
</body>
</html>
