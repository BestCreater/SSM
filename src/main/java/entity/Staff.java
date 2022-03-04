package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Staff {
    private int staff_id;
    private String name;
    private String sex;
    private String department;
    private int rank;//职级
}

