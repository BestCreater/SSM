package controller;

import entity.Page;
import entity.ResultMsg;
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
    private ResultMsg resultMsg=new ResultMsg();
    @Autowired
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
        staffList=staffService.staffInfo(keywords,u_page);
        page=staffService.pageStaff(keywords,u_page);
        model.addAttribute("staffList",staffList);
        model.addAttribute("keywords",keywords);
        model.addAttribute("page",page);
        return "staff";
    }
    @RequestMapping("/checkId")
    @ResponseBody
    public String checkId(int staff_id){
        resultMsg.rsFalseMsg();
        if (staffService.checkId(staff_id)==null){
            resultMsg.rsTrueMsg();
        }
        return resultMsg.getCheckMsg();
    }
    @RequestMapping("/addStaff")
    @ResponseBody
    public String addStaff(Staff staff) throws Exception {
        resultMsg.falseMsg();
        if (staffService.addStaff(staff)!=0){
            resultMsg.trueMsg();
        }
        return resultMsg.getMsg();

    }
    @RequestMapping("/deleteStaff")
    @ResponseBody
    public String deleteStaff(int staff_id){
        resultMsg.falseMsg();
        if (staffService.deleteStaff(staff_id)!=0){
            resultMsg.trueMsg();
        }
        return resultMsg.getMsg();

    }
    @RequestMapping("/updateStaff")
    @ResponseBody
    public String updateStaff(@RequestBody Staff staff){
        resultMsg.falseMsg();
        if (staffService.updateStaff(staff)!=0){
            resultMsg.trueMsg();
        }
        return resultMsg.getMsg();
    }
}
