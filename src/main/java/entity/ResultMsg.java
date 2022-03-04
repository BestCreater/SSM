package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultMsg {
    private String msg;
    private String checkMsg;
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
    public String cancelMsg(){
        this.setMsg("登录信息已过期，请重新登录！");
        return this.msg;
    }
    public String rsTrueMsg(){
        this.setCheckMsg("可用");
        return this.checkMsg;
    }
    public String rsFalseMsg(){
        this.setCheckMsg("已存在");
        return this.checkMsg;
    }
}
