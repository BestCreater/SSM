package controller;

import entity.LogLogin;
import entity.Page;
import entity.ResultMsg;
import entity.User;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;
import listener.SessionCounter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.LogService;
import service.UserService;
import utils.Utils;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {
    private static Page page =new Page();
    private static List<User> userList=new ArrayList<>();
    private static Map<String,Object> onlineUser= SessionCounter.onlineUser;
    private static ResultMsg resultMsg =new ResultMsg();
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @Autowired
    private Utils utils;
    @Autowired
    @Qualifier("LogServiceImpl")
    private LogService logService;
    @RequestMapping("/index")
    public String index() {
            return "backstage";
    }
    @PostMapping("/login")
    public String login(User user, Model model, HttpServletRequest req){
        User userLogin=userService.login(user);
        if (userLogin!=null){//通过验证
            if (userLogin.getStatus().equals("off")){//账号封禁
                model.addAttribute("error","账号状态异常");
                return "login";
            }
            req.getSession().setAttribute("user",userLogin);
            req.getSession().setMaxInactiveInterval(24*60*60);
            onlineUser.put(req.getSession().getId(),((User)req.getSession().
                    getAttribute("user")).getUsername());
            logService.addLogLogin(new LogLogin(0,null,userLogin.getUser_id(),
                    req.getSession().getId(),new Timestamp(new Date().getTime()), req.getRemoteAddr(),
                    utils.address(req.getRemoteAddr()),Utils.getBrowser(req.getHeader("User-Agent"))));
            return "redirect:/user/index";
        }
        model.addAttribute("error","账号或密码错误！");//未通过验证
        return "login";
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        User userLogout=(User)session.getAttribute("user");
        onlineUser.remove(session.getId());
        if (userLogout!=null&&!onlineUser.containsValue(userLogout.getUsername())) {
            userLogout.setOnline_status("离线");
            userService.onlineStatus(userLogout);
        }
        session.removeAttribute("user");
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
        resultMsg.falseMsg();
        if (userService.updateUser(user_id,status)!=0){
            resultMsg.trueMsg();
        }
        return resultMsg.getMsg();
    }
    @RequestMapping("/updateRole")
    @ResponseBody
    public String updateRole(@RequestBody User user){
        resultMsg.falseMsg();
        if (userService.updateRole(user)!=0){
            resultMsg.trueMsg();
        }
        return resultMsg.getMsg();
    }
    @RequestMapping("/checkPwd")
    @ResponseBody
    public String checkPwd(@RequestBody User user){
        resultMsg.falseMsg();
        if (userService.login(user)!=null){
            resultMsg.trueMsg();
        }
        return resultMsg.getMsg();
    }
    @RequestMapping("/revisePwd")
    public String revisePwd(Model model, User user, HttpServletRequest req){
        if (userService.revisePwd(user)!=0){
            model.addAttribute("username",user.getUsername());
            logout(req.getSession());
            return "login";
        }
        return "revisePassword";
    }

    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping("/checkUsername")
    @ResponseBody
    public String checkUsername(String username){
        resultMsg.rsFalseMsg();
        if (userService.checkUsername(username)==null){
            resultMsg.rsTrueMsg();
        }
        return resultMsg.getCheckMsg();
    }
    @RequestMapping("/checkEmail")
    @ResponseBody
    public String checkEmail(String email){
        resultMsg.rsFalseMsg();
        if (userService.checkEmail(email)==null){
            resultMsg.rsTrueMsg();
        }
        return resultMsg.getCheckMsg();
    }

    @PostMapping("/sendEmail")
    @ResponseBody
    public String sendEmail(HttpServletRequest req,HttpSession session,User user) throws Exception {
        int code=utils.email_163(user);
        session.setAttribute("code",code);
        session.setMaxInactiveInterval(60*5);
        System.out.println(session.getAttribute("code"));
        if (code==0){
            return resultMsg.falseMsg();
        }
        return resultMsg.trueMsg();
    }
    @PostMapping("/registerUser")
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
    @PostMapping("/retrievePwd")
    @ResponseBody
    public String retrievePwd(@RequestBody User user){
        resultMsg.falseMsg();
        if (userService.retrievePwd(user)!=null){
            resultMsg.trueMsg();
        }
        return resultMsg.getMsg();
    }
    @RequestMapping("/attention")
    @ResponseBody
    public String attention(String register_time) throws ParseException {
        return Utils.getRegisterDay(register_time);
    }
    @RequestMapping("/cancel")
    @ResponseBody
    public String cancel(int user_id){
        resultMsg.falseMsg();
        if (userService.deleteUser(user_id)!=0){
            resultMsg.cancelMsg();
        }
        return resultMsg.getMsg();
    }
    @PostMapping("/code")
    @ResponseBody
    public String code(HttpSession session,String code){
        if (session.getAttribute("code")!=null&&((session.getAttribute("code"))).equals(Integer.valueOf(code))){
            return "true";
        }
        return "false";
    }
}
