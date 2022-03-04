package service;

import entity.Page;
import entity.User;

import java.util.List;

public interface UserService {
    List<User> userInfo(String keywords, Integer nowPage);
    Page pageUser(String keywords, Integer nowPage);
    User login(User user);
    int updateUser(int user_id,String status);
    int revisePwd(User user);
    int onlineStatus(User user);
    int updateRole(User user);
    User checkUsername(String username);
    User retrievePwd(User user);
    int register(User user);
    int deleteUser(int user_id);

}
