package interceptor;

import entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        List<String> urlList = new ArrayList<>();
        urlList.add("/user/login");//登录 POST请求
        urlList.add("/user/register");//注册页面
        urlList.add("/user/checkUsername");//注册检查
        urlList.add("/user/checkEmail");//注册检查
        urlList.add("/user/sendEmail");//发送邮件验证码 POST请求
        urlList.add("/user/code");//校验邮件验证码 POST请求
        urlList.add("/user/registerUser");//注册提交
        urlList.add("/user/retrievePwd");//找回密码提交
        urlList.add("/user/retrieve");//忘记密码页面
        urlList.add("/user/revisePwd");//修改密码提交

        String URL = request.getServletPath();
        if (user==null && !urlList.contains(URL)) {
            if (URL.equals("/user/registerSuccess")) {
                request.setAttribute("error", "请填写注册信息！");
                request.getRequestDispatcher("/user/register").forward(request, response);
            } else {
                request.setAttribute("error", "请先登录！");
                request.getRequestDispatcher("/").forward(request, response);
            }
            return false;
        }else {
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
