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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/logLogin.css" type="text/css">
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

    function searchManager() {//显示查询信息
      u_page = 1;//改变页面时初始默认显示第一页
      keywords = $('#userSearch').val();
      if (keywords == "") {
        $('#check').html("请输入查询条件！");
      } else {
        window.location.href = "${pageContext.request.contextPath}/log/pageLog?u_page=" + u_page + "&keywords=" + keywords;
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
      window.location.href = "${pageContext.request.contextPath}/log/pageLog?u_page=" + u_page + "&keywords=" + keywords;
    }
  </script>
</head>
<body style="margin: 0px">
<div class="right-down-middle">
  <div class="right-down-up">
    <div class="right-down-up-right">
      <input id="userSearch" style="height: 35px;" type="text" value="${keywords}" placeholder="用户名/登录地址">
      <button type="button" class="btn btn-primary btn-sm" id="search" onclick="searchManager()">查询</button>
      <a href="${pageContext.request.contextPath}/log/mainLog">
        <button id="main" type="button" class="btn btn-primary btn-sm">返回</button>
      </a>
      <br><span id="check" style="color: red"></span>
    </div>
  </div>
  <table class="table table-hover">
    <h3 style="text-align: center">登录日志</h3>
    <thead>
    <tr>
      <th>序号</th>
      <th>用户名</th>
      <th>会话ID</th>
      <th>登陆时间</th>
      <th>浏览器</th>
      <th>登录IP</th>
      <th>登录地址</th>
    </tr>
    </thead>
    <tbody id="content">
    <c:forEach items="${logList}" var="log" varStatus="status">
      <tr align="center">
        <td>${(page.nowPage-1)*10+status.index+1}</td>
        <td>${log.username}</td>
        <td>${log.session_id}</td>
        <td>${log.login_time}</td>
        <td>${log.browser_type}</td>
        <td>${log.ip_address}</td>
        <td>${log.login_address}</td>
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
<script type="text/javascript">
  // 回车查询
  $("body").keydown(function () {
    if (event.keyCode == "13") {//keyCode=13是回车键
      $('#search').click();//换成按钮的id即可
    }
  });
</script>
</body>
</html>