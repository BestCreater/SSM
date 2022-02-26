package service;

import entity.Page;
import entity.Staff;
import entity.User;

import java.util.List;

public interface StaffService {
    List<Staff> staffInfo(String keywords, Integer nowPage);

    Page pageStaff(String keywords, Integer nowPage);

    int addStaff(Staff staff);

    int deleteStaff(int staffId);

    int updateStaff(Staff staff);
}
