package com.team01.controller;


import com.sun.org.apache.xpath.internal.operations.Mod;
import com.team01.domain.ProductInfo;
import com.team01.service.IProductInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.jws.WebParam;
import java.util.List;
@Controller

public class ProductInfoController {
    @Resource(name = "productInfoService")
    IProductInfoService productInfoService;

    @RequestMapping("performance")
    public String performance(){
        return "performance";
    }

    @RequestMapping("datavs3")
    public String datavs3(){
        return "datavs3";
    }

    @RequestMapping("datavs4")
    public String datavs4(){
        return "datavs4";
    }

    @RequestMapping("datavs2")
    public String datavs2(){
        return "datavs2";
    }

    /**
     *
     产品信息页面控制器
     */
    @RequestMapping("productManager")
    public String productManager(Model model){

        List<ProductInfo> list=productInfoService.queryAllProductInfo();
        model.addAttribute("ProductInfoList",list);
        return "productInfo";
    }


    /**
     *
     *删除信息控制器
     */
    @RequestMapping("deleteProductInfo")
    public String deleteProductInfo(int productId, Model model){
       ProductInfo productInfo= productInfoService.queryById(productId);
        int i=productInfoService.deleteProductInfo(productId);
        if(i>0){
            model.addAttribute("Message", productInfo.getProductName()+"产品删除成功!");
        }
        else{
            model.addAttribute("Message"+productInfo.getProductName()+"产品删除失败");
        }
        List<ProductInfo> list=productInfoService.queryAllProductInfo();
        model.addAttribute("ProductInfoList",list);
        return "productInfo";
    }
    @RequestMapping("updateProductInfo")
    public String updateProductInfo(int productId,Model model){
        ProductInfo productInfo=productInfoService.queryById(productId);
        model.addAttribute("ProductInfo",productInfo);
        return "updateProductInfo";
    }
    @RequestMapping("resultUpdateProductInfo")
    public String resultUpdateProductInfo(int productId,String productName,String productStatus,String productType,String introduceContent,int productPrice,Model model){
        ProductInfo productInfo=new ProductInfo();
        productInfo.setProductId(productId);
        productInfo.setProductName(productName);
        productInfo.setProductStatus(productStatus);
        productInfo.setProductType(productType);
        productInfo.setProductPrice(productPrice);
        productInfo.setIntroduceContent(introduceContent);
        int i= productInfoService.updateProductInfo(productInfo);

        if (i>0){
            model.addAttribute("Message",productName+"产品更新成功");
        }
        else{
            model.addAttribute("Message",productName+"产品更新失败！");
        }
        List<ProductInfo> list=productInfoService.queryAllProductInfo();
        model.addAttribute("ProductInfoList",list);
        return "productInfo";

    }

    /**
     *
     添加页面跳转控制
     */
    @RequestMapping("addProductInfo")
    public String addProductInfo(){
        return "addProduct";
    }

    /**
     *
     *添加结果控制器
     */
    @RequestMapping("resultAddProductInfo")
    public String resultAddProductInfo(String productName,String productStatus,String productType,String introduceContent,int productPrice,Model model){
        ProductInfo productInfo=new ProductInfo();
        productInfo.setProductName(productName);
        productInfo.setProductStatus(productStatus);
        productInfo.setProductType(productType);
        productInfo.setProductPrice(productPrice);
        productInfo.setIntroduceContent(introduceContent);

        ProductInfo productInfoCheck=productInfoService.queryByProductName(productName);

        if (productInfoCheck==null){
            int i=productInfoService.addProductInfo(productInfo);
            if(i>0){
                model.addAttribute("Message",productName+"添加成功");
            }else{
                model.addAttribute("Message",productName+"添加失败");
            }
              }
        else {
            model.addAttribute("Message",productName+"产品存在！无法添加!");
        }
        List<ProductInfo> list=productInfoService.queryAllProductInfo();
        model.addAttribute("ProductInfoList",list);
        return "productInfo";
            }


    @RequestMapping("queryProductInfo")
    public String queryProductInfo(String productName,Model model){

        List<ProductInfo> list=productInfoService.queryProductInfo(productName);
//        int length=list.size();
//        model.addAttribute("length",length);
        if ("".equals(productName))
            model.addAttribute("Message","请输入关键字!");
        model.addAttribute("ProductInfoList",list);

        return "productInfo";
    }

    @RequestMapping("toQueryByProductId")
    public String queryByProductId(int productId,Model model){
        ProductInfo productInfo=productInfoService.queryById(productId);
        model.addAttribute("productInfo",productInfo);
        return "product";
    }


    @RequestMapping("queryAllProductInfoByDesc")
    public String queryAllProductInfoByDesc(Model model){

        List<ProductInfo> list=productInfoService.queryAllProductInfoByDesc();
        model.addAttribute("ProductInfoList",list);
        return "productInfo";
    }

    @RequestMapping("queryAllProductInfoByAsc")
    public String queryAllProductInfoByAsc(Model model){

        List<ProductInfo> list=productInfoService.queryAllProductInfoByAsc();
        model.addAttribute("ProductInfoList",list);
        return "productInfo";
    }

    @RequestMapping("deleteSelectedProductInfo")
    public String  deleteSelectedProductInfo(@RequestParam(name="ids")int[] productId, Model model){



        int count=productInfoService.batchDelete(productId);

        List<ProductInfo> list=productInfoService.queryAllProductInfo();
        model.addAttribute("ProductInfoList",list);
        model.addAttribute("Message","已删除"+count+"条信息");
        return "productInfo";

    }


}


