package com.team01.domain;

public class Statistic {
    private String productName;
    private int rentTotal;


    public Statistic(){

    }

    public void setRentTotal(int rentTotal) {
        this.rentTotal = rentTotal;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Statistic(String productName,int rentTotal) {
        this.productName = productName;
        this.rentTotal = rentTotal;
    }

    public int getRentTotal() {
        return rentTotal;
    }

    public String getProductName() {
        return productName;
    }

    @Override
    public String toString() {
        return "Statistic{" +
                "productName='" + productName + '\'' +
                ", rentTotal=" + rentTotal +
                '}';
    }
}
