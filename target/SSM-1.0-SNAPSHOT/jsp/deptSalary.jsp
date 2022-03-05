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
</head>
<body style="padding: 0;margin: 0">
<div class="main">
    <div class="content">
        <ul class="nav nav-tabs" style="width: 19%;background: #C0C4CC;padding-left: 3.1%;">
            <li><a href="javascript:deptSalary(1)">管理部</a></li>
            <li><a href="javascript:deptSalary(2)">研发部</a></li>
            <li><a href="javascript:deptSalary(3)">实习部</a></li>
        </ul>
        <br><h4 style="padding-left: 5%">${dept.department}薪资标准</h4><br>
        <div id="manage" class="manage">
            <form class="form-inline">
                <label for="salary">基本工资:</label>
                <input type="text" class="form-control" id="salary" value="${dept.base_salary}">&nbsp元/级/月<br><br>
                <label for="subsidy">职级补贴:</label>
                <input type="text" class="form-control" id="subsidy" value="${dept.base_subsidy}">&nbsp元/级/月<br><br>
                <label for="bonus">职级奖金:</label>
                <input type="text" class="form-control" id="bonus" value="${dept.base_bonus}">&nbsp元/级/月<br><br>
                <label for="annual">年薪基数:</label>
                <input type="text" class="form-control" id="annual" value="${dept.base_annual}">&nbsp月/年<br><br>
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
<script type="text/javascript">
    var dept = "管理部";
    function deptSalary(department) {
        if (department==2){
            dept="研发部";
        }if (department==3){
            dept="实习部";
        }
        window.location.href='${pageContext.request.contextPath}/salary/deptSalary?department='+dept;
    }
    function reviseSalary() {
        var r = confirm("您确定要更新" + dept + "的薪资标准吗？更新后该部门所有员工的薪资金额将发生改变");
        if (r == true) {
            var salary={
                "department": dept,
                "base_salary":$('#salary').val() ,
                "base_subsidy": $('#subsidy').val(),
                "base_bonus": $('#bonus').val(),
                "base_annual": $('#annual').val()
            };
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/salary/updateDept",
                dataType: "text",
                contentType : 'application/json;charset=UTF-8',
                data:JSON.stringify(salary) ,
                success: function (data) {
                    alert(data);
                    $('#mainSalary').click();
                },
                error: function (error) {
                    alert(error);
                }
            });
        } else {
            return;
        }
    }
</script>
</body>
</html>
