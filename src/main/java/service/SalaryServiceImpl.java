package service;

import dao.SalaryMapper;
import entity.Department;
import entity.Page;
import entity.Salary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.Utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SalaryServiceImpl implements SalaryService {
    @Autowired
    private SalaryMapper salaryMapper;

//    public void setSalaryMapper(SalaryMapper salaryMapper){
//        this.salaryMapper=salaryMapper;
//    }
    @Override
    public Department deptInfo(String department) {
        return this.salaryMapper.deptInfo(department);
    }

    @Override
    public List<Salary> deptSalary(String department) {
        return this.salaryMapper.deptSalary(department);
    }

    @Override
    public List<Salary> salaryInfo(String keywords, Integer nowPage) {
        Map<String,Object> map=new HashMap<>();
        map.put("keywords",keywords);
        map.put("showRow",(nowPage-1)*10);
        return this.salaryMapper.salaryInfo(map);
    }

    @Override
    public Page pageSalary(String keywords, Integer nowPage) {
        Page page=new Page();
        page.setCountRow(this.salaryMapper.sumRow(keywords));
        page.amountPage();
        page.setNowPage(nowPage);
        return page;
    }

    @Override
    public int addSalary(Salary salary) {
        return this.salaryMapper.addSalary(salary);
    }

    @Override
    public int updateSalary(Salary salary) {
        return this.salaryMapper.updateSalary(salary);
    }

    @Override
    public void updateAllSalary(List<Salary> salaryList) {
        this.salaryMapper.updateAllSalary(salaryList);
    }

    @Override
    public int updateDeptSalary(Department dept) {
        int row=this.salaryMapper.updateDeptSalary(dept);
        if (row!=0){
            List<Salary> salaryList=deptSalary(dept.getDepartment());
            for (int i = 0; i <salaryList.size() ; i++) {
                salaryList.set(i,Utils.getUpdateSalary(salaryList.get(i),dept));
            }
            updateAllSalary(salaryList);
        }
        return row;
    }
}
