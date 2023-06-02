package controller;

import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.SalaryService;

import java.util.ArrayList;
import java.util.List;
@RequestMapping("/salary")
@Controller
public class SalaryController {
    private static Page page =new Page();
    private static List<Salary> salaryList=new ArrayList<>();
    private ResultMsg resultMsg=new ResultMsg();
    @Autowired
//    @Qualifier("SalaryServiceImpl")
    private SalaryService salaryService;
    @RequestMapping("/mainSalary")
    public String mainSalary(Model model){
        salaryList=salaryService.salaryInfo(null,1);
        page=salaryService.pageSalary(null,1);
        model.addAttribute("salaryList", salaryList);
        model.addAttribute("page",page);
        return "salary";
    }
    @RequestMapping("/pageSalary")
    public String pageStaff(Model model, Integer u_page, String keywords){
        salaryList=salaryService.salaryInfo(keywords,u_page);
        page=salaryService.pageSalary(keywords,u_page);
        model.addAttribute("salaryList", salaryList);
        model.addAttribute("keywords",keywords);
        model.addAttribute("page",page);
        return "salary";
    }
    @RequestMapping("/deptSalary")
    public String deptSalary(Model model,String department){
        if ("".equals(department)||department==null){
            department="管理部";
        }
        Department dept=salaryService.deptInfo(department);
        model.addAttribute("dept", dept);
        return "deptSalary";
    }
    @RequestMapping("/updateDept")
    @ResponseBody
    public String updateDept(@RequestBody Department department){
        System.out.println(department);
        resultMsg.falseMsg();
        if (salaryService.updateDeptSalary(department)!=0){
            resultMsg.trueMsg();
        }
        return resultMsg.getMsg();
    }
}
