package utils;

import entity.Dept;
import entity.Salary;
import entity.Staff;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class Utils {

    public static String getRegisterDay(String registerTime) throws ParseException {//根据date计算天数
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = simpleDateFormat.parse(registerTime.substring(0, 10));
        float days = (new Date().getTime() - date.getTime()) / 86400000;
        if (days < 1) days = 1;
        String registerDays = Float.toString(days).substring(0, Float.toString(days).length() - 2);
        return registerDays;
    }

    //获取当前时间
    public static Timestamp getNowTime() {
        Date utilDate = new Date();//util utilDate
        Timestamp sqlDate = new Timestamp(utilDate.getTime());//uilt date转sql date
        return sqlDate;
    }

    public static String getStringTime() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmm");
        String nowTime = simpleDateFormat.format(new Date());
        return nowTime;
    }

    public static String transSqlTime(String sqlTime) {//截取最后两位（.0）
        String stringTime = sqlTime.substring(0, sqlTime.length() - 2);
        return stringTime;
    }

    public static Date transTime(String date) {//格林威治时间字符串转为Date类型时间
        SimpleDateFormat format = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss", Locale.ENGLISH);
        Date dateTrans = null;
        try {
            dateTrans = format.parse(date);
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
            String d = sdf2.format(dateTrans).replace("-", "-");
            Date date1 = sdf2.parse(d);//转Date
            return date1;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Timestamp sqlDate(Date date) throws ParseException {
        Timestamp sqlDate = new Timestamp(date.getTime());//uilt date转sql date
        return sqlDate;
    }

    //    public static  String transTimestamp(Timestamp date) throws ParseException {
//        DateFormat sdf = new SimpleDateFormat();
//        String time=sdf.format(date);
//        System.out.println(time);
//        return time;
//    }
    public static Salary getPersonalSalary(Staff staff, Dept dept) {//计算员工工资表
        Salary salary = new Salary();
        salary.setStaffId(staff.getStaffId());
        salary.setDepartment(staff.getDepartment());
        salary.setRank(staff.getRank());
        salary.setSalary(staff.getRank() * dept.getBaseSalary());//月薪=职级*部门基本工资
        salary.setSubsidy(staff.getRank() * dept.getBaseSubsidy());//补贴=职级*部门基本补贴
        salary.setBonus(staff.getRank() * dept.getBaseBonus());//奖金=职级*部门基本奖金
        salary.setAnnual(dept.getBaseAnnual() * (salary.getSalary() + salary.getSubsidy() + salary.getBonus()));
        //年薪=职级*（月薪+补贴+奖金）*部门年薪基数
        return salary;
    }

    public static Salary getUpdateSalary(Salary salary, Dept dept) {
        float sy = salary.getRank() * dept.getBaseSalary();
        System.out.println(sy);
        salary.setSalary(sy);
        salary.setSubsidy(salary.getRank() * dept.getBaseSubsidy());
        salary.setBonus(salary.getRank() * dept.getBaseBonus());
        salary.setAnnual(dept.getBaseAnnual() * (salary.getSalary() + salary.getSubsidy() + salary.getBonus()));
        return salary;
    }

    public static Dept deptFactory(List<Dept> deptList, String department) {
        for (Dept dept : deptList) {
            if (department.equals(dept.getDepartment())) {
                return dept;
            }
        }
        return null;
    }
}
