package dao;

import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    User login(User user);
    User checkUsername(@Param("username")String username);
    User retrievePwd(User user);
    int register(User user);
    int revisePwd(User user);
    int onlineStatus(User user);
    List<User> userInfo(@Param("map") Map<String,Object>map);
    Integer sumRow(@Param("keywords")String keywords);
    int updateUser(@Param("user_id")int user_id,@Param("status")String status);
    int updateRole(User user);


}
