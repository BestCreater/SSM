<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2021/12/9
  Time: 20:51
  To change this template use FileOperation | Settings | FileOperation Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <head>
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/salary.css" type="text/css">
    </head>
<body style="margin: 0px">
<div class="right-down-middle">
    <div class="right-down-up">
        <div class="right-down-up-left">
            <a href="${pageContext.request.contextPath}/salary/deptSalary">
                <button type="button" class="btn btn-default">薪酬标准</button>
            </a>
        </div>
        <div class="right-down-up-right">
            <input id="userSearch" style="height: 35px;" type="text" value="${keywords}" placeholder="姓名/部门/员工编号">
            <button type="button" class="btn btn-primary btn-sm" id="search" onclick="searchSalary()">查询</button>
            <a href="${pageContext.request.contextPath}/salary/mainSalary">
                <button id="main" type="button" class="btn btn-primary btn-sm">返回</button>
            </a>
            <br><span id="check" style="color: red"></span>
        </div>
    </div>
    <table class="table table-hover">
        <h3 style="text-align: center">薪酬列表</h3>
        <thead>
        <tr>
            <th>序号</th>
            <th>员工编号</th>
            <th>姓名</th>
            <th>职级</th>
            <th>部门</th>
            <th>基本工资</th>
            <th>补贴</th>
            <th>奖金</th>
            <th>年薪</th>
        </tr>
        </thead>
        <tbody id="content">
        <c:forEach items="${salaryList}" var="salary" varStatus="status">
            <tr align="center">
                <td>${(page.nowPage-1)*10+status.index+1}</td>
                <td>${salary.staff_id}</td>
                <td>${salary.name}</td>
                <td>${salary.rank}</td>
                <td>${salary.department}</td>
                <td>￥${salary.salary}</td>
                <td>￥${salary.subsidy}</td>
                <td>￥${salary.bonus}</td>
                <td>￥${salary.annual}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="right-down-down">
        <div class="right-down-down-middle">
            <button type="button" class="btn btn-default btn-sm" onclick="paging(1)">首页</button>
            <button type="button" class="btn btn-default btn-sm" onclick="paging(2)">上一页</button>
            <button type="button" class="btn btn-default btn-sm" onclick="paging(3)">下一页</button>
            <button type="button" class="btn btn-default btn-sm" onclick="paging(4)">尾页</button>
            &nbsp;${page.nowPage}/${page.sumPage}
            共：${page.countRow}&nbsp;条记录
        </div>
    </div>
</div>
<script type="text/javascript">
    var u_page = parseInt("${page.nowPage}");
    var sumPage = parseInt("${page.sumPage}");
    var keywords = "";
    // 回车查询
    $("body").keydown(function () {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#search').click();//换成按钮的id即可
        }
    });

    function searchSalary() {//显示查询信息
        u_page = 1;//改变页面时初始默认显示第一页
        keywords = $('#userSearch').val();
        if (keywords == ""||keywords==null) {
            $('#check').html("请输入查询条件！");
        } else {
            window.location.href = "${pageContext.request.contextPath}/salary/pageSalary?u_page=" + u_page + "&keywords=" + keywords;
        }
    }

    function paging(b_value) {//翻页
        if ($('#userSearch').val()!=""){
            keywords = $('#userSearch').val();
        }
        if (b_value == 1) {
            u_page = 1;
        }if (b_value == 2 && u_page != 1) {
            u_page -= 1;
        }if (b_value == 3 && u_page < sumPage) {
            u_page += 1;
        }if (b_value == 4) {
            u_page = sumPage;
        }
        window.location.href = "${pageContext.request.contextPath}/salary/pageSalary?u_page=" + u_page + "&keywords=" + keywords;
    }
</script>
</body>
</html>