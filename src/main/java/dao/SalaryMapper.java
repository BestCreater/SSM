package dao;

import entity.Dept;
import entity.Page;
import entity.Salary;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface SalaryMapper {
    public List<Dept> allDeptSalary(Connection connection) throws SQLException;//部门定薪表查询(部门定薪)

    public List<Salary> allSalary(Connection connection, String department) throws SQLException;//工资表全表扫描（仅修改部门定薪表时调用）

    public List<Salary> pageSalary(Connection connection, String userIn, Page page) throws SQLException;//分页展示

    public Page sumRow(Connection connection, String userIn, Page page) throws SQLException;//统计记录

    public int addSalary(Connection connection, Salary salary) throws SQLException;//添加工资表记录（单条）

    public int updateSalary(Connection connection, Salary salary) throws SQLException;//修改工资表记录（单条）

    public void updateAllSalary(Connection connection, List<Salary> salaryList) throws SQLException;//工资表全表更新（仅修改部门定薪表时调用）

    public int updateDeptSalary(Connection connection, Dept dept) throws SQLException;//部门定薪表修改
}
