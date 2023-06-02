package dao;

import entity.Notice;
import entity.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Mapper
@Repository
public interface NoticeMapper {
    List<Notice> noticeInfo(@Param("map") Map<String,Object> map);
    Integer sumRow(@Param("keywords") String keywords);
    int addNotice(Notice notice);
    int deleteNotice(@Param("id") int id);

}
