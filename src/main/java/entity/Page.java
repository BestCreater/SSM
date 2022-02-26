package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Page {
    private Integer nowPage = 1;
    private Integer sumPage = 1;
    private Integer countRow;
    private Integer showRow;

    public int getShowRow() {
        this.showRow = (this.nowPage - 1) * 10;
        return showRow;
    }
    //计算总页数
    public void amountPage() {
        if (this.countRow == 0){
            return;
        }if (this.countRow % 10 == 0) {
            this.sumPage = this.countRow / 10;
        } else {
            this.sumPage = this.countRow / 10 + 1;
        }
    }

}
