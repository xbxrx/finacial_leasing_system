package com.team01.domain;

public class ProductInfo {
    private int productId;
    private String productName;
    private String productStatus;
    private  String productType;
    private  int productPrice;

    @Override
    public String toString() {
        return "ProductInfo{" +
                "ProductId=" + productId +
                ", ProductName='" + productName + '\'' +
                ", ProductStatus='" + productStatus + '\'' +
                ", ProductType='" + productType + '\'' +
                ", ProductPrice=" + productPrice +
                '}';
    }

    public ProductInfo() {
    }

    public ProductInfo(String productName, String productStatus, String productType, int productPrice) {
        this.productName = productName;
        this.productStatus = productStatus;
        this.productType = productType;
        this.productPrice = productPrice;
    }

    public ProductInfo(int productId, String productName, String productStatus, String productType, int productPrice) {
        this.productId = productId;
        this.productName = productName;
        this.productStatus = productStatus;
        this.productType = productType;
        this.productPrice = productPrice;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }
}
