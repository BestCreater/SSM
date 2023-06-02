package dao;

import entity.LogLogin;
import entity.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Mapper
@Repository
public interface LogMapper {
    List<LogLogin> logInfo(@Param("map") Map<String,Object> map);
    int addLogLogin(LogLogin sysLogLogin);
    Integer sumRow(@Param("keywords")String keywords);

}
