package com.team01.service.impl;

import com.team01.dao.IOrderInfoDao;
import com.team01.domain.OrderInfo;
import com.team01.service.IOrderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("orderInfoService")
public class OrderInfoServiceImp implements IOrderInfoService {

    @Autowired
    IOrderInfoDao iOrderInfoDao;

    @Override
    public List<OrderInfo> queryAllOrderInfo() {
        return iOrderInfoDao.queryAllOrderInfo();

    }

    @Override
    public List<OrderInfo> queryByOrderName(String productName) {
        return iOrderInfoDao.queryByOrderName(productName);
    }

    @Override
    public List<OrderInfo> queryInvalidOrder() {
        return iOrderInfoDao.queryInvalidOrder();
    }


    @Override
    public int addOrderInfo(OrderInfo orderInfo) {
        return iOrderInfoDao.addOrderInfo(orderInfo);
    }

    @Override
    public int deleteOrderInfo(int orderId) {
        return iOrderInfoDao.deleteOrderInfo(orderId);
    }

}
