package com.team01.controller;

import com.team01.domain.OrderInfo;
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

//    @RequestMapping("/")
//    public String getIndex() {
//        System.out.println("index123123----------");
//        return "index";
//    }
    @RequestMapping("toOrderInfo")
    public String toOrderInfo(Model model){
        List<OrderInfo> orderInfos=orderInfoService.queryAllOrderInfo();
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
        List<OrderInfo> orderInfos=orderInfoService.queryAllOrderInfo();
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
        List<OrderInfo> orderInfos=orderInfoService.queryAllOrderInfo();
        model.addAttribute("orderInfos",orderInfos);
        return "orderInfo";
    }

}

//@RequestMapping("addOrderInfo")
//    public String addInfo(){
//        OrderInfo orderInfo=new OrderInfo(5,5,"人工服务","先生","2012-7-9","2014-7-19",567);
//        System.out.println("operation="+orderInfoService.addOrderInfo(orderInfo));
//        return "login";
//    }
//
//    @RequestMapping("queryAllInfo")
//    public String queryInfo(){
//        List<OrderInfo> orderInfos=orderInfoService.queryAllOrderInfo();
//        System.out.println(orderInfos.toString());
//        return "login";
//    }
//
//    @RequestMapping("queryByOrderName")
//    public String queryByName(){
//        List<OrderInfo> orderInfos=orderInfoService.queryByOrderName("人工智能");
//        System.out.println(orderInfos.toString());
//        return "login";
//    }
//
//    @RequestMapping("queryInvalidOrder")
//    public String queryInvalidOrder(){
//        List<OrderInfo> orderInfos=orderInfoService.queryInvalidOrder();
//        System.out.println(orderInfos.toString());
//        return "login";
//    }
//
//    @RequestMapping("deleteOrderInfo")
//    public String deleteInfo(){
//        int operation=orderInfoService.deleteOrderInfo(1);
//        System.out.println("operation="+operation);
//        return "login";
//    }
//