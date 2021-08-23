package com.team01.service.impl;

import com.team01.dao.IProductInfoDao;
import com.team01.domain.ProductInfo;
import com.team01.service.IProductInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productInfoService")
public class ProductInfoServiceImpl implements IProductInfoService {

    @Autowired
    IProductInfoDao iProductInfoDao;

    @Override
    public int addProductInfo(ProductInfo productInfo) {
        return iProductInfoDao.addProductInfo(productInfo);
    }

    @Override
    public int deleteProductInfo(int productId) {
        return iProductInfoDao.deleteProductInfo(productId);
    }

    @Override
    public int updateProductInfo(ProductInfo productInfo) {
        return iProductInfoDao.updateProductInfo(productInfo);
    }

    @Override
    public List<ProductInfo> queryAllProductInfo() {
       return iProductInfoDao.queryAllProductInfo();
    }

    @Override
    public List<ProductInfo> queryProductInfo(String productName) {
        return iProductInfoDao.queryProductInfo(productName);
    }

    @Override
    public ProductInfo queryById(int productId) {
        return iProductInfoDao.queryById(productId);
    }
}
