$(function () {
    if ('${sessionScope.user.role_id}' == 0 || '${sessionScope.user.role_id}' == 1) {
        $('.user').addClass("show");
    } else {
        $('.user').addClass("none");
    }
})
function pageChange(value, href) {
    $("#kiu").find("li:eq(1)").remove();
    $("#kiu").append("<li><a href='" + href + "' target='content' style='color: #0F0F10'>" + value + "</a></li>");
}

function exit() {
    window.location.href = "${pageContext.request.contextPath}/user/logout";
}

function logoff() {
    $.ajax({
        type: "POST",
        data:{"register_time":'${sessionScope.user.register_time}'},
        url: "${pageContext.request.contextPath}/user/attention",
        dataType: "text",
        success: function (data) {
            var r = confirm("您自注册以来,已经与我们共同度过了" + data + "天,真的要狠心离开吗？");
            if (r == true) {
                var attention = confirm("账号注销后,所有信息将丢失且无法还原,您是否确认要注销？");
                if (attention == true) {
                    $.ajax({
                        type: "POST",
                        data:{"user_id":'${sessionScope.user.user_id}'},
                        url: "${pageContext.request.contextPath}/user/cancel",
                        dataType: "text",
                        success: function (data) {
                            alert(data);
                            exit();
                        }
                    });
                }
            }
        }
    });
}