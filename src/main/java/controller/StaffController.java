package controller;

import entity.Page;
import entity.Staff;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.StaffService;
import service.UserService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/staff")
public class StaffController {
    private static Page page =new Page();
    private static List<Staff> staffList=new ArrayList<>();
    private String msg;
    @Autowired
    @Qualifier("StaffServiceImpl")
    private StaffService staffService;
    @RequestMapping("/mainStaff")
    public String mainStaff(Model model){
        staffList=staffService.staffInfo(null,1);
        page=staffService.pageStaff(null,1);
        model.addAttribute("staffList",staffList);
        model.addAttribute("page",page);
        return "staff";
    }
    @RequestMapping("/pageStaff")
    public String pageStaff(Model model,Integer u_page,String keywords){
        if ("".equals(keywords))keywords=null;
        staffList=staffService.staffInfo(keywords,u_page);
        page=staffService.pageStaff(keywords,u_page);
        model.addAttribute("staffList",staffList);
        model.addAttribute("keywords",keywords);
        model.addAttribute("page",page);
        return "staff";
    }
    @RequestMapping("/addStaff")
    @ResponseBody
    public String addStaff(Staff staff){
        if (staffService.addStaff(staff)!=0){
            msg="添加成功";
        }else {
            msg="服务器繁忙，请稍后再试";
        }
        return msg;

    }
    @RequestMapping("/deleteStaff")
    @ResponseBody
    public String deleteStaff(int staffId){
        if (staffService.deleteStaff(staffId)!=0){
            msg="删除成功";
        }else {
            msg="服务器繁忙，请稍后再试";
        }
        return msg;

    }
    @RequestMapping("/updateStaff")
    @ResponseBody
    public String updateStaff(@RequestBody Staff staff){
        if (staffService.updateStaff(staff)!=0){
            msg="修改成功";
        }else {
            msg="服务器繁忙，请稍后再试";
        }
        return msg;

    }
}
