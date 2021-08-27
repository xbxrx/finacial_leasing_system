package com.team01.controller;

import com.team01.domain.OrderInfo;
import com.team01.domain.Page;
import com.team01.service.IOrderInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class OrderController {

    @Resource(name = "orderInfoService")
    private IOrderInfoService orderInfoService;

    @RequestMapping("toOrderInfo")
    public String toOrderInfo(Model model,int currentPage){
        List<OrderInfo> orderInfos=orderInfoService.queryByCurrentPage(new Page(currentPage,7));
        model.addAttribute("orderInfos",orderInfos);
        return "orderInfo";
    }

    @RequestMapping("toInvalidOrderInfo")
    public String toInvalid(Model model){
        List<OrderInfo> orderInfos=orderInfoService.queryInvalidOrder();
        model.addAttribute("orderInfos",orderInfos);
        return "invalidOrderInfo";
    }

    @RequestMapping("toQueryOrder")
    public String toQueryOrder(Model model,String productName){
        List<OrderInfo> orderInfos=orderInfoService.queryByOrderName(productName);
        model.addAttribute("orderInfos",orderInfos);
        return "orderInfo";
    }

    @RequestMapping("toDeleteOrder")
    public String deleteOrder(int orderId,Model model){
        orderInfoService.deleteOrderInfo(orderId);
        List<OrderInfo> orderInfos=orderInfoService.queryByCurrentPage(new Page(1,7));
        model.addAttribute("orderInfos",orderInfos);
        return "orderInfo";
    }

    @RequestMapping("toAddOrder")
    public String doAddOrder(){
        return "addOrder";
    }

    @RequestMapping("toAddResult")
    public String addOrder(int productId,int customerId,String productName,String customerName,String startTime,
    String endTime,int rentTotal,Model model){
        OrderInfo orderInfo=new OrderInfo(productId,customerId,productName,customerName,startTime,endTime,rentTotal);
        orderInfoService.addOrderInfo(orderInfo);
        List<OrderInfo> orderInfos=orderInfoService.queryByCurrentPage(new Page(1,7));
        model.addAttribute("orderInfos",orderInfos);
        return "orderInfo";
    }



}
