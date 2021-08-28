package com.team01.service;

import com.team01.domain.CustomerInfo;
import com.team01.domain.Page;

import java.util.List;

public interface ICustomerService {
    // 客户添加
    public int addCustomerInfo(CustomerInfo customerInfo);


    //  全部客户查询
    public List<CustomerInfo> queryAllCustomerInfo();

    //  客户查询（以客户模糊查询）
    public List<CustomerInfo> queryCustomerInfoByName(String customerName);

    //  产品查询（根据id进行查询）
    public CustomerInfo queryById(int customerId);

    //  客户删除
    public int deleteCustomerInfo(int customerId);

    //  分页查询
    public List<CustomerInfo> queryByCurrentPage(Page page);

    public CustomerInfo queryCustomerInfoByCheckName(String customerName);

    public int batchDeleteCustomerInfo(int[] customerId);

    public int updateConsumeTotal(int consumeTotal,int customerId);
}
