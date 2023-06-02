<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2021/12/5
  Time: 19:40
  To change this template use FileOperation | Settings | FileOperation Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员界面</title>
</head>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.3.1/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css" type="text/css">


    <script type="text/javascript">
        var u_page = parseInt("${page.nowPage}");
        var sumPage = parseInt("${page.sumPage}");
        var keywords = null;

        // 回车查询
        $("body").keydown(function () {
            if (event.keyCode == "13") {//keyCode=13是回车键
                $('#search').click();//换成按钮的id即可
            }
        });
        $(function () {//动态加载页面
            if ('${sessionScope.user.role_id}' == 0) {
                $('.delete').addClass("show");
                $('.operation').addClass("show");
            }
        });


        function searchManager() {//显示查询信息
            u_page = 1;//改变页面时初始默认显示第一页
            keywords = $('#userSearch').val();
            if (keywords == "") {
                $('#check').html("请输入查询条件！");
            } else {
                window.location.href = "${pageContext.request.contextPath}/user/pageUser?u_page=" + u_page + "&keywords=" + keywords;
            }
        }

        function paging(value) {//翻页
            keywords = $('#userSearch').val();
            if (value == 1) {
                u_page = 1;
            }
            if (value == 2 && u_page != 1) {
                u_page -= 1;
            }
            if (value == 3 && u_page < sumPage) {
                u_page += 1;
            }
            if (value == 4) {
                u_page = sumPage;
            }
            window.location.href = "${pageContext.request.contextPath}/user/pageUser?u_page=" + u_page + "&keywords=" + keywords;
        }
    </script>
</head>
<body style="margin: 0px">
<div class="right-down-middle">
    <div class="right-down-up">
        <div class="right-down-up-right">
            <input id="userSearch" style="height: 35px;" type="text" value="${keywords}" placeholder="用户名/用户类型">
            <button type="button" class="btn btn-primary btn-sm" id="search" onclick="searchManager()">查询</button>
            <a href="${pageContext.request.contextPath}/user/mainUser">
                <button id="main" type="button" class="btn btn-primary btn-sm">返回</button>
            </a>
            <br><span id="check" style="color: red"></span>
        </div>
    </div>
    <table class="table table-hover">
        <h3 style="text-align: center">管理员信息</h3>
        <thead>
        <tr>
            <th>序号</th>
            <th>用户名</th>
            <th>用户类型</th>
            <th>账号状态</th>
            <th>注册时间</th>
            <th>在线状态</th>
            <th class="operation" style="display: none;">操作</th>
        </tr>
        </thead>
        <tbody id="content">
        <c:forEach items="${userList}" var="user" varStatus="status">
            <tr align="center">
                <td>${(page.nowPage-1)*10+status.index+1}</td>
                <td>${user.username}</td>
                <td>${user.role_name}</td>
                <c:if test="${user.status=='on'}">
                    <td><input id="${user.status}${user.user_id}" class="switch switch-anim" type="checkbox" onclick="updateUser('${user.user_id}','${user.username}','${user.role_name}','${user.status}')" checked></td>
                </c:if>
                <c:if test="${user.status=='off'}">
                    <td><input id="${user.status}${user.user_id}" class="switch switch-anim" type="checkbox" onclick="updateUser('${user.user_id}','${user.username}','${user.role_name}','${user.status}')" ></td>
                </c:if>
                <td>${user.register_time}</td>
                <c:if test="${user.online_status=='在线'}">
                    <td style="color: #64bd63">${user.online_status}</td>
                </c:if>
                <c:if test="${user.online_status=='离线'}">
                    <td>${user.online_status}</td>
                </c:if>
                <td class="delete" style="display: none;">
                    <a href="javascript:openUser('${user.user_id}','${user.username}','${user.role_name}')">权限</a>
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
<!-- 隐藏弹窗内容 -->
<div id="myModal-user" class="modal-user">
    <!-- 弹窗内容 -->
    <div class="modal-content-user">
        <div class="modal-header-user">
            <span class="close-user">&times;</span>
            <h2>权限管理</h2>
        </div>
        <%--        隐藏弹窗--%>
        <div class="modal-body-user">
            <br>
            用户ID：<label id="user_id" readonly></label><br>
            用户名：<label id="username" readonly></label><br>
            用户类别:<input type="radio" name="user-type" value="普通管理员"/>普通管理员
            <input type="radio" name="user-type" value="临时管理员"/>临时管理员<br><br>
            <span id="attention">说明：</span><br>
            <span>临时管理员(基本功能)</span><br>
            <span>普通管理员(增加文件删除、通知下架及用户查看功能)</span><br>
        </div>
        <div class="modal-footer-user">
            <button class="ok-user" id="ok-user">确定</button>&nbsp;<button class="no-user">取消</button>
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
    function updateUser(id,username,role,status){
        var switchAnim = document.querySelector("#"+status+id);
        if('${sessionScope.user.role_id}'!=0){
            alert('没有操作权限！');
            if (switchAnim.checked==true){switchAnim.checked=false;}
            else {switchAnim.checked=true};            r
            return;
        }
        if(role=="超级管理员"){
            alert("不能禁用超级管理员！");
            switchAnim.checked=true;
            return;
        }else {
            if (status == "on") {
                var r = confirm("确认要禁用用户" + username + "吗？");
            }else {
                var r=confirm("确认要启用用户"+username+"吗？");
            }
            if (r==true){
                $.ajax({
                    type: "POST",
                    data: {"user_id": id, "status": status},
                    url: "${pageContext.request.contextPath}/user/updateUser",
                    dataType: "text",
                    success: function (data) {
                        alert(data);
                        if (switchAnim.checked==true){switchAnim.checked=true;}
                        else {switchAnim.checked=false};
                    },error(){
                        alert("服务器繁忙");
                    }
                });
            }else {
                if (switchAnim.checked==true){switchAnim.checked=false;}
                else {switchAnim.checked=true};
                return;
            }
        }
    }
    function openUser(id, username, role) {
        if (role == '超级管理员') {
            alert('该用户为超级管理员，暂时不可操作！');
            return;
        }
        $('#user_id').html(id);
        $('#username').html(username);
        $(':radio[value=' + role + ']').prop('checked', true);
        //获取弹窗得div
        var modal_user = document.getElementById('myModal-user');
        // 获取 <span> 元素，用于关闭弹窗 （X）
        var span_user = document.getElementsByClassName("close-user")[0];
        /*点击确认按钮*/
        $('#ok-user').click(function () {
            var role_name = $('input[name="user-type"]:checked').val();
            var role_id = "";
            if (role_name == "普通管理员") {
                role_id = 1;
            } else if (role_name == "临时管理员") {
                role_id = 2;
            }
            if (role == role_name) {
                alert("该用户当前已是" + role_name + "!");
                return;
            } else {
                var user={
                    "user_id": id,
                    "role_id": role_id
                };
                $.ajax({
                    type: "POST",
                    data: JSON.stringify(user),
                    contentType : 'application/json;charset=UTF-8',
                    url: "${pageContext.request.contextPath}/user/updateRole",
                    dataType: "text",
                    success: function (data) {
                        alert(data);
                        $('#main').click();
                    }
                });
            }
        });
        //获取弹窗中得确定按钮
        //获取弹窗中得取消按钮
        //窗体弹出
        modal_user.style.display = "block";
        //点击窗体ok
        //点击窗体取消按钮
        var no_user = document.getElementsByClassName("no-user")[0];
        //窗体弹出
        modal_user.style.display = "block";
        //点击窗体ok
        //点击窗体取消按钮
        no_user.onclick = function () {
            //直接关闭窗口
            modal_user.style.display = "none";
        }
        // 点击 <span> (x), 关闭弹窗
        span_user.onclick = function () {
            //直接关闭窗口
            modal_user.style.display = "none";
        }
        // 在用户点击其他地方时，关闭弹窗
        window.onclick = function (event) {
            //点击窗口外内容，关闭窗口
            if (event.target == modal_user) modal_user.style.display = "none";
        }
    }
</script>
</body>
</html>