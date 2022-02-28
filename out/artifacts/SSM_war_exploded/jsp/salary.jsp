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
        <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
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
                if (keywords == "") {
                    $('#check').html("请输入查询条件！");
                } else {
                    window.location.href = "${pageContext.request.contextPath}/SalaryServlet?method=pageSalary&u_page=" + u_page + "&keywords=" + keywords;
                }
            }

            function paging(b_value) {//翻页
                keywords = $('#userSearch').val();
                if (b_value == 1) {
                    u_page = 1;
                }
                if (b_value == 2 && u_page != 1) {
                    u_page -= 1;
                }
                if (b_value == 3 && u_page < sumPage) {
                    u_page += 1;
                }
                if (b_value == 4) {
                    u_page = sumPage;
                }
                window.location.href = "${pageContext.request.contextPath}/SalaryServlet?method=pageSalary&u_page=" + u_page + "&keywords=" + keywords;
            }
        </script>
    </head>
    <style>
        .right-down-up {
            width: 100%;
            height: 8%;
            background: #EBEEF5;
        }

        .right-down-up-left {
            width: 30%;
            height: 100%;
            padding-top: 0.5%;
            padding-left: 11%;
            background: #EBEEF5;
            float: left;
        }

        .right-down-up-right {
            width: 70%;
            height: 100%;
            padding-top: 0.5%;
            padding-left: 8%;
            float: right;
        }

        .right-down-middle {
            width: 100%;
            height: 95%;
            background: #EBEEF5;
        }

        .right-down-middle table {
            float: left;
            width: 80%;
            margin-left: 130px;
            margin-top: 15px;
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

        .right-down-down {
            width: 100%;
            height: 6%;
            background: #E4E7ED;
            float: right;
            position: absolute;
            bottom: 0%;
        }

        .right-down-down-middle {
            padding-left: 40%;
            padding-top: 0.2%;
        }
    </style>
<body style="margin: 0px">
<div class="right-down-middle">
    <div class="right-down-up">
        <div class="right-down-up-left">
            <a href="${pageContext.request.contextPath}/SalaryServlet?method=deptSalary">
                <button type="button" class="btn btn-default">薪酬标准</button>
            </a>
        </div>
        <div class="right-down-up-right">
            <input id="userSearch" style="height: 35px;" type="text" value="${keywords}" placeholder="姓名/部门">
            <button type="button" class="btn btn-primary btn-sm" id="search" onclick="searchSalary()">查询</button>
            <a href="${pageContext.request.contextPath}/SalaryServlet?method=mainSalary">
                <button id="main" type="button" class="btn btn-primary btn-sm">返回</button>
            </a>
            <br><span id="check" style="color: red"></span>
        </div>
    </div>
    <table class="table table-hover">
        <h3 style="text-align: center">薪酬列表</h3>
        <thead>
        <tr>
            <th>薪资编号</th>
            <th>员工姓名</th>
            <th>职级</th>
            <th>部门</th>
            <th>基本工资</th>
            <th>补贴</th>
            <th>奖金</th>
            <th>年薪</th>
        </tr>
        </thead>
        <tbody id="content">
        <c:forEach items="${salaryList}" var="salary">
            <tr align="center">
                <td>${salary.payrollId}</td>
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
            &nbsp;${sessionScope.page.nowPage}/${sessionScope.page.sumPage}
            共：${sessionScope.page.countRow}&nbsp;条记录
        </div>
    </div>
</div>
<%--隐藏弹窗--%>
</body>
</html>