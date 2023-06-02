package service;

import entity.Page;
import entity.Staff;
import entity.User;

import java.util.List;

public interface StaffService {
    List<Staff> staffInfo(String keywords, Integer nowPage);

    Page pageStaff(String keywords, Integer nowPage);

    Staff checkId(int staff_id);
    int addStaff(Staff staff) throws Exception;

    int deleteStaff(int staff_id);

    int updateStaff(Staff staff);
}
