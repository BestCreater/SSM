package aop;

import entity.LogLogin;
import entity.User;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import service.LogService;
import service.UserService;
import utils.Utils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Date;

@Aspect
@Component
public class LoginAop {

    @Autowired
    public LogService logService;
    @Autowired
    public UserService userService;
    @Pointcut("execution(* service.UserServiceImpl.login(..))")
    private void anyMethod(){}//定义一个切入点

    @Before("anyMethod()")
    public void doAccessCheck(JoinPoint joinPoint) throws Exception {
        System.out.println("参数为："+ Arrays.toString(joinPoint.getArgs()));
        System.out.println("前置通知");
    }

    @AfterReturning(value = "anyMethod()",returning = "returnVal")
    public void doAfter(JoinPoint joinPoint,Object returnVal){
        System.out.println("后置通知");
        User loginUser=(User) joinPoint.getArgs()[0];
        try {
            HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();//获取request
            if (req!=null){
                User user=(User) returnVal;
                String state="登录成功";
                if (user==null){//登录失败
                    state="账号或密码错误";
                    user=userService.checkUsername(loginUser.getUsername());
                    if (user==null)return;//没有这个用户
                }
                logService.addLogLogin(new LogLogin(0, null, user.getUser_id(),
                        req.getSession().getId(), new Timestamp(new Date().getTime()), req.getRemoteAddr(),
                        Utils.address(req.getRemoteAddr()), Utils.getBrowser(req.getHeader("User-Agent")),state));

            }
        }catch (Exception e){
            throw e;
        }

//        logService.addLogLogin(new LogLogin(0,null,userLogin.getUser_id(),
//                req.getSession().getId(),new Timestamp(new Date().getTime()), req.getRemoteAddr(),
//                utils.address(req.getRemoteAddr()), Utils.getBrowser(req.getHeader("User-Agent"))));
        if (returnVal==null){
            System.out.println("登录失败");
            return;
        }
        System.out.println(returnVal);
    }

    @After("anyMethod()")
    public void after(JoinPoint joinPoint){
//        String targetName = joinPoint.getTarget().getClass().getName();
//        Class targetClass = null;
//        try {
//            targetClass = Class.forName(targetName);
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//
//        //*========控制台输出=========*//
//        System.out.println(targetClass);
//        System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
//        System.out.println("最终通知");
    }

    @AfterThrowing("anyMethod()")
    public void doAfterThrow(){
        System.out.println("例外通知");
    }

    @Around("anyMethod()")
    public Object doBasicProfiling(ProceedingJoinPoint pjp) throws Throwable{
        System.out.println("进入环绕通知");
        Object object = pjp.proceed();//执行该方法
        return object;
    }

}



