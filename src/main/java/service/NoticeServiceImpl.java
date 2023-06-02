package service;

import dao.NoticeMapper;
import dao.UserMapper;
import entity.Notice;
import entity.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.Utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeMapper noticeMapper;


//    public void setNoticeMapper(NoticeMapper noticeMapper) {
//        this.noticeMapper = noticeMapper;
//    }
    @Override
    public List<Notice> noticeInfo(String keywords, Integer nowPage) {
        Map<String,Object> map=new HashMap<>();
        map.put("keywords",keywords);
        map.put("showRow",(nowPage-1)*10);
        return this.noticeMapper.noticeInfo(map);
    }

    @Override
    public Page pageNotice(String keywords, Integer nowPage) {
        Page page=new Page();
        page.setCountRow(this.noticeMapper.sumRow(keywords));
        page.amountPage();
        page.setNowPage(nowPage);
        return page;
    }

    @Override
    public int addNotice(Notice notice) {
        notice.setBegin_time(Utils.transGMT(notice.getBegin_time()));
        notice.setEnd_time(Utils.transGMT(notice.getEnd_time()));
        return this.noticeMapper.addNotice(notice);
    }

    @Override
    public int deleteNotice(int id) {
        return this.noticeMapper.deleteNotice(id);
    }
}
