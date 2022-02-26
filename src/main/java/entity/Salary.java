package entity;

public class Salary {
    private int payrollId;
    private int staffId;
    private String name;
    private String department;
    private int rank;
    private float salary;
    private float subsidy;
    private float bonus;
    private float annual;

    public Salary() {
    }

    public Salary(int payrollId, int staffId, String department, int rank, float salary, float subsidy, float bonus, float annual) {
        this.payrollId = payrollId;
        this.staffId = staffId;
        this.department = department;
        this.rank = rank;
        this.salary = salary;
        this.subsidy = subsidy;
        this.bonus = bonus;
        this.annual = annual;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPayrollId() {
        return payrollId;
    }

    public void setPayrollId(int payrollId) {
        this.payrollId = payrollId;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public float getSubsidy() {
        return subsidy;
    }

    public void setSubsidy(float subsidy) {
        this.subsidy = subsidy;
    }

    public float getBonus() {
        return bonus;
    }

    public void setBonus(float bonus) {
        this.bonus = bonus;
    }

    public float getAnnual() {
        return annual;
    }

    public void setAnnual(float annual) {
        this.annual = annual;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    @Override
    public String toString() {
        return "Salary{" +
                "payrollId=" + payrollId +
                ", staffId=" + staffId +
                ", department='" + department + '\'' +
                ", rank=" + rank +
                ", salary=" + salary +
                ", subsidy=" + subsidy +
                ", bonus=" + bonus +
                ", annual=" + annual +
                '}';
    }
}