package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int user_id;
    private String username;
    private String password;
    private String email;
    private String register_time;
    private int role_id;
    private String role_name;
    private String status;
    private String online_status;

}
