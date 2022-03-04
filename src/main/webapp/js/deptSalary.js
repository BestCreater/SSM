var dept = "管理部";
function dept(department) {
    if (department==2){
        dept="研发部";
    }if (department==3){
        dept="实习部";
    }
    window.location.href='${pageContext.request.contextPath}/salary/deptSalary?department='+dept;
}
function reviseSalary() {
    var r = confirm("您确定要更新" + department + "的薪资标准吗？更新后该部门所有员工的薪资金额将发生改变");
    if (r == true) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/salary/updateDept",
            dataType: "text",
            data: {
                "department": department,
                "salary":$('#salary').val() ,
                "subsidy": $('#subsidy').val(),
                "bonus": $('#bonus').val(),
                "annual": $('#annual').val()
            },
            success: function (data) {
                alert(data);
                $('#mainSalary').click();
            },
            error: function (error) {
                alert(error);
            }
        });
    } else {
        return;
    }
}