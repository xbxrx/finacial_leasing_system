package com.team01.controller;

import com.team01.Utils.DateFormatUtils;
import com.team01.domain.CustomerInfo;
import com.team01.domain.OrderInfo;
import com.team01.domain.Page;
import com.team01.domain.ProductInfo;
import com.team01.service.ICustomerService;
import com.team01.service.IOrderInfoService;
import com.team01.service.IProductInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.annotation.Resource;
import java.util.List;

@Controller
public class OrderController {

    @Resource(name = "productInfoService")
    IProductInfoService productInfoService;

    @Resource(name = "orderInfoService")
    private IOrderInfoService orderInfoService;

    @Resource(name="customerService")
    ICustomerService customerService;

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

        if("".equals(productName)){
            model.addAttribute("Message","请输入关键字！");
        }
        List<OrderInfo> orderInfos=orderInfoService.queryByOrderName(productName);
        model.addAttribute("orderInfos",orderInfos);
        return "orderInfo";
    }

    @RequestMapping("toDeleteOrder")
    public String deleteOrder(int orderId,Model model){
       int i= orderInfoService.deleteOrderInfo(orderId);
       if (i>0){
           model.addAttribute("Message","编号为"+orderId+"订单删除成功!");
       }
        List<OrderInfo> orderInfos=orderInfoService.queryByCurrentPage(new Page(1,7));
        model.addAttribute("orderInfos",orderInfos);
        return "orderInfo";
    }

    @RequestMapping("toAddOrder")
    public String doAddOrder(Model model){
        List<ProductInfo> productInfos= productInfoService.queryAllProductInfo();
        System.out.println(productInfos);
        model.addAttribute("ProductInfos",productInfos);
        return "addOrder";
    }

    @RequestMapping("toAddResult")
    public String addOrder(String customerName,String productName,String startTime, String endTime,Model model){
        CustomerInfo customerInfo=customerService.queryCustomerInfoByCheckName(customerName);
        if (customerInfo==null) {
            model.addAttribute("Message", "不存在该用户！");
        }
        ProductInfo productInfo=productInfoService.queryByProductName(productName);
        try {
            int month= DateFormatUtils.getMonthSpace(startTime,endTime);
            int rentTotal=month*(productInfo.getProductPrice());
            OrderInfo orderInfo=new OrderInfo(productInfo.getProductId(),customerInfo.getCustomerId(),productName,customerName
                    ,startTime,endTime,rentTotal);
            int i=orderInfoService.addOrderInfo(orderInfo);
            if(i>0)
                model.addAttribute ("Message","一条订单添加成功！");
            int consumeTotal=orderInfoService.getConsumeTotal(customerInfo.getCustomerId());
            customerService.updateConsumeTotal(consumeTotal,customerInfo.getCustomerId());
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<OrderInfo> orderInfos=orderInfoService.queryByCurrentPage(new Page(1,7));
        model.addAttribute("orderInfos",orderInfos);
        return "orderInfo";
    }

    @RequestMapping("deleteSelectedInvalidOrderInfo")
    public String deleteSelectedInvalidOrderInfo(@RequestParam(name = "ids") int [] orderId, Model model){
        int count=orderInfoService.batchDeleteOrderInfo(orderId);
        List<OrderInfo> list=orderInfoService.queryAllOrderInfo();
        model.addAttribute("Message","删除了"+count+"条记录");
        List<OrderInfo> orderInfos=orderInfoService.queryAllOrderInfo();
        model.addAttribute("orderInfos",orderInfos);
        return "invalidOrderInfo";
    }





}
