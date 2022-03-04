package service;


import dao.UserMapper;
import entity.Page;
import entity.User;
import org.springframework.stereotype.Service;
import utils.Utils;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    private UserMapper userMapper;


    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public List<User> userInfo(String keywords, Integer nowPage) {
        Map<String,Object>map=new HashMap<>();
        map.put("keywords",keywords);
        map.put("showRow",(nowPage-1)*10);
        return this.userMapper.userInfo(map);
    }

    @Override
    public Page pageUser(String keywords, Integer nowPage) {
        Page page=new Page();
        page.setCountRow(this.userMapper.sumRow(keywords));
        page.amountPage();
        page.setNowPage(nowPage);
        return page;
    }
    @Override
    public User login(User user) {
        User userLogin=this.userMapper.login(user);
        if (userLogin!=null&&"on".equals(userLogin.getStatus())){
            userLogin.setOnline_status("在线");
            this.userMapper.onlineStatus(userLogin);
        }
        return userLogin;
    }

    @Override
    public int updateUser(int user_id, String status) {
        if("on".equals(status)){
            status="off";
        }else {
            status="on";
        }
        return this.userMapper.updateUser(user_id,status);
    }

    @Override
    public int revisePwd(User user) {
        return this.userMapper.revisePwd(user);
    }

    @Override
    public int onlineStatus(User user) {
        return this.userMapper.onlineStatus(user);
    }

    @Override
    public int updateRole(User user) {
        return this.userMapper.updateRole(user);
    }


    @Override
    public User checkUsername(String username) {
        return this.userMapper.checkUsername(username);
    }

    @Override
    public User retrievePwd(User user) {
        User users=this.userMapper.retrievePwd(user);
        if (users!=null){
            this.userMapper.revisePwd(user);
            return users;
        }
        return null;
    }

    @Override
    public int register(User user) {
        user.setRole_id(2);
        user.setRegister_time(Utils.getStringTime());
        return this.userMapper.register(user);
    }

    @Override
    public int deleteUser(int user_id) {
        return this.userMapper.deleteUser(user_id);
    }
}
