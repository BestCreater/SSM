package service;

import dao.StaffMapper;
import entity.Department;
import entity.Page;
import entity.Salary;
import entity.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import utils.Utils;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
@Transactional
public class StaffServiceImpl implements StaffService{
    @Autowired
    private StaffMapper staffMapper;
//    public void setStaffMapper(StaffMapper staffMapper){
//        this.staffMapper=staffMapper;
//    }
    @Autowired
    private SalaryService salaryService;

//    @Qualifier("SalaryServiceImpl")
//    public void setSalaryService(SalaryService salaryService){
//        this.salaryService=salaryService;
//    }

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
    @Transactional(rollbackFor = Exception.class)
    public int addStaff(Staff staff) throws Exception {
        int row=0;
        try {
            row=this.staffMapper.addStaff(staff);
            if (row!=0){
                Department department=salaryService.deptInfo(staff.getDepartment());
                Salary salary=Utils.getPersonalSalary(staff,department);
                row=salaryService.addSalary(salary);
            }
        }catch (Exception e){
            throw new Exception("添加异常");
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
