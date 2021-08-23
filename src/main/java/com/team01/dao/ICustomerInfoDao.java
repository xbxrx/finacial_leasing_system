package com.team01.dao;

import com.team01.domain.CustomerInfo;


import java.util.List;

public interface ICustomerInfoDao {

    // 客户添加
    public int addCustomerInfo(CustomerInfo customerInfo);

    //  全部客户查询
    public List<CustomerInfo> queryAllCustomerInfo();

    //  客户查询（以客户模糊查询）
    public List<CustomerInfo> queryCustomerInfoByName(String customerName);

    //  客户查询（根据id进行查询）
    public CustomerInfo queryById(int customerId);

    //  客户删除
    public int deleteCustomerInfo(int customerId);



}
