package entity;

import java.io.Serializable;
import java.util.Date;

public class Notice implements Serializable {
    private int id;
    private int user_id;
    private String username;
    private String title;
    private String content;
    private Date beganTime;
    private Date endTime;
    private Date publishTime;

    public Notice() {
    }

    public Notice(int id, int user_id, String username, String title, String content, Date beganTime, Date endTime, Date publishTime) {
        this.id = id;
        this.user_id = user_id;
        this.username = username;
        this.title = title;
        this.content = content;
        this.beganTime = beganTime;
        this.endTime = endTime;
        this.publishTime = publishTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getBeganTime() {
        return beganTime;
    }

    public void setBeganTime(Date beganTime) {
        this.beganTime = beganTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "username='" + username + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", beganTime=" + beganTime +
                ", endTime=" + endTime +
                ", publishTime=" + publishTime +
                '}';
    }
}
