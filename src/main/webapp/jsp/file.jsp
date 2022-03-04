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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/file.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/file.js"></script>
<head>
    <title>通知管理</title>
</head>
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
</body>
</html>
