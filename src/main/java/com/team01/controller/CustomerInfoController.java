package com.team01.controller;


import com.team01.domain.CustomerInfo;
import com.team01.domain.Page;
import com.team01.service.ICustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller

public class CustomerInfoController {
    @Resource(name="customerService")
    ICustomerService customerService;

    @RequestMapping("CustomerManager")
    public String CustomerManager(Model model,int currentPage){
        //List<CustomerInfo> list=customerService.queryAllCustomerInfo();
        List<CustomerInfo> list=customerService.queryByCurrentPage(new Page(currentPage,7));
        model.addAttribute("CustomerInfoList",list);
        return "customerInfo";

    }

    @RequestMapping("updateCustomerInfo")
    public String updateCustomerInfo(int customerId,Model model){

        CustomerInfo customerInfo= customerService.queryById(customerId);
        model.addAttribute("CustomerInfo",customerInfo);
        return "updateCustomerInfo";

    }

    @RequestMapping("addCustomerInfo")
    public String addCustomerInfo(){
        return "addCustomer";
    }

    @RequestMapping("resultAddCustomerInfo")
    public String resultAddCustomerInfo(String customerName,String customerPassword,String customerPhone,String customerMail,int consumeTotal,Model model){
        CustomerInfo customerInfo=new CustomerInfo();
        customerInfo.setCustomerName(customerName);
        customerInfo.setCustomerPassword(customerPassword);
        customerInfo.setCustomerPhone(customerPhone);
        customerInfo.setCustomerMail(customerMail);
        customerInfo.setConsumeTotal(consumeTotal);

        int i=customerService.addCustomerInfo(customerInfo);
        if(i>0){
            List<CustomerInfo> list=customerService.queryByCurrentPage(new Page(1,7));
            model.addAttribute("CustomerInfoList",list);
            return "customerInfo";
        }
        return "error";
    }

    @RequestMapping("queryCustomerInfoByName")
    public String queryCustomerInfoByName(String customerName,Model model){
        List<CustomerInfo> list= customerService.queryCustomerInfoByName(customerName);
        model.addAttribute("CustomerInfoList",list);
        return "customerInfo";
    }

    @RequestMapping("deleteCustomerInfo")
    public String deleteCustomerInfo(int customerId,Model model){

        int i=customerService.deleteCustomerInfo(customerId);
        if(i>0)
        {
            List<CustomerInfo> list=customerService.queryByCurrentPage(new Page(1,7));
            model.addAttribute("CustomerInfoList",list);
            return "customerInfo";
        }
        return "error";
    }

}
