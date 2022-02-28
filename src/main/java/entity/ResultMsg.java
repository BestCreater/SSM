package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultMsg {
    private String msg;
    private String loginMsg;
    private String status;
    public String trueMsg(){
        this.setMsg("操作成功");
        return this.msg;
    }
    public String falseMsg(){
        this.setMsg("服务器繁忙");
        return this.msg;
    }
}
