package listener;

import entity.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import service.LogService;
import service.UserService;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SessionCounter implements HttpSessionListener {
    public static Map<String,Object> onlineUser=new HashMap<>();



    private static int activeSessions =0;
    /* Session创建事件 */
    public void sessionCreated(HttpSessionEvent event) {
//创建session
    }
    /* Session失效事件 */
    public void  sessionDestroyed(HttpSessionEvent se){
        //Spring注解无法注入Session监听器解决办法
        ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userService = (UserService) context.getBean("UserServiceImpl"); // 填写要注入的类,注意第一个字母小写
        User user=(User) se.getSession().getAttribute("user");
        if(user!=null){
            onlineUser.remove(se.getSession().getId());
            if (!onlineUser.containsValue(user.getUsername())) {
                user.setOnline_status("离线");
                userService.onlineStatus(user);
            }
        }
    }


}