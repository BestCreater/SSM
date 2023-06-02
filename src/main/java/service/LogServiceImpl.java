package service;

import dao.LogMapper;
import dao.UserMapper;
import entity.LogLogin;
import entity.Page;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LogServiceImpl implements LogService{
    @Autowired
    private LogMapper logMapper;
//    public void setLogMapper(LogMapper logMapper) {
//        this.logMapper=logMapper;
//    }
    @Override
    public List<LogLogin> logInfo(String keywords, Integer nowPage) {
        Map<String,Object> map=new HashMap<>();
        map.put("keywords",keywords);
        map.put("showRow",(nowPage-1)*10);
        return this.logMapper.logInfo(map);
    }

    @Override
    public int addLogLogin(LogLogin logLogin) {
        if ("0:0:0:0:0:0:0:1".equals(logLogin.getIp_address())){
            logLogin.setIp_address("127.0.0.1");
        }
        return this.logMapper.addLogLogin(logLogin);
    }

    @Override
    public Page pageLog(String keywords, Integer nowPage) {
        Page page=new Page();
        page.setCountRow(this.logMapper.sumRow(keywords));
        page.amountPage();
        page.setNowPage(nowPage);
        return page;
    }
}
