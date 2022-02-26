package controller;

import entity.Page;
import entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import service.UserService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.HttpCookie;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    private static Page page =new Page();
    private static List<User> userList=new ArrayList<>();
    private String msg;
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @RequestMapping("/index")
    public String index() {
            return "backstage";
    }
    @RequestMapping("/login")
    public String login(User user, Model model, HttpServletRequest req){
        if ("POST".equalsIgnoreCase(req.getMethod())!=true){
            return "login";
        }
        User userLogin=userService.login(user);
        if (userLogin!=null){//通过验证
            if (userLogin.getStatus().equals("off")){//账号封禁
                model.addAttribute("error","账号状态异常，请联系管理员");
                return "login";
            }
            req.getSession().setAttribute("user",userLogin);
            req.getSession().setMaxInactiveInterval(30*60);
            return "redirect:/user/index";
        }
        model.addAttribute("error","账号或密码错误！");//未通过验证
        return "login";
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest req){
        req.getSession().removeAttribute("user");
        return "login";
    }
    @RequestMapping("/mainUser")
    public String mainUser(Model model){
        userList=userService.userInfo(null,1);
        page=userService.pageUser(null,1);
        model.addAttribute("userList",userList);
        model.addAttribute("page",page);
        return "user";
    }
    @RequestMapping("/pageUser")
    public String pageUser(Model model,Integer u_page,String keywords){
        if ("".equals(keywords))keywords=null;
        userList=userService.userInfo(keywords,u_page);
        page=userService.pageUser(keywords,u_page);
        model.addAttribute("userList",userList);
        model.addAttribute("keywords",keywords);
        model.addAttribute("page",page);
        return "user";
    }
    @RequestMapping("/updateUser")
    @ResponseBody
    public String updateUser(int user_id,String status){
        if (userService.updateUser(user_id,status)!=0){
            msg="操作成功";
        }else {
            msg="服务器繁忙";
        }
        return msg;
    }
    @RequestMapping("/updateRole")
    @ResponseBody
    public String updateRole(@RequestBody User user){
        if (userService.updateRole(user)!=0){
            msg="操作成功";
        }else {
            msg="服务器繁忙";
        }
        return msg;
    }
    @RequestMapping("/checkPwd")
    @ResponseBody
    public String checkPwd(@RequestBody User user){
        if (userService.login(user)!=null){
            msg="true";
        }else {
            msg="false";
        }
        return msg;
    }
    @RequestMapping("/revisePwd")
    public String revisePwd(Model model, User user, HttpServletRequest req){
        if (userService.revisePwd(user)!=0){
            model.addAttribute("username",user.getUsername());
            logout(req);
        }
        return "revisePassword";
    }
    @RequestMapping("/checkUsername")
    @ResponseBody
    public String checkUsername(String username){
        if (userService.checkUsername(username)==null){
            msg="true";
        }else {
            msg="false";
        }
        return msg;
    }
    @RequestMapping("/register")
    public String register(){
        return "register";
    }
    @RequestMapping("/registerUser")
    public String registerUser(User user){
        if (userService.register(user)!=0){
            return "registerSuccess";
        }
        return "register";

    }
    @RequestMapping("/retrieve")
    public String retrieve(){
        return "retrievePwd";
    }
    @RequestMapping("/retrievePwd")
    @ResponseBody
    public String retrievePwd(User user){
        if (userService.retrievePwd(user)!=null){
            msg="密码重置成功！";
        }else {
            msg="服务器繁忙";
        }
        return msg;
    }
}
