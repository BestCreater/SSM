package service;

import dao.StaffMapper;
import entity.Page;
import entity.Staff;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StaffServiceImpl implements StaffService{
    private StaffMapper staffMapper;
    public void setStaffMapper(StaffMapper staffMapper){
        this.staffMapper=staffMapper;
    }

    @Override
    public List<Staff> staffInfo(String keywords, Integer nowPage) {
        Map<String,Object> map=new HashMap<>();
        map.put("keywords",keywords);
        map.put("showRow",(nowPage-1)*10);
        return this.staffMapper.staffInfo(map);
    }

    @Override
    public Page pageStaff(String keywords, Integer nowPage) {
        Page page=new Page();
        page.setCountRow(this.staffMapper.sumRow(keywords));
        page.amountPage();
        page.setNowPage(nowPage);
        return page;
    }

    @Override
    public int addStaff(Staff staff) {
        return this.staffMapper.addStaff(staff);
    }

    @Override
    public int deleteStaff(int staffId) {
        return this.staffMapper.deleteStaff(staffId);
    }

    @Override
    public int updateStaff(Staff staff) {
        return this.staffMapper.updateStaff(staff);
    }
}
