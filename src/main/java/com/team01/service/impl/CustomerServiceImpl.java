package com.team01.service.impl;

import com.team01.dao.ICustomerInfoDao;
import com.team01.domain.CustomerInfo;
import com.team01.domain.Page;
import com.team01.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Service("customerService")
public class CustomerServiceImpl implements ICustomerService {

    @Autowired
    ICustomerInfoDao iCustomerInfoDao;

    @Override
    public int addCustomerInfo(CustomerInfo customerInfo) {
        return iCustomerInfoDao.addCustomerInfo(customerInfo);
    }


    @Override
    public List<CustomerInfo> queryAllCustomerInfo() {
        return iCustomerInfoDao.queryAllCustomerInfo();
    }

    @Override
    public List<CustomerInfo> queryCustomerInfoByName(String customerName) {
        return iCustomerInfoDao.queryCustomerInfoByName(customerName);
    }

    @Override
    public CustomerInfo queryById(int customerId) {
        return iCustomerInfoDao.queryById(customerId);
    }

    @Override
    public int deleteCustomerInfo(int customerId) {
       return iCustomerInfoDao.deleteCustomerInfo(customerId);
    }

    @Override
    public List<CustomerInfo> queryByCurrentPage(Page page) {
        return iCustomerInfoDao.queryByCurrentPage(page);
    }

    @Override
    public CustomerInfo queryCustomerInfoByCheckName(String customerName) {
        return iCustomerInfoDao.queryCustomerInfoByCheckName(customerName);
    }

    @Override
    public int batchDeleteCustomerInfo(int[] customerId) {
        int count=0;
        for(int id:customerId){
            iCustomerInfoDao.deleteCustomerInfo(id);
            count++;
        }
        return count;
    }
}
