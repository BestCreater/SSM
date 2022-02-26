package entity;

public class Dept {
    private String department;
    private float baseSalary;
    private float baseBonus;
    private float baseSubsidy;
    private float baseAnnual;

    public Dept() {
    }


    public Dept(String department, float baseSalary, float baseBonus, float baseSubsidy, float baseAnnual) {
        this.department = department;
        this.baseSalary = baseSalary;
        this.baseBonus = baseBonus;
        this.baseSubsidy = baseSubsidy;
        this.baseAnnual = baseAnnual;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public float getBaseSalary() {
        return baseSalary;
    }

    public void setBaseSalary(float baseSalary) {
        this.baseSalary = baseSalary;
    }

    public float getBaseBonus() {
        return baseBonus;
    }

    public void setBaseBonus(float baseBonus) {
        this.baseBonus = baseBonus;
    }

    public float getBaseSubsidy() {
        return baseSubsidy;
    }

    public void setBaseSubsidy(float baseSubsidy) {
        this.baseSubsidy = baseSubsidy;
    }

    public float getBaseAnnual() {
        return baseAnnual;
    }

    public void setBaseAnnual(float baseAnnual) {
        this.baseAnnual = baseAnnual;
    }

    @Override
    public String toString() {
        return "Dept{" +
                "department='" + department + '\'' +
                ", baseSalary=" + baseSalary +
                ", baseBonus=" + baseBonus +
                ", baseSubsidy=" + baseSubsidy +
                ", baseAnnual=" + baseAnnual +
                '}';
    }
}
