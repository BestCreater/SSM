package utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import entity.*;
import eu.bitwalker.useragentutils.UserAgent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class Utils {
    private int code;
    private Random random=new Random();
    @Autowired
    private JavaMailSender javaMailSender;


    public static String getRegisterDay(String register_time) throws ParseException {//根据date计算天数
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = simpleDateFormat.parse(register_time.substring(0, 10));
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
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime = simpleDateFormat.format(new Date());
        return nowTime;
    }

    public static String transSqlTime(Timestamp tp) {//截取最后两位（.0）
        SimpleDateFormat st=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String sqlTime =st.format(tp);
        String stringTime = sqlTime.substring(0, sqlTime.length() - 2);
        return stringTime;
    }

    public static String transDate(Date date){
        SimpleDateFormat st=new SimpleDateFormat();
        return st.format(date);
    }
    public static String transGMT(String GMT) {//格林威治时间字符串转为Date类型时间
        SimpleDateFormat format = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss", Locale.ENGLISH);
        Date dateTrans = null;
        try {
            dateTrans = format.parse(GMT);
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
            String date = sdf2.format(dateTrans).replace("-", "-");
            return date;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Timestamp sqlDate(Date date) throws ParseException {
        Timestamp sqlDate = new Timestamp(date.getTime());//uilt date转sql date
        return sqlDate;
    }

    public static Salary getPersonalSalary(Staff staff, Department dept) {//计算员工工资表
        Salary salary = new Salary();
        salary.setStaff_id(staff.getStaff_id());
        salary.setSalary(staff.getRank() * dept.getBase_salary());//月薪=职级*部门基本工资
        salary.setSubsidy(staff.getRank() * dept.getBase_subsidy());//补贴=职级*部门基本补贴
        salary.setBonus(staff.getRank() * dept.getBase_bonus());//奖金=职级*部门基本奖金
        salary.setAnnual(dept.getBase_annual() * (salary.getSalary() + salary.getSubsidy() + salary.getBonus()));
        //年薪=职级*（月薪+补贴+奖金）*部门年薪基数
        return salary;
    }

    public static Salary getUpdateSalary(Salary salary, Department dept) {
        salary.setSalary(salary.getRank() * dept.getBase_salary());
        salary.setSubsidy(salary.getRank() * dept.getBase_subsidy());
        salary.setBonus(salary.getRank() * dept.getBase_bonus());
        salary.setAnnual(dept.getBase_annual() * (salary.getSalary() + salary.getSubsidy() + salary.getBonus()));
        return salary;
    }

    public static Department deptFactory(List<Department> deptList, String department) {
        for (Department dept : deptList) {
            if (department.equals(dept.getDepartment())) {
                return dept;
            }
        }
        return null;
    }
    public static String address(String ip){
        if ("0:0:0:0:0:0:0:1".equals(ip)||ip==null){
            ip="";
        }
        String address="";
        try {
            String st=Http.sendGet("https://ip.help.bj.cn/","ip="+ip);
            Map<String,Object> ads= JSONObject.parseObject(st);
            JSONArray jsonArray=(JSONArray) ads.get("data");
            JSONObject data=jsonArray.getJSONObject(0);
            address=data.get("province").toString()+data.get("city").toString();
        }catch (Exception e){
            address="未知";
        }
        return address;
    }

    public static String getBrowser(String header) {
        UserAgent userAgent = UserAgent.parseUserAgentString(header);
        if (header.contains("Edg")){
            return "MSEdge";
        }else {
            return userAgent.getBrowser().getName();
        }
    }
    /*默认使用163邮箱发送验证码，相应配置文件database.properties
    若发送失败或出现异常等则使用qq邮箱*/
    public int email_163(User user) throws Exception {
        MimeMessage message=javaMailSender.createMimeMessage();
        MimeMessageHelper messageHelper;
        try {
            messageHelper= new MimeMessageHelper(message,true);
            messageHelper.setFrom("getxiaohz@163.com");//发件人
            messageHelper.setTo(user.getEmail());
            messageHelper.setSubject("信息管理系统邮箱验证码");
            code=(random.nextInt(900000)+100000);
            String text="您好！您的邮箱验证码："+code+",该验证码5分钟内有效。为了保障您的账户安全，请勿向他人泄漏验证码信息。";
            if (user.getUsername()!=null&&!"".equals(user.getUsername())){
                text=user.getUsername()+","+text;
            }
            messageHelper.setText(text,true);	//true代表支持html格式
            javaMailSender.send(message);
        } catch (Exception e) {
            code=email_qq(user);
        }
        return code;
    }

    public int email_qq(User user) throws Exception {
        try {
            Properties properties =new Properties();
            properties.put("mail.smtp.host", "smtp.qq.com");
            properties.put("mail.smtp.port", "25");
            properties.put("mail.smtp.auth", "true");
            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("1643861077@qq.com","mypjjpewxsqhdefj");
                }
            });
            code=(random.nextInt(900000)+10000);
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("xiao_hz@qq.com"));
            message.setRecipient(Message.RecipientType.TO,new InternetAddress(user.getEmail()));
            message.setSubject("信息管理系统邮箱验证码");
            code=(random.nextInt(900000)+100000);
            String text="您好！您的邮箱验证码："+code+",该验证码5分钟内有效。为了保障您的账户安全，请勿向他人泄漏验证码信息。";
            if (user.getUsername()!=null&&!"".equals(user.getUsername())){
                text=user.getUsername()+","+text;
            }
            message.setContent(text,"text/html;charset=UTF-8");
            Transport.send(message);
        }catch (Exception e){
            code=0;
            e.printStackTrace();
        }
        return code;
    }
    public void test(){
        System.out.println(123);
    }
}
