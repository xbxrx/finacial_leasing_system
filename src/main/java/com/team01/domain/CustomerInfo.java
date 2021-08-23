package com.team01.domain;

import java.util.Date;

public class CustomerInfo {
    private int customerId;
    private String customerName;
    private String customerPassword;
    private String customerPhone;
    private String customerMail;
    private String createTime;
    private int consumeTotal;


    public CustomerInfo() {
    }

    @Override
    public String toString() {
        return "CustomerInfo{" +
                "customerId=" + customerId +
                ", customerName='" + customerName + '\'' +
                ", customerPassword='" + customerPassword + '\'' +
                ", customerPhone='" + customerPhone + '\'' +
                ", customerMail='" + customerMail + '\'' +
                ", createTime='" + createTime + '\'' +
                ", consumeTotal=" + consumeTotal +
                '}';
    }

    public CustomerInfo(int customerId, String customerName, String customerPassword, String customerPhone, String customerMail, String createTime, int consumeTotal) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.customerPassword = customerPassword;
        this.customerPhone = customerPhone;
        this.customerMail = customerMail;
        this.createTime = createTime;
        this.consumeTotal = consumeTotal;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerMail() {
        return customerMail;
    }

    public void setCustomerMail(String customerMail) {
        this.customerMail = customerMail;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public int getConsumeTotal() {
        return consumeTotal;
    }

    public void setConsumeTotal(int consumeTotal) {
        this.consumeTotal = consumeTotal;
    }
}
