<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2022/2/26
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>

</head>
<body>
<a href="javascript:getVerifiCode()">
    <img id="yzm_img" style="cursor:pointer;width: 100px;height: 36px;margin: 5px 0 0 5px;border-radius: 3px;" title="点击刷新验证码" src="/user/getVerifiCode"/>
</a>
</body>
<script type="text/javascript">
    function getVerifiCode() {
        $("#yzm_img").prop('src','/user/getVerifiCode?a='+new Date().getTime());
    }
</script>
</html>
