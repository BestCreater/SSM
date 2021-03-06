<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2021/11/30
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script type="text/javascript">
        var u_page = parseInt("${page.nowPage}");
        var sumPage = parseInt("${page.sumPage}");
        var keywords = null;

        function searchStaff() {//显示查询信息
            u_page = 1;//改变页面时初始默认显示第一页
            keywords = $('#userSearch').val();
            if (keywords == "") {
                $('#check').html("请输入查询条件！");
            } else {
                window.location.href="${pageContext.request.contextPath}/staff/pageStaff?u_page="+u_page+"&keywords="+keywords;
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
            window.location.href="${pageContext.request.contextPath}/staff/pageStaff?u_page="+u_page+"&keywords="+keywords;
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

    /*弹窗-------*/
    .modal {
        display: none; /* 默认隐藏 */
        /*生成绝对定位的元素，相对于浏览器窗口进行定位。*/
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        /*设置弹窗位置*/
        padding-top: 10%;
        /*padding-bottom: 300px;*/
        /*浮在全屏上*/
        width: 100%;
        height: 100%;
        /*overflow：auto；如果内容被修剪，则浏览器会显示滚动条，以便查看其余内容。*/
        overflow: auto;
        background-color: rgb(0, 0, 0);
        background-color: rgba(0, 0, 0, 0.4);
        text-align: center;
    }

    /* 弹窗内容 */
    .modal-content {
        /*position: relative;*/
        /*弹窗背景色设置*/
        background-color: #fefefe;
        margin: auto;
        padding: 200px auto;
        height: 320px;
        width: 400px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        -webkit-animation-name: animatetop;
        -webkit-animation-duration: 0.4s;
        animation-name: animatetop;
        animation-duration: 0.4s
    }

    /* 添加动画 */
    @-webkit-keyframes animatetop {
        from {
            top: -200px;
            opacity: 0
        }
        to {
            top: 0;
            opacity: 1
        }
    }

    @keyframes animatetop {
        from {
            top: -200px;
            opacity: 0
        }
        to {
            top: 0;
            opacity: 1
        }
    }

    /* 关闭按钮 */
    .close {
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover, .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    .modal-header {
        display: block;
        line-height: 30px;
        padding: 2px 10px;
        background: #03264A;
        color: white;
        text-align: left;
    }

    .modal-body {
        padding: 2px 16px;
        font-size: 18px;
        height: 210px;
        overflow: auto;
    }

    .modal-body-text {
        text-align: left;
        width: 345px;
        height: 80%;
    }

    .modal-footer {
        display: block;
        line-height: 30px;
        padding: 2px 10px;
        background: #03264A;
        color: black;
    }

    /*   ******************* 隐藏修改弹窗*/
    /*弹窗-------*/
    .modal-revise {
        display: none; /* 默认隐藏 */
        /*生成绝对定位的元素，相对于浏览器窗口进行定位。*/
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        /*设置弹窗位置*/
        padding-top: 10%;
        /*padding-bottom: 300px;*/
        /*浮在全屏上*/
        width: 100%;
        height: 100%;
        /*overflow：auto；如果内容被修剪，则浏览器会显示滚动条，以便查看其余内容。*/
        overflow: auto;
        background-color: rgb(0, 0, 0);
        background-color: rgba(0, 0, 0, 0.4);
        text-align: center;
    }

    /* 弹窗内容 */
    .modal-content-revise {
        /*position: relative;*/
        /*弹窗背景色设置*/
        background-color: #fefefe;
        margin: auto;
        padding: 200px auto;
        height: 310px;
        width: 400px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        -webkit-animation-name: animatetop;
        -webkit-animation-duration: 0.4s;
        animation-name: animatetop;
        animation-duration: 0.4s
    }

    /* 关闭按钮 */
    .close-revise {
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close-revise:hover, .close-revise:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    .modal-header-revise {
        display: block;
        line-height: 30px;
        padding: 2px 10px;
        background: #03264A;
        color: white;
        text-align: center;
    }

    .modal-body-revise {
        padding: 2px 16px;
        font-size: 18px;
        height: 210px;
    }

    .modal-body-text-revise {
        text-align: left;
        width: 345px;
        height: 80%;
    }

    .modal-footer-revise {
        display: block;
        line-height: 30px;
        padding: 2px 10px;
        background: #03264A;
        color: black;
    }
</style>
<body style="margin: 0px">
<div class="right-down-middle">
    <div class="right-down-up">
        <div class="right-down-up-left">
            <a href="javascript:openwindow()">
                <button type="button" class="btn btn-default">添加员工</button>
            </a>
        </div>
        <div class="right-down-up-right">
            <input id="userSearch" style="height: 35px;" type="text" value="${keywords}" placeholder="编号/姓名/部门">
            <button type="button" class="btn btn-primary btn-sm" id="search" onclick="searchStaff()">查询</button>
            <a href="${pageContext.request.contextPath}/staff/mainStaff">
                <button id="main" type="button" class="btn btn-primary btn-sm">返回</button>
            </a>
            <br><span id="check" style="color: red"></span>
        </div>
    </div>
    <table class="table table-hover">
        <caption>员工信息列表</caption>
        <thead>
        <tr>
            <th>员工编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>部门</th>
            <th>职级</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="content">
        <c:forEach items="${staffList}" var="staff">
            <tr align="center">
                <td>${staff.staffId}</td>
                <td>${staff.name}</td>
                <td>${staff.sex}</td>
                <td>${staff.department}</td>
                <td>${staff.rank}</td>
                <td>
                    <a href="javascript:deleteStaff(${staff.staffId})">删除</a>|
                    <a href="javascript:openrevise('${staff.staffId}','${staff.name}','${staff.sex}','${staff.department}','${staff.rank}')">修改</a>
                </td>
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
<%----------隐藏添加员工弹窗--------%>
<div id="myModal" class="modal">
    <!-- 弹窗内容 -->
    <div class="modal-content">
        <div class="modal-header">
            <span class="close">&times;</span>
            <h2>信息添加</h2>
        </div>
        <%--        隐藏弹窗--%>
        <div class="modal-body">
            <p>请填写新员工信息</p>
            <div class="modal-body-text">
                编号： <input type="text" id="id" name="id" placeholder="请输入4位数字编号"><br>
                姓名： <input type="text" id="name" name="name" placeholder="请输入姓名"><br>
                部门： <input type="radio" name="department" value="管理部"/>管理部
                <input type="radio" name="department" value="研发部"/>研发部
                <input type="radio" name="department" value="实习部"/>实习部<br>
                职级： <input type="text" id="rank" name="rank" placeholder="请输入1-14之间的整数级别"><br>
                性别： <select id="sex" name="sex">
                <option value="男"/>
                男
                <option value="女"/>
                女</select> <br>
                <span id="error" style="color: red"></span>
            </div>
        </div>
        <div class="modal-footer">
            <button class="ok" id="ok" onclick="addCheck()">确定</button>&nbsp;<button class="no">取消</button>
        </div>
    </div>
</div>
<%---------隐藏修改员工弹窗---------%>
<div id="myModal-revise" class="modal-revise">
    <!-- 弹窗内容 -->
    <div class="modal-content-revise">
        <div class="modal-header-revise">
            <span class="close-revise">&times;</span>
            <h2>信息修改</h2>
        </div>
        <%--        隐藏弹窗--%>
        <div class="modal-body-revise">
            <br>
            <div class="modal-body-text-revise">
                编号： <input type="text" id="id-revise" name="id" onfocus=this.blur()><span style="font-size: 0.8rem">(不可编辑)</span><br>
                姓名： <input type="text" id="name-revise" name="name" placeholder="请输入姓名"><br>
                部门： <input type="radio" name="department-revise" value="管理部"/>管理部
                <input type="radio" name="department-revise" value="研发部"/>研发部
                <input type="radio" name="department-revise" value="实习部"/>实习部<br>
                职级： <input type="text" id="rank-revise" name="rank" placeholder="请输入1-14之间的整数级别"><br>
                性别： <select id="sex-revise" name="sex">
                <option value="男"/>
                男
                <option value="女"/>
                女</select> <br>
                <span id="error-revise" style="color: red"></span>
            </div>
        </div>
        <div class="modal-footer-revise">
            <button class="ok-revise" id="ok-revise" onclick="reviseCheck()">确定</button>&nbsp;<button class="no-revise">
            取消
        </button>
        </div>
    </div>
</div>
<script type="text/javascript">
    // 回车查询
    $("body").keydown(function () {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#search').click();//换成按钮的id即可
        }
    });

    //***********修改员工***********
    function reviseCheck() {//=======修改弹窗======
        //执行弹出窗体得确定后得操作
        var u_name = document.getElementById("name-revise").value;
        var u_sex = document.getElementById("sex-revise").value;
        var u_dept = "";
        var de = document.getElementsByName("department-revise");
        var u_rank = document.getElementById("rank-revise").value;
        for (var i = 0; i < de.length; i++) {
            if (de[i].checked && u_dept != de[i].value) {
                u_dept = de[i].value;
            }
        }
        if (u_name == "") {
            $('#error-revise').html("请输入姓名！");
            return;
        }
        if (u_dept == "") {
            $('#error-revise').html("请选择部门！");
            return;
        }
        if (u_rank == "" || !isNumber(u_rank) || u_rank >= 15) {
            $('#error-revise').html("请输入有效等级！");
            return;
        } else {
            var r = confirm("您确定要修改员工" + $('#id-revise').val() + "的信息吗？");
            if (r == true) {
                var staff={
                    "staffId": $('#id-revise').val(),
                    "name": u_name,
                    "sex": u_sex,
                    "department": u_dept,
                    "rank": u_rank
                };
                var staffData=JSON.stringify(staff);
                $.ajax({
                    type: "POST",
                    dataType: "text",
                    data:staffData ,
                    contentType : 'application/json;charset=UTF-8',
                    url: "${pageContext.request.contextPath}/staff/updateStaff",
                    success: function (data) {
                        alert(data);
                        $('#main').click();
                    },
                    error: function (error) {
                        alert(error);
                    }
                });
            } else {
                return;
            }
        }
    }

    //***********************隐藏修改弹窗*************
    function openrevise(id, name, sex, department, rank) {
        //*****保留初始属性*******
        $('#error-revise').html("");
        $('#id-revise').val(id);
        $('#name-revise').val(name);
        $(':radio[value=' + department + ']').prop('checked', true);
        $('#sex-revise').val(sex);
        $('#rank-revise').val(rank);
        //获取弹窗得div
        var modal_revise = document.getElementById('myModal-revise');
        // 获取 <span> 元素，用于关闭弹窗 （X）
        var span_revise = document.getElementsByClassName("close-revise")[0];
        //获取弹窗中得确定按钮
        //获取弹窗中得取消按钮
        var no_revise = document.getElementsByClassName("no-revise")[0];
        //窗体弹出
        modal_revise.style.display = "block";
        //点击窗体ok
        //点击窗体取消按钮
        no_revise.onclick = function () {
            //直接关闭窗口
            modal_revise.style.display = "none";
        }
        // 点击 <span> (x), 关闭弹窗
        span_revise.onclick = function () {
            //直接关闭窗口
            modal_revise.style.display = "none";
        }
        // 在用户点击其他地方时，关闭弹窗
        window.onclick = function (event) {
            //点击窗口外内容，关闭窗口
            if (event.target == modal_revise) modal_revise.style.display = "none";
        }
    }

    //*********************删除员工***********************
    function deleteStaff(id) {
        var r = confirm("您确定要删除编号为" + id + "的员工吗？");
        if (r == true) {
            $.post({
                url: "${pageContext.request.contextPath}/staff/deleteStaff",
                data: {"staffId": id},
                dataType: "text",
                success: function (data) {
                    alert(data);
                    $('#main').click();
                },
                error: function (error) {
                    alert(error);
                }
            });
        } else {
            return;
        }
    }

    //*************************添加员工*****************************
    function addCheck() {
        //执行弹出窗体得确定后得操作
        var u_id = document.getElementById("id").value;
        var u_name = document.getElementById("name").value;
        var u_sex = document.getElementById("sex").value;
        var u_dept = "";
        var de = document.getElementsByName("department");
        var u_rank = document.getElementById("rank").value;
        for (var i = 0; i < de.length; i++) {
            if (de[i].checked && u_dept != de[i].value) {
                u_dept = de[i].value;
            }
        }
        if (u_id.length != 4 || !isNumber(u_id)) {
            $('#error').html("编号必须为4位整数！");
            return;
        }
        if (u_name == "") {
            $('#error').html("请输入姓名！");
            return;
        }
        if (u_dept == "") {
            $('#error').html("请选择部门！");
            return;
        }
        if (u_rank == "" || !isNumber(u_rank) || u_rank >= 15) {
            $('#error').html("请输入有效等级！");
            return;
        } else {
            $.ajax({
                type: "POST",
                dataType: "text",
                data: {
                    "staffId": u_id,
                    "name": u_name,
                    "sex": u_sex,
                    "department": u_dept,
                    "rank": u_rank},
                url: "${pageContext.request.contextPath}/staff/addStaff",
                success: function (data) {
                    alert(data);
                    $('#main').click();
                },
                error: function (error) {
                    alert(error);
                }
            });
        }
    }

    //******************验证是否为数字*****************
    function isNumber(value) {
        var patrn = /^(-)?\d+(\.\d+)?$/;
        if (patrn.exec(value) == null || value == "") {
            return false
        } else {
            return true
        }
    }

    //******************添加员工弹窗*****************
    function openwindow() {
        $('#error').html("");
        //获取弹窗得div
        var modal = document.getElementById('myModal');
        // 获取 <span> 元素，用于关闭弹窗 （X）
        var span = document.getElementsByClassName("close")[0];
        //获取弹窗中得确定按钮
        //获取弹窗中得取消按钮
        var no = document.getElementsByClassName("no")[0];
        //窗体弹出
        modal.style.display = "block";
        //点击窗体ok
        //点击窗体取消按钮
        no.onclick = function () {
            //直接关闭窗口
            modal.style.display = "none";
        }
        // 点击 <span> (x), 关闭弹窗
        span.onclick = function () {
            //直接关闭窗口
            modal.style.display = "none";
        }
        // 在用户点击其他地方时，关闭弹窗
        window.onclick = function (event) {
            //点击窗口外内容，关闭窗口
            if (event.target == modal) modal.style.display = "none";
        }
    }
</script>
</body>
</html>
