<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2021/12/12
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script type="text/javascript">
    $(function () {
        if ('${sessionScope.user.role_id}' == 0 || '${sessionScope.user.role_id}' == 1) {
            $('.remove').addClass("show");
        } else {
            $('.remove').addClass("none");
        }
    });
    var u_page = parseInt("${page.nowPage}");
    var sumPage = parseInt("${page.sumPage}");
    var keywords = "";

    function searchFile() {//显示查询信息
        u_page = 1;//改变页面时初始默认显示第一页
        keywords = $('#userSearch').val();
        if (keywords == "") {
            $('#check').html("请输入查询条件！");
        } else {
            window.location.href = "${pageContext.request.contextPath}/file/pageFile?u_page=" + u_page + "&keywords=" + keywords;
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
        window.location.href = "${pageContext.request.contextPath}/file/pageFile?u_page=" + u_page + "&keywords=" + keywords;
    }
</script>
<head>
    <title>通知管理</title>
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

    .none {
        display: none;
    }

    .show {
        display: block
    }
</style>
<body>
<div class="right-down-middle">
    <div class="right-down-up">
        <div class="right-down-up-left">
            <a href="${pageContext.request.contextPath}/file/uploadFile">
                <button id="uploadFile" type="button" class="btn btn-default">上传文件</button>
            </a>
        </div>
        <div class="right-down-up-right">
            <input id="userSearch" style="height: 35px;" type="text" value="${keywords}" placeholder="上传者/文件名/文件描述">
            <button type="button" class="btn btn-primary btn-sm" id="search" onclick="searchFile()">查询</button>
            <a href="${pageContext.request.contextPath}/file/mainFile">
                <button id="main" type="button" class="btn btn-primary btn-sm">返回</button>
            </a>
            <br><span id="check" style="color: red"></span>
        </div>
    </div>
    <table class="table table-striped">
        <h2 style="text-align: center">文件列表</h2>
        <thead>
        <tr>
            <th>序号</th>
            <th>文件名</th>
            <th>操作</th>
            <th></th>
            <th>上传时间</th>
            <th>上传者</th>
            <th>文件描述</th>
            <th>下载次数</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${fileList}" var="file" varStatus="status">
            <tr>
                <td>${(page.nowPage-1)*10+status.index+1}</td>
                <td>${file.file_name}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/file/download?file_id=${file.file_id}">下载</a>
                </td>
                <td>
                    <a class="remove" href="javascript:removeFile('${file.file_id}','${file.file_name}')">删除</a>
                </td>
                <td>${file.upload_time}</td>
                <td>${file.username}</td>
                <td>${file.file_description}</td>
                <td>${file.download_amount}</td>
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
            &nbsp;${page.nowPage}/${sessionScope.page.sumPage}
            共：${page.countRow}&nbsp;条记录
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

    function removeFile(id,name) {
        var r = confirm("您确定要删除文件“" + name + "”吗？");
        if (r == true) {
            var file={"file_id": id,
                "file_name": name
            };
            $.post({
                url: "${pageContext.request.contextPath}/file/removeFile",
                data:JSON.stringify(file) ,
                dataType: "text",
                contentType : 'application/json;charset=UTF-8',
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
</script>
</body>
</html>
