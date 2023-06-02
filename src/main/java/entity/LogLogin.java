package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LogLogin {
    /** 主键 */
    private int id;

    /** 登录用户 */
    private String username;

    private int user_id;

    private String session_id;
    /** 登陆时间 */
    private Timestamp login_time;

    /** IP地址 */
    private String ip_address;

    private String login_address;
    private String browser_type;

    private String state;
}
