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
</head>
<style>
    .main {
        width: 100%;
        height: 100%;
        background: #EBEEF5;
    }

    .content {
        width: 100%;
        height: 70%;
        padding-left: 10%;
        padding-top: 10%;
    }

    .content ul {
        padding-left: 3%;
    }
    .last {
        height: 15%;
        padding-left: 10%;
    }
</style>
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
<script>
    var dept = "管理部";
    function dept(department) {
      if (department==2){
          dept="研发部";
      }if (department==3){
            dept="实习部";
        }
        window.location.href='${pageContext.request.contextPath}/salary/deptSalary?department='+dept;
    }
    function reviseSalary() {
        var r = confirm("您确定要更新" + department + "的薪资标准吗？更新后该部门所有员工的薪资金额将发生改变");
        if (r == true) {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/salary/updateDept",
                dataType: "text",
                data: {
                    "department": department,
                    "salary":$('#salary').val() ,
                    "subsidy": $('#subsidy').val(),
                    "bonus": $('#bonus').val(),
                    "annual": $('#annual').val()
                },
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
