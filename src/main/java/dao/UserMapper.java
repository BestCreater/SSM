package dao;

import entity.Page;
import entity.User;
import org.apache.ibatis.annotations.Param;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

public interface UserMapper {
    User login(User user);
    User checkUsername(@Param("username")String username);
    User retrievePwd(User user);
    int register(User user);
    int revisePwd(User user);
    List<User> userInfo(@Param("map") Map<String,Object>map);
    Integer sumRow(@Param("keywords")String keywords);
    int updateUser(@Param("user_id")int user_id,@Param("status")String status);
    int updateRole(User user);

}
