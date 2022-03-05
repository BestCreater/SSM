<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2021/12/6
  Time: 23:12
  To change this template use FileOperation | Settings | FileOperation Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notice.css" type="text/css">
<script type="text/javascript">
    $(function () {
        if ('${sessionScope.user.role_id}' == 0 || '${sessionScope.user.role_id}' == 1) {
            $('.remove').addClass("show");
        }else {
            $('.remove').addClass("none");
        }
    });
    var u_page = parseInt("${page.nowPage}");
    var sumPage = parseInt("${page.sumPage}");
    var keywords = "";
    function searchNotice() {//显示查询信息
        u_page = 1;//改变页面时初始默认显示第一页
        keywords = $('#userSearch').val();
        if (keywords == "") {
            $('#check').html("请输入查询条件！");
        } else {
            window.location.href = "${pageContext.request.contextPath}/notice/pageNotice?u_page=" + u_page + "&keywords=" + keywords;
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
        window.location.href = "${pageContext.request.contextPath}/notice/pageNotice?u_page=" + u_page + "&keywords=" + keywords;
    }
</script>
<head>
    <title>通知管理</title>
</head>
<body>
<div class="right-down-middle">
    <div class="right-down-up">
        <div class="right-down-up-left">
            <a href="${pageContext.request.contextPath}/notice/addNotice">
                <button type="button" class="btn btn-default">发布通知</button>
            </a>
        </div>
        <div class="right-down-up-right">
            <input id="userSearch" style="height: 35px;" type="text" value="${keywords}" placeholder="通知标题/发布人">
            <button type="button" class="btn btn-primary btn-sm" id="search" onclick="searchNotice()">查询</button>
            <a href="${pageContext.request.contextPath}/notice/mainNotice">
                <button id="main" type="button" class="btn btn-primary btn-sm">返回</button>
            </a>
            <br><span id="check" style="color: red"></span>
        </div>
    </div>
    <table class="table table-striped">
        <h2 style="text-align: center">通知列表</h2>
        <thead>
        <tr>
            <th>序号</th>
            <th>通知标题</th>
            <th>发布时间</th>
            <th>发布人</th>
            <th>操作</th>
            <th></th>
            <th>开始时间</th>
            <th>结束时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${noticeList}" var="notice" varStatus="status">
            <tr>
                <td>${(page.nowPage-1)*10+status.index+1}</td>
                <td>${notice.title}</td>
                <td>${notice.publish_time}</td>
                <td>${notice.username}</td>
                <td>
                    <a href="javascript:opennotice('${notice.title}','${notice.publish_time}',
            '${notice.begin_time}','${notice.end_time}','${notice.content}')">查看</a>
                </td>
                <td>
                    <a class="remove" href="javascript:removeNotice('${notice.id}','${notice.title}')">删除</a>
                </td>
                <td>${notice.begin_time}</td>
                <td>${notice.end_time}</td>
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
<!-- 隐藏查看弹窗内容 -->
<div id="myModal-notice" class="modal-notice">
    <!-- 弹窗内容 -->
    <div class="modal-content-notice">
        <div class="modal-header-notice">
            <span class="close-notice">&times;</span>
            <h2 id="title"></h2>
            <div class="modal-header_down-notice">
                发布日期：<span id="publish"></span>起止日期：<span id="begin_end"></span>
            </div>
        </div>
        <%--        隐藏弹窗--%>
        <div class="modal-body-notice">
            <br><span rows="20" cols="60" id="content"></span>
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

    function opennotice(title, publish, begin, end, content) {
        $('#title').html(title);
        $('#publish').html(publish);
        $('#begin_end').html(begin + "/" + end);
        $('#content').html(content)
        //获取弹窗得div
        var modal_notice = document.getElementById('myModal-notice');
        // 获取 <span> 元素，用于关闭弹窗 （X）
        var span_notice = document.getElementsByClassName("close-notice")[0];
        //获取弹窗中得确定按钮
        //获取弹窗中得取消按钮
        //窗体弹出
        modal_notice.style.display = "block";
        //点击窗体ok
        //点击窗体取消按钮
        // 点击 <span> (x), 关闭弹窗
        span_notice.onclick = function () {
            //直接关闭窗口
            modal_notice.style.display = "none";
        }
        // 在用户点击其他地方时，关闭弹窗
        window.onclick = function (event) {
            //点击窗口外内容，关闭窗口
            if (event.target == modal_notice) modal_notice.style.display = "none";
        }
    }

    function removeNotice(id, title) {
        var r = confirm("您确定要删除通知“" + title + "”吗？");
        if (r == true) {
            $.post({
                url: "${pageContext.request.contextPath}/notice/deleteNotice",
                data: {"id": id},
                dataType: "text",
                success: function (data) {
                    alert(data);
                    $('#main').click();
                },
                error: function () {
                    alert("服务器繁忙，请稍后重试");
                }
            });
        } else {
            return;
        }
    }
</script>
</body>
</html>
