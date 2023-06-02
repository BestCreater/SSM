package dao;

import entity.Page;
import entity.Staff;
import entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
@Mapper
@Repository
public interface StaffMapper {
    List<Staff> staffInfo(@Param("map") Map<String,Object> map);
    Integer sumRow(@Param("keywords")String keywords);
    Staff checkId(int staff_id);
    int addStaff(Staff staff);
    int deleteStaff(@Param("staff_id")int staff_id);
    int updateStaff(Staff staff);
}
