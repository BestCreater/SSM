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
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <script>
        $(function () {
            m();//载入页面时加载管理部;
        });
    </script>
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

    .manage {
        display: none;
    }

    .code {
        display: none;
    }

    .intern {
        display: none;
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
            <li><a href="javascript:m()">管理部</a></li>
            <li><a href="javascript:c()">研发部</a></li>
            <li><a href="javascript:er()">实习部</a></li>
        </ul>
        <br><br><br>
        <div id="manage" class="manage">
            <form class="form-inline">
                <label for="m_salary">基本工资:</label>
                <input type="text" class="form-control" id="m_salary" value="${manage.baseSalary}">元/级/月<br><br>
                <label for="m_subsidy">职级补贴:</label>
                <input type="text" class="form-control" id="m_subsidy" value="${manage.baseSubsidy}">元/级/月<br><br>
                <label for="m_bonus">职级奖金:</label>
                <input type="text" class="form-control" id="m_bonus" value="${manage.baseBonus}">元/级/月<br><br>
                <label for="m_annual">年薪基数:</label>
                <input type="text" class="form-control" id="m_annual" value="${manage.baseAnnual}">元/级/月<br><br>
            </form>
        </div>
        <div id="code" class="code">
            <form class="form-inline">
                <label for="c_salary">基本工资:</label>
                <input type="text" class="form-control" id="c_salary" value="${code.baseSalary}">元/级/月<br><br>
                <label for="c_subsidy">职级补贴:</label>
                <input type="text" class="form-control" id="c_subsidy" value="${code.baseSubsidy}">元/级/月<br><br>
                <label for="c_bonus">职级奖金:</label>
                <input type="text" class="form-control" id="c_bonus" value="${code.baseBonus}">元/级/月<br><br>
                <label for="c_annual">年薪基数:</label>
                <input type="text" class="form-control" id="c_annual" value="${code.baseAnnual}">月/年<br><br>
            </form>
        </div>
        <div id="intern" class="intern">
            <form class="form-inline">
                <label for="i_salary">基本工资:</label>
                <input type="text" class="form-control" id="i_salary" value="${intern.baseSalary}">元/级/月<br><br>
                <label for="i_subsidy">职级补贴:</label>
                <input type="text" class="form-control" id="i_subsidy" value="${intern.baseSubsidy}">元/级/月<br><br>
                <label for="i_bonus">职级奖金:</label>
                <input type="text" class="form-control" id="i_bonus" value="${intern.baseBonus}">元/级/月<br><br>
                <label for="i_annual">年薪基数:</label>
                <input type="text" class="form-control" id="i_annual" value="${intern.baseAnnual}">月/年<br><br>
            </form>
        </div>
        <div class="last">
            <a href="javascript:reviseSalary()">
                <button class="btn btn-primary btn-sm">更新</button>
            </a>
            <a href="${pageContext.request.contextPath}/SalaryServlet?method=mainSalary">
                <button id="mainSalary" class="btn btn-primary btn-sm">返回</button>
            </a>
        </div>
    </div>
</div>
<script>
    var ma = document.getElementById('manage');
    var co = document.getElementById('code');
    var rn = document.getElementById('intern');

    function m() {
        ma.style.display = "block";
        co.style.display = "none";
        rn.style.display = "none";
    }

    function c() {
        ma.style.display = "none";
        co.style.display = "block";
        rn.style.display = "none";
    }

    function er() {
        ma.style.display = "none";
        co.style.display = "none";
        rn.style.display = "block";
    }

    function reviseSalary() {
        var dept = "";
        var salary = "";
        var subsidy = "";
        var bonus = "";
        var annual = "";
        if (ma.style.display == "block") {
            dept = "管理部";
            salary = $('#m_salary').val();
            subsidy = $('#m_subsidy').val();
            bonus = $('#m_bonus').val();
            annual = $('#m_annual').val();
        }
        if (co.style.display == "block") {
            dept = "研发部";
            salary = $('#c_salary').val();
            subsidy = $('#c_subsidy').val();
            bonus = $('#c_bonus').val();
            annual = $('#c_annual').val();
        }
        if (rn.style.display == "block") {
            dept = "实习部";
            salary = $('#i_salary').val();
            subsidy = $('#i_subsidy').val();
            bonus = $('#i_bonus').val();
            annual = $('#i_annual').val();
        }
        var r = confirm("您确定要更新" + dept + "的薪资标准吗？更新后该部门所有员工的薪资金额将发生改变");
        if (r == true) {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/SalaryServlet?method=updateDeptSalary",
                dataType: "text",
                data: {"dept": dept, "salary": salary, "subsidy": subsidy, "bonus": bonus, "annual": annual},
                success: function (data) {
                    alert(data);
                    $('#mainSalary').click();
                },
                error: function (error) {
                    console.log(error);
                    alert("服务器繁忙");
                }
            });
        } else {
            return;
        }
    }
</script>
</body>
</html>
