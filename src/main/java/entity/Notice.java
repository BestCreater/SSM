package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice implements Serializable {
    private int id;
    private int user_id;
    private String username;
    private String title;
    private String content;
    private String begin_time;
    private String end_time;
    private String publish_time;
}
