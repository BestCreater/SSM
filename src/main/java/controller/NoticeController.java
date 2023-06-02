package controller;

import entity.Notice;
import entity.Page;
import entity.ResultMsg;
import entity.User;
import listener.SessionCounter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.NoticeService;
import service.UserService;
import utils.Utils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController{
    private static Page page =new Page();
    private static List<Notice> noticeList=new ArrayList<>();
    private static ResultMsg resultMsg =new ResultMsg();
    @Autowired
//    @Qualifier("NoticeServiceImpl")
    private NoticeService noticeService;
    @RequestMapping("/mainNotice")
    public String mainNotice(Model model){
        noticeList=noticeService.noticeInfo(null,1);
        page=noticeService.pageNotice(null,1);
        model.addAttribute("noticeList",noticeList);
        model.addAttribute("page",page);
        return "notice";
    }
    @RequestMapping("/pageNotice")
    public String pageUser(Model model,Integer u_page,String keywords){
        noticeList=noticeService.noticeInfo(keywords,u_page);
        page=noticeService.pageNotice(keywords,u_page);
        model.addAttribute("noticeList",noticeList);
        model.addAttribute("keywords",keywords);
        model.addAttribute("page",page);
        return "notice";
    }
    @RequestMapping("/addNotice")
    public String addNotice(){
        return "addNotice";
    }
    @RequestMapping("/updateNotice")
    @ResponseBody
    public String addNotice(@RequestBody Notice notice){
        notice.setPublish_time(Utils.getStringTime());
        if (noticeService.addNotice(notice)!=0){
            resultMsg.trueMsg();
        }else {
            resultMsg.falseMsg();
        }
        return resultMsg.getMsg();
    }
    @RequestMapping("/deleteNotice")
    @ResponseBody
    public String deleteNotice(int id){
        if (noticeService.deleteNotice(id)!=0){
            resultMsg.trueMsg();
        }else {
            resultMsg.falseMsg();
        }
        return resultMsg.getMsg();
    }

}
