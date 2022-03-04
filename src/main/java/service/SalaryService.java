package service;

import entity.Department;
import entity.Page;
import entity.Salary;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public interface SalaryService {
    Department deptInfo(String department);//部门定薪表查询(部门定薪)
    List<Salary> deptSalary(String department);//工资表全表扫描（仅修改部门定薪表时调用）
    List<Salary> salaryInfo(String keywords,Integer nowPage);//分页展示
    Page pageSalary(String keywords,Integer nowPage);//统计记录
    int addSalary(Salary salary);//添加工资表记录（单条）
    int updateSalary(Salary salary);//修改工资表记录（单条）
    void updateAllSalary(List<Salary> salaryList);//工资表全表更新（仅修改部门定薪表时调用）
    int updateDeptSalary(Department dept);//部门定薪表修改
}
