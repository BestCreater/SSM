package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Salary {
    private int id;
    private int staff_id;
    private String name;
    private String department;
    private int rank;
    private float salary;
    private float subsidy;
    private float bonus;
    private float annual;
}