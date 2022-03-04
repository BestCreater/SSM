package service;

import dao.StaffMapper;
import entity.Department;
import entity.Page;
import entity.Salary;
import entity.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import utils.Utils;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class StaffServiceImpl implements StaffService{
    private StaffMapper staffMapper;
    private SalaryService salaryService;
    public void setStaffMapper(StaffMapper staffMapper){
        this.staffMapper=staffMapper;
    }
    @Autowired
    @Qualifier("SalaryServiceImpl")
    public void setSalaryService(SalaryService salaryService){
        this.salaryService=salaryService;
    }

    @Override
    public List<Staff> staffInfo(String keywords, Integer nowPage) {
        Map<String,Object> map=new HashMap<>();
        map.put("keywords",keywords);
        map.put("showRow",(nowPage-1)*10);
        return this.staffMapper.staffInfo(map);
    }

    @Override
    public Page pageStaff(String keywords, Integer nowPage) {
        Page page=new Page();
        page.setCountRow(this.staffMapper.sumRow(keywords));
        page.amountPage();
        page.setNowPage(nowPage);
        return page;
    }

    @Override
    public Staff checkId(int staff_id) {
        return this.staffMapper.checkId(staff_id);
    }

    @Override
    public int addStaff(Staff staff) {
        int row=this.staffMapper.addStaff(staff);
        if (row!=0){
            Department department=salaryService.deptInfo(staff.getDepartment());
            Salary salary=Utils.getPersonalSalary(staff,department);
            if (salaryService.addSalary(salary)==0){
                deleteStaff(staff.getStaff_id());
                row=0;
            }
        }
        return row;
    }

    @Override
    public int deleteStaff(int staff_id) {
        return this.staffMapper.deleteStaff(staff_id);
    }

    @Override
    public int updateStaff(Staff staff) {
        Staff sf=checkId(staff.getStaff_id());
        if (!sf.getDepartment().equals(staff.getDepartment())||sf.getRank()!=staff.getRank()){
            Salary salary=Utils.getPersonalSalary(staff,salaryService.deptInfo(staff.getDepartment()));
            salaryService.updateSalary(salary);
        }
        return this.staffMapper.updateStaff(staff);
    }
}
