package dao;

import entity.Notice;
import entity.Page;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

public interface NoticeMapper {
    public List<Notice> allNotice(Connection connection, String userIn, Page page) throws SQLException;

    public Page sumRow(Connection connection, String userIn, Page page) throws SQLException;

    public int addNotice(Connection connection, Notice notice) throws SQLException, ParseException;

    int removeNotice(Connection connection, int id) throws SQLException;

}
