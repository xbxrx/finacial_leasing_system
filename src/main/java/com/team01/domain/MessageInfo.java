package com.team01.domain;

public class MessageInfo {
    private int messageId;
    private String messageTitle;
    private String authorName;
    private String publishTime;
    private String productContent;
    private String img;

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }


    public MessageInfo(){

    }

    public MessageInfo(String messageTitle, String authorName,String productContent,String img) {
        this.messageTitle = messageTitle;
        this.authorName = authorName;
        this.productContent = productContent;
        this.img = img;
    }

    public String getMessageTitle() {
        return messageTitle;
    }

    public void setMessageTitle(String messageTitle) {
        this.messageTitle = messageTitle;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    public String getProductContent() {
        return productContent;
    }

    public void setProductContent(String productContent) {
        this.productContent = productContent;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }
}
