package com.team01.dao;

import com.team01.domain.ProductInfo;

import java.util.List;

public interface IProductInfoDao {

    // 产品添加
    public int addProductInfo(ProductInfo productInfo);

    // 产品删除
    public int deleteProductInfo(int productId);

    //  产品更新
    public int updateProductInfo(ProductInfo productInfo);

    //  全部产品查询
    public List<ProductInfo> queryAllProductInfo();

    //  产品查询（以商品名模糊查询）
    public List<ProductInfo> queryProductInfo(String productName);

    //  产品查询（根据id进行查询）
    public ProductInfo queryById(int productId);



}
