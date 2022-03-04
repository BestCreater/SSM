var u_page = parseInt("${page.nowPage}");
var sumPage = parseInt("${page.sumPage}");
var keywords = "";
// 回车查询
$("body").keydown(function () {
    if (event.keyCode == "13") {//keyCode=13是回车键
        $('#search').click();//换成按钮的id即可
    }
});

$(function () {
    if ('${sessionScope.user.role_id}' == 0 || '${sessionScope.user.role_id}' == 1) {
        $('.remove').addClass("show");
    } else {
        $('.remove').addClass("none");
    }
});


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