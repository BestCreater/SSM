package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Department {
    private String department;
    private float base_salary;
    private float base_bonus;
    private float base_subsidy;
    private float base_annual;
}
