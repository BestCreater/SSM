package dao;

import entity.Department;
import entity.Salary;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Mapper
@Repository
public interface SalaryMapper {
    Department deptInfo(String department);//部门定薪表查询(部门定薪)
    List<Salary> deptSalary(@Param("department")String department);//工资表全表扫描（仅修改部门定薪表时调用）
    List<Salary> salaryInfo(@Param("map")Map<String,Object>map);//分页展示
    Integer sumRow(@Param("keywords") String keywords);//统计记录
    int addSalary(Salary salary);//添加工资表记录（单条）
    int updateSalary(Salary salary);//修改工资表记录（单条）
    void updateAllSalary(@Param("list") List<Salary> list);//工资表全表更新（仅修改部门定薪表时调用）
    int updateDeptSalary(Department dept);//部门定薪表修改
}
