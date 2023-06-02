package service;

import dao.FileMapper;
import entity.FileOperation;
import entity.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class FileServiceImpl implements FileService{
    @Autowired
    private FileMapper fileMapper;
//    public void setFileMapper(FileMapper fileMapper){
//        this.fileMapper=fileMapper;
//    }
    @Override
    public List<FileOperation> fileInfo(String keywords, Integer nowPage) {
        Map<String,Object> map=new HashMap<>();
        map.put("keywords",keywords);
        map.put("showRow",(nowPage-1)*10);
        return this.fileMapper.fileInfo(map);
    }
    @Override
    public int fileUpload(FileOperation fileOperation) {
        return this.fileMapper.fileUpload(fileOperation);
    }

    @Override
    public FileOperation fileDownload(int file_id) {
        FileOperation fileOperation=this.fileMapper.fileDownload(file_id);
        if (fileOperation!=null){
            downloadAmount(file_id);
        }
        return fileOperation;
    }

    @Override
    public int removeFile(int file_id) {
        return this.fileMapper.removeFile(file_id);
    }

    @Override
    public int downloadAmount(int file_id) {
        return this.fileMapper.downloadAmount(file_id);
    }



    @Override
    public Page pageFile(String keywords, Integer nowPage) {
        Page page=new Page();
        page.setCountRow(this.fileMapper.sumRow(keywords));
        page.amountPage();
        page.setNowPage(nowPage);
        return page;
    }
}
