package entity;

public class FileOperation {
    private int fileId;
    private int user_id;
    private String fileName;
    private String fileDescription;
    private String username;
    private String uploadTime;
    private int downloadAmount;
    private String path;

    public FileOperation() {
    }

    public FileOperation(int fileId, int user_id, String fileName, String fileDescription, String username, String uploadTime, int downloadAmount, String path) {
        this.fileId = fileId;
        this.user_id = user_id;
        this.fileName = fileName;
        this.fileDescription = fileDescription;
        this.username = username;
        this.uploadTime = uploadTime;
        this.downloadAmount = downloadAmount;
        this.path = path;
    }

    public int getFileId() {
        return fileId;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileDescription() {
        return fileDescription;
    }

    public void setFileDescription(String fileDescription) {
        this.fileDescription = fileDescription;
    }

    public String getUsername() {
        return username;
    }

    public void setFileUsername(String username) {
        this.username = username;
    }

    public String getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(String uploadTime) {
        this.uploadTime = uploadTime;
    }

    public int getDownloadAmount() {
        return downloadAmount;
    }

    public void setDownloadAmount(int downloadAmount) {
        this.downloadAmount = downloadAmount;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "FileOperation{" +
                "fileId='" + fileId + '\'' +
                ", fileName='" + fileName + '\'' +
                ", fileDescription='" + fileDescription + '\'' +
                ", username='" + username + '\'' +
                ", uploadTime=" + uploadTime +
                ", downloadAmount=" + downloadAmount +
                ", path='" + path + '\'' +
                '}';
    }
}
