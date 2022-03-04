<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2021/11/30
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
</head>
<style>
    .myForm {
        height: 25%;
        width: 30%;
        margin-left: 42%;
        margin-top: 15%;
    }
</style>
<body style="margin: 0px;background:  #EBEEF5;">
<form method="post" class="myForm" action="${pageContext.request.contextPath}/file/upload"
      onsubmit="return fileCheck()" name="fileupload" enctype="multipart/form-data">
    <label for="description">描述：</label>
    <input type="text" id="description" class="form-control" name="fileDescription" placeholder="请为上传文件添加描述"
           style="width: 50%;"></br>
    <label for="file">文件： </label>
    <input type="file" id="file" name="file"></br><br>
    <button style="margin-left: 13%" class="btn btn-primary btn-sm" type="submit">提交</button>
    <a href="${pageContext.request.contextPath}/file/mainFile">
        <button id="exit" class="btn btn-primary btn-sm" type="button">返回</button>
    </a>
    <br><span id="message" style="color: firebrick;margin-left: 11%"></span>
</form>
<script type="text/javascript">
    function fileCheck() {
        var fileInput = $('#file').get(0).files[0];
        var description=$('#description').val();
        if (description.toString().trim().length<=0){
            $('#message').html("描述内容不能为空！");
            return false;
        } else if(fileInput){
            var r=confirm("您确认要上传该文件吗？");
            if (r==true) {
                alert("上传成功！");
                return true;
            }else {
                return false;
            }
        } else{
            $('#message').html("请添加要上传的文件！");
            return false ;
        }
    }
</script>
</body>
</html>