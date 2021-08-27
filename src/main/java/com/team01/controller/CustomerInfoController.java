package com.team01.controller;


import com.sun.org.apache.xpath.internal.operations.Mod;
import com.team01.domain.CustomerInfo;
import com.team01.domain.Page;
import com.team01.service.ICustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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



        CustomerInfo customerInfoCheck=customerService.queryCustomerInfoByCheckName(customerName);
        if(customerInfoCheck==null) {
            int i = customerService.addCustomerInfo(customerInfo);
            if (i > 0) {
                model.addAttribute("Message", "客户" + customerName + "信息添加成功");
            } else {
                model.addAttribute("Message", "客户" + customerName + "信息添加失败");
            }
        }else
        {
            model.addAttribute("Message","客户"+customerName+"信息存在");
        }
        List<CustomerInfo> list = customerService.queryByCurrentPage(new Page(1,7));
        model.addAttribute("CustomerInfoList", list);
        return "customerInfo";
    }

    @RequestMapping("queryCustomerInfoByName")
    public String queryCustomerInfoByName(String customerName, Model model) {

        List<CustomerInfo> list = customerService.queryCustomerInfoByName(customerName);
        model.addAttribute("CustomerInfoList", list);
        return "customerInfo";
    }

    @RequestMapping("deleteCustomerInfo")
    public String deleteCustomerInfo(int customerId,String customerName, Model model) {

        int i = customerService.deleteCustomerInfo(customerId);
//        List<CustomerInfo> list = customerService.queryAllCustomerInfo();
        List<CustomerInfo> list=customerService.queryByCurrentPage(new Page(1,7));
        model.addAttribute("CustomerInfoList", list);
        if (i > 0) {
           model.addAttribute("Message","编号为"+customerId+"客户删除成功");
        }
        return "customerInfo";
    }

    @RequestMapping("deleteSelectedCustomerInfo")
    public String deleteSelectedCustomerInfo(@RequestParam(name = "ids") int[] customerId, Model model) {

        int count = customerService.batchDeleteCustomerInfo(customerId);
        //List<CustomerInfo> list = customerService.queryAllCustomerInfo();
        List<CustomerInfo> list=customerService.queryByCurrentPage(new Page(1,7));
        model.addAttribute("CustomerInfoList", list);
        model.addAttribute("Message","已成功删除"+count+"条客户信息!");
        return "customerInfo";
    }
}
