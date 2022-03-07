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
        urlList.add("/user/login");
        urlList.add("/user/register");
        urlList.add("/user/checkUsername");
        urlList.add("/user/checkEmail");
        urlList.add("/user/sendEmail");
        urlList.add("/user/code");
        urlList.add("/user/registerUser");
        urlList.add("/user/retrievePwd");
        urlList.add("/user/retrieve");
        urlList.add("/user/revisePwd");
        String URL = request.getServletPath();
        if (user==null && !urlList.contains(URL)) {
            if (URL.equals("/user/registerSuccess")) {
                request.setAttribute("error", "请填写注册信息！");
                request.getRequestDispatcher("/user/register").forward(request, response);
            } else {
                request.setAttribute("error", "请先登录！");
                request.getRequestDispatcher("/user/login").forward(request, response);
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
