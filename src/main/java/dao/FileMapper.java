package dao;

import entity.FileOperation;
import org.apache.ibatis.annotations.Param;


import java.util.List;
import java.util.Map;

public interface FileMapper {
    int fileUpload(FileOperation fileOperation);
    int removeFile(@Param("file_id")int file_id);
    int downloadAmount(@Param("file_id")int file_id);
    FileOperation fileDownload(@Param("file_id")int file_id);
    List<FileOperation> fileInfo(@Param("map") Map<String,Object> map);
    Integer sumRow(@Param("keywords") String keywords);
}
