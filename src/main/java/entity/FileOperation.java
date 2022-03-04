package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileOperation {
    private int file_id;
    private int user_id;
    private String file_name;
    private String file_description;
    private String username;
    private String upload_time;
    private int download_amount;
    private String path;
}
