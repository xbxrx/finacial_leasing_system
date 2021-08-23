package com.team01.service;

import com.team01.domain.OrderInfo;

import java.util.List;

public interface IOrderInfoService {

    public List<OrderInfo> queryAllOrderInfo();

    public List<OrderInfo> queryByOrderName(String productName);

    public List<OrderInfo> queryInvalidOrder();

    public int addOrderInfo(OrderInfo orderInfo);

    public int deleteOrderInfo(int orderId);


}
