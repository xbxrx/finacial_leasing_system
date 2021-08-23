package com.team01.domain;

public class OrderInfo {
    private int orderId;
    private int productId;
    private int customerId;
    private String productName;
    private String customerName;
    private String startTime;
    private String endTime;
    private int rentTotal;
    public OrderInfo(){

    }

    public OrderInfo(int productId,int customerId,String productName,String customerName,String startTime,String endTime,int rentTotal){
        this.productId=productId;
        this.customerId=customerId;
        this.productName=productName;
        this.startTime=startTime;
        this.endTime=endTime;
        this.customerName=customerName;
        this.rentTotal=rentTotal;
    }
    public String getStartTime() {
        return startTime;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getRentTotal() {
        return rentTotal;
    }

    public void setRentTotal(int rentTotal) {
        this.rentTotal = rentTotal;
    }

    @Override
    public String toString() {
        return "OrderInfo{" +
                "orderId=" + orderId +
                ", productId=" + productId +
                ", customerId=" + customerId +
                ", productName='" + productName + '\'' +
                ", customerName='" + customerName + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", rentTotal=" + rentTotal +
                '}';
    }
}
