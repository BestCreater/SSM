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
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>

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
            } else {
                $('.delete').addClass("none");
                $('.operation').addClass("none");
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
<style>
    .right-down-up {
        width: 100%;
        height: 8%;
        background: #EBEEF5;
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

    /*弹窗-------*/
    .modal-user {
        display: none; /* 默认隐藏 */
        /*生成绝对定位的元素，相对于浏览器窗口进行定位。*/
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        /*设置弹窗位置*/
        padding-top: 8%;
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
    .modal-content-user {
        /*position: relative;*/
        /*弹窗背景色设置*/
        background-color: #fefefe;
        margin: auto;
        padding: 200px auto;
        height: 320px;
        width: 420px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        -webkit-animation-name: animatetop;
        -webkit-animation-duration: 0.4s;
        animation-name: animatetop;
        animation-duration: 0.4s;
        overflow: auto;
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
    .close-user {
        color: #03264A;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close-user:hover, .close-notice:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    .modal-header-user {
        display: block;
        line-height: 30px;
        padding: 2px 10px;
        background: #fefefe;
        color: cornflowerblue;
        text-align: center;
        border-bottom: 2px solid cornflowerblue;
    }

    .modal-body-user {
        padding: 2px 40px;
        font-size: 18px;
        height: 210px;
        text-align: left;
    }

    .modal-body-user span {
        font-size: 1.2rem;
    }

    .modal-footer-user {
        display: block;
        line-height: 30px;
        padding: 2px 10px;
        background: #DCDFE6;
        color: black;
    }

    .none {
        display: none;
    }

    .show {
        display: block
    }
    /*switch开关*/
    .switch {
        width: 50px;
        height: 20px;
        position: relative;
        border: 1px solid #dfdfdf;
        background-color: #fdfdfd;
        box-shadow: #dfdfdf 0 0 0 0 inset;
        border-radius: 20px;
        background-clip: content-box;
        display: inline-block;
        -webkit-appearance: none;
        user-select: none;
        outline: none;
    }
    .switch:before {
        content: '';
        width: 18px;
        height: 18px;
        position: absolute;
        top: 0;
        left: 0;
        border-radius: 20px;
        background-color: #fff;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.4);
    }
    .switch:checked {
        border-color: #64bd63;
        box-shadow: #64bd63 0 0 0 16px inset;
        background-color: #64bd63;
    }
    .switch:checked:before {
        left: 30px;
    }
    .switch.switch-anim {
        transition: border cubic-bezier(0, 0, 0, 1) 0.4s, box-shadow cubic-bezier(0, 0, 0, 1) 0.4s;
    }
    .switch.switch-anim:before {
        transition: left 0.3s;
    }
    .switch.switch-anim:checked {
        box-shadow: #64bd63 0 0 0 16px inset;
        background-color: #64bd63;
        transition: border ease 0.4s, box-shadow ease 0.4s, background-color ease 1.2s;
    }
    .switch.switch-anim:checked:before {
        transition: left 0.3s;
    }

</style>
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
            <th class="operation">操作</th>
        </tr>
        </thead>
        <tbody id="content">
        <c:forEach items="${userList}" var="user" varStatus="status">
            <tr align="center">
                <td>${status.index+1}</td>
                <td>${user.username}</td>
                <td>${user.role_name}</td>
                <c:if test="${user.status=='on'}">
                    <td><input id="${user.status}${user.user_id}" class="switch switch-anim" type="checkbox" onclick="updateUser('${user.user_id}','${user.username}','${user.role_name}','${user.status}')" checked></td>
                </c:if>
                <c:if test="${user.status=='off'}">
                    <td><input id="${user.status}${user.user_id}" class="switch switch-anim" type="checkbox" onclick="updateUser('${user.user_id}','${user.username}','${user.role_name}','${user.status}')" ></td>
                </c:if>
                <td>${user.register_time}</td>
                <td class="delete">
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
    function updateUser(id,username,role,status){
        document.getElementById(status+id);
        var switchAnim = document.querySelector("#"+status+id);
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
                $.ajax({
                    type: "POST",
                    data: {"user_id": id, "role_id": role_id},
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