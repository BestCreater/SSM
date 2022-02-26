package dao;

import entity.FileOperation;
import entity.Page;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

public interface FileMapper {
    int fileUpload(Connection connection, FileOperation fileOperation) throws SQLException, ParseException;

    FileOperation fileDownload(Connection connection, int fileId) throws SQLException;

    int removeFile(Connection connection, int fileId) throws SQLException;

    int downloadAmount(Connection connection, int fileId) throws SQLException;

    List<FileOperation> allFile(Connection connection, String userIn, Page page) throws SQLException;

    Page sumRow(Connection connection, String userIn, Page page) throws SQLException;
}
