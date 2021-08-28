package com.team01.dao;


import com.team01.domain.OrderInfo;
import com.team01.domain.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface IOrderInfoDao {

    public List<OrderInfo> queryAllOrderInfo();

    public List<OrderInfo> queryByOrderName(String productName);

    public List<OrderInfo> queryInvalidOrder();

    public int addOrderInfo(OrderInfo orderInfo);

    public int deleteOrderInfo(int orderId);

    public List<OrderInfo> queryByCurrentPage(@Param("page")Page page);

    public int getTotalMonth();

    public int getConsumeTotal(int customerId);


}
