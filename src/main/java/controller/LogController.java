package controller;

import entity.LogLogin;
import entity.Page;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.LogService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/log")
public class LogController {
    private static Page page =new Page();
    private static List<LogLogin> logList=new ArrayList<>();
    @Autowired
//    @Qualifier("LogServiceImpl")
    private LogService logService;

    @RequestMapping("/mainLog")
    public String mainLog(Model model){
        logList=logService.logInfo(null,1);
        page=logService.pageLog(null,1);
        model.addAttribute("logList",logList);
        model.addAttribute("page",page);
        return "logLogin";
    }
    @RequestMapping("/pageLog")
    public String pageLog(Model model,Integer u_page,String keywords){
        logList=logService.logInfo(keywords,u_page);
        page=logService.pageLog(keywords,u_page);
        model.addAttribute("logList",logList);
        model.addAttribute("keywords",keywords);
        model.addAttribute("page",page);
        return "logLogin";
    }
}
