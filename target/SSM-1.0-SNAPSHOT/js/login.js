// 回车登录
$("body").keydown(function () {
    if (event.keyCode == "13") {//keyCode=13是回车键
        $('#submit').click();//换成按钮的id即可
    }
});
function login() {
    if ($('#username').val() == "" || $('#pwd').val().length < 6) {
        checkUser();
        return false;
    }
}
//检查表单内容
function checkUser() {
    var username = document.getElementById("username").value
    var pwd = document.getElementById("pwd").value
    if (username == "" || username == null) {
        document.getElementById("error").innerText = "请输入账号！"
        return false;
    }
    if (pwd == "" || pwd.length < 6) {
        document.getElementById("error").innerText = "请输入不小于6位数的密码！"
        return false;
    } else {
        $('#error').html("");
        return true;
    }
}
