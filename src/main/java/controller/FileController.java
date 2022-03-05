package controller;

import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.FileServiceImpl;
import service.LogService;
import utils.Utils;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/file")
public class FileController {
    private static Page page =new Page();
    private static List<FileOperation> fileList=new ArrayList<>();
    private static ResultMsg resultMsg=new ResultMsg();
    @Autowired
    @Qualifier("FileServiceImpl")
    private FileServiceImpl fileService;

    @RequestMapping("/mainFile")
    public String mainFile(Model model){
        fileList=fileService.fileInfo(null,1);
        page=fileService.pageFile(null,1);
        model.addAttribute("fileList",fileList);
        model.addAttribute("page",page);
        return "file";
    }
    @RequestMapping("/pageFile")
    public String pageFile(String keywords,Integer u_page,Model model){
        fileList=fileService.fileInfo(keywords,u_page);
        page=fileService.pageFile(keywords,u_page);
        model.addAttribute("fileList",fileList);
        model.addAttribute("keywords",keywords);
        model.addAttribute("page",page);
        return "file";
    }

    @RequestMapping("/uploadFile")
    public String uploadFile(){
        return "uploadFile";
    }
    @RequestMapping("/upload")
    public String upload(MultipartFile file, HttpServletRequest req,FileOperation fileOperation) throws IOException {
        String path = req.getSession().getServletContext().getRealPath("upload");
        String fileName = file.getOriginalFilename();
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        file.transferTo(dir);
        resultMsg.falseMsg();
        fileOperation.setUser_id(((User)req.getSession().getAttribute("user")).getUser_id());
        fileOperation.setPath(path);
        fileOperation.setFile_name(fileName);
        fileOperation.setUpload_time(Utils.getStringTime());
        fileService.fileUpload(fileOperation);
        return "uploadFile";
    }

    @RequestMapping("/download")
    public void download(HttpServletResponse resp,int file_id) throws Exception{
        FileOperation fileOperation=fileService.fileDownload(file_id);
        resp.setHeader("Content-disposition", "attachment;filename=" + new String(fileOperation.getFile_name().getBytes("UTF-8"), "ISO8859-1"));
        String filePath = fileOperation.getPath() + "\\" + fileOperation.getFile_name();
        FileInputStream file1 = new FileInputStream(filePath);
        int len;
        byte[] buffer = new byte[2048];
        ServletOutputStream out = resp.getOutputStream();
        while ((len = file1.read(buffer)) > 0) {
            out.write(buffer, 0, len);
        }
        file1.close();
        out.close();
    }
    @RequestMapping("/removeFile")
    @ResponseBody
    public String removeFile(@RequestBody FileOperation fileOperation,HttpServletRequest req){
        String filePath=req.getSession().getServletContext().getRealPath("upload")+"\\"+fileOperation.getFile_name();
        File file=new File(filePath);
        resultMsg.falseMsg();
        if (file.exists()&&file.delete()&&fileService.removeFile(fileOperation.getFile_id())!=0){
            resultMsg.trueMsg();
        }
        System.out.println(resultMsg.getMsg());
        return resultMsg.getMsg();
    }
}
