package dao;

import entity.Page;
import entity.Staff;
import entity.User;
import org.apache.ibatis.annotations.Param;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface StaffMapper {
    List<Staff> staffInfo(@Param("map") Map<String,Object> map);
    Integer sumRow(@Param("keywords")String keywords);
    int addStaff(Staff staff);
    int deleteStaff(@Param("staffId")int staffId);
    int updateStaff(Staff staff);
}
