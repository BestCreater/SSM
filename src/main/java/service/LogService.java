package service;

import entity.LogLogin;
import entity.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public interface LogService {
    List<LogLogin> logInfo(String keywords, Integer nowPage);
    int addLogLogin(LogLogin LogLogin);
    Page pageLog(String keywords, Integer nowPage);

}
