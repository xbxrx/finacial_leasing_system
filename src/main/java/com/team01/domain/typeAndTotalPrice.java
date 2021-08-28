package com.team01.domain;

public class typeAndTotalPrice {
    private String productType;
    private int rentTotal;


    public typeAndTotalPrice() {
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public int getRentTotal() {
        return rentTotal;
    }

    public void setRentTotal(int rentTotal) {
        this.rentTotal = rentTotal;
    }

    public typeAndTotalPrice(String productType, int rentTotal) {
        this.productType = productType;
        this.rentTotal = rentTotal;
    }

    @Override
    public String toString() {
        return "typeAndTotalPrice{" +
                "productType='" + productType + '\'' +
                ", rentTotal=" + rentTotal +
                '}';
    }
}
