package aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;

import java.lang.reflect.Method;

@Aspect
public class TestAop {
    @Pointcut("execution(* service.UserServiceImpl.userInfo(..))")
    private void anyMethod(){}//定义一个切入点

    @Before("anyMethod() && args(name)")
    public void doAccessCheck(String name){
        System.out.println(name);
        System.out.println("前置通知");
    }

    @AfterReturning("anyMethod()")
    public void doAfter(){
        System.out.println("后置通知");
    }

    @After("anyMethod()")
    public void after(JoinPoint joinPoint){
        String targetName = joinPoint.getTarget().getClass().getName();
        Class targetClass = null;
        try {
            targetClass = Class.forName(targetName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        //*========控制台输出=========*//
        System.out.println(targetClass);
        System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
        System.out.println("最终通知");
    }

    @AfterThrowing("anyMethod()")
    public void doAfterThrow(){
        System.out.println("例外通知");
    }

    @Around("anyMethod()")
    public Object doBasicProfiling(ProceedingJoinPoint pjp) throws Throwable{
        System.out.println("进入环绕通知");
        Object object = pjp.proceed();//执行该方法
        System.out.println("退出方法");
        return object;
    }

}



