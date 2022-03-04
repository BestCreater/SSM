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
<style>
    .container {
        background: #EBEEF5;
        width: 100%;
        height: 100%;
        padding-left: 33%;
        padding-top: 3%;
        font-size: 1.5rem;
    }

    .p {
        margin-left: 28px;
        display: inline-block;
    / / 不占单独一行的块级元素
    }

    .down {
        height: 8%;
        width: 65%;
        text-align: center;
    }
</style>
<head>
    <title>日期下拉菜单</title>
    <script type="text/javascript">
        function DateSelector(selYear, selMonth, selDay) {
            this.selYear = selYear;
            this.selMonth = selMonth;
            this.selDay = selDay;
            this.selYear.Group = this;
            this.selMonth.Group = this;
            // 给年份、月份下拉菜单添加处理onchange事件的函数
            if (window.document.all != null) // IE
            {
                this.selYear.attachEvent("onchange", DateSelector.Onchange);
                this.selMonth.attachEvent("onchange", DateSelector.Onchange);
            } else // Firefox
            {
                this.selYear.addEventListener("change", DateSelector.Onchange, false);
                this.selMonth.addEventListener("change", DateSelector.Onchange, false);
            }
            if (arguments.length == 4) // 如果传入参数个数为4，最后一个参数必须为Date对象
                this.InitSelector(arguments[3].getFullYear(), arguments[3].getMonth() + 1, arguments[3].getDate());
            else if (arguments.length == 6) // 如果传入参数个数为6，最后三个参数必须为初始的年月日数值
                this.InitSelector(arguments[3], arguments[4], arguments[5]);
            else // 默认使用当前日期
            {
                var dt = new Date();
                this.InitSelector(dt.getFullYear(), dt.getMonth() + 1, dt.getDate());
            }
        }

        // 增加一个最小年份的属性
        DateSelector.prototype.MinYear = 2018;
        // 增加一个最大年份的属性
        DateSelector.prototype.MaxYear = ((new Date()).getFullYear() + 15);
        // 初始化年份
        DateSelector.prototype.InitYearSelect = function () {
            // 循环添加OPION元素到年份select对象中
            for (var i = this.MaxYear; i >= this.MinYear; i--) {
                // 新建一个OPTION对象
                var op = window.document.createElement("OPTION");

                // 设置OPTION对象的值
                op.value = i;

                // 设置OPTION对象的内容
                op.innerHTML = i;

                // 添加到年份select对象
                this.selYear.appendChild(op);
            }
        };
        // 初始化月份
        DateSelector.prototype.InitMonthSelect = function () {
            // 循环添加OPION元素到月份select对象中
            for (var i = 1; i < 13; i++) {
                // 新建一个OPTION对象
                var op = window.document.createElement("OPTION");
                // 设置OPTION对象的值
                op.value = i;
                // 设置OPTION对象的内容
                op.innerHTML = i;
                // 添加到月份select对象
                this.selMonth.appendChild(op);
            }
        };
        // 根据年份与月份获取当月的天数
        DateSelector.DaysInMonth = function (year, month) {
            var date = new Date(year, month, 0);
            return date.getDate();
        };
        // 初始化天数
        DateSelector.prototype.InitDaySelect = function () {
            // 使用parseInt函数获取当前的年份和月份
            var year = parseInt(this.selYear.value);
            var month = parseInt(this.selMonth.value);
            // 获取当月的天数
            var daysInMonth = DateSelector.DaysInMonth(year, month);
            // 清空原有的选项
            this.selDay.options.length = 0;
            // 循环添加OPION元素到天数select对象中
            for (var i = 1; i <= daysInMonth; i++) {
                // 新建一个OPTION对象
                var op = window.document.createElement("OPTION");
                // 设置OPTION对象的值
                op.value = i;
                // 设置OPTION对象的内容
                op.innerHTML = i;
                // 添加到天数select对象
                this.selDay.appendChild(op);
            }
        };
        // 处理年份和月份onchange事件的方法，它获取事件来源对象（即selYear或selMonth）
        // 并调用它的Group对象（即DateSelector实例，请见构造函数）提供的InitDaySelect方法重新初始化天数
        // 参数e为event对象
        DateSelector.Onchange = function (e) {
            var selector = window.document.all != null ? e.srcElement : e.target;
            selector.Group.InitDaySelect();
        };
        // 根据参数初始化下拉菜单选项
        DateSelector.prototype.InitSelector = function (year, month, day) {
            // 由于外部是可以调用这个方法，因此我们在这里也要将selYear和selMonth的选项清空掉
            // 另外因为InitDaySelect方法已经有清空天数下拉菜单，因此这里就不用重复工作了
            this.selYear.options.length = 0;
            this.selMonth.options.length = 0;
            // 初始化年、月
            this.InitYearSelect();
            this.InitMonthSelect();

            // 设置年、月初始值
            this.selYear.selectedIndex = this.MaxYear - year;
            this.selMonth.selectedIndex = month - 1;

            // 初始化天数
            this.InitDaySelect();

            // 设置天数初始值
            this.selDay.selectedIndex = day - 1;
        };
    </script>
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
<script type="text/javascript">
    var selYear = window.document.getElementById("selYear");
    var selMonth = window.document.getElementById("selMonth");
    var selDay = window.document.getElementById("selDay");
    var selYear_end = window.document.getElementById("selYear_end");
    var selMonth_end = window.document.getElementById("selMonth_end");
    var selDay_end = window.document.getElementById("selDay_end");
    // 新建一个DateSelector类的实例，将三个select对象传进去
    new DateSelector(selYear, selMonth, selDay);
    new DateSelector(selYear_end, selMonth_end, selDay_end);

    function clearIn() {
        $("#title").val("");
        $("#content").val("");
    }

    function test() {
        var begin_date = new Date(selYear.value, selMonth.value - 1, selDay.value);
        var end_date = new Date(selYear_end.value, selMonth_end.value - 1, selDay_end.value);
        var content = document.getElementById("content").value;
        var title = document.getElementById("title").value;
        var content = document.getElementById("content").value;
        if (begin_date.getTime() > end_date.getTime()) {
            alert("开始时间不能早于结束时间！");
            return;
        }
        if (title.toString().trim().length <= 0 || content.toString().trim().length <= 0) {
            alert("标题或内容不能为空！");
            return;
        }
        if (title.length > 45) {
            alert("标题超过最大长度！");
            return;
        }
        if (content.length > 20000) {
            alert("内容超过最大长度！");
            return;
        } else {
            content = content.replace(/\n/g, "<br>");
            content = content.replace(/\s/g, "&nbsp;");
            var notice={
                "title": title,
                "begin_time": begin_date.toString(),
                "end_time": end_date.toString(),
                "content": content,
                "user_id":'${sessionScope.user.user_id}',
            };
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/notice/updateNotice",
                data:JSON.stringify(notice),
                contentType : 'application/json;charset=UTF-8',
                dataType: "text",
                success: function (data) {
                    alert(data);
                    $('#return').click();
                },
                error: function () {
                    alert("请稍后重试");
                }
            });
        }
    }
</script>
</body>
</html>
