package service;

import entity.FileOperation;
import entity.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface FileService {
    int fileUpload(FileOperation fileOperation);
    FileOperation fileDownload(int file_id);
    int removeFile(int file_id);
    int downloadAmount(int file_id);
    List<FileOperation> fileInfo(String keywords,Integer nowPage);
    Page pageFile(String keywords,Integer nowPage);
}
