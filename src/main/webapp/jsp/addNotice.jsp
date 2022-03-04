<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2021/12/6
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/addNotice.js"></script>

<head>
    <title>发布通知</title>
</head>
<body>
<title>发布通知</title>
<div class="container">
    标<p class="p"></p>题:<input type="text" id="title" style="width: 45%"><br>
    开始时间:<select id="selYear" name="beginTime"></select>年
    <select id="selMonth"></select>月
    <select id="selDay"></select>日<br>
    结束时间:<select id="selYear_end" name="endTime"></select>年
    <select id="selMonth_end"></select>月
    <select id="selDay_end"></select>日<br>
    公告内容:<textarea rows="20" cols="60" id="content" style="resize: none"></textarea><br>
    <div class="down">
        <button type="button" class="btn btn-primary btn-sm" onclick="test()">发布</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="clearIn()">清空</button>
        <a href="${pageContext.request.contextPath}/notice/mainNotice" style="float: right">
            <button id="return" type="button" class="btn btn-primary btn-sm">返回</button>
        </a>
    </div>
</div>
</body>
</html>
