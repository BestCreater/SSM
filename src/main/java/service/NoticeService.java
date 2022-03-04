package service;

import entity.Notice;
import entity.Page;

import java.util.List;

public interface NoticeService {
    List<Notice> noticeInfo(String keywords, Integer nowPage);
    Page pageNotice(String keywords, Integer nowPage);
    int addNotice(Notice notice);
    int deleteNotice(int id);
}
