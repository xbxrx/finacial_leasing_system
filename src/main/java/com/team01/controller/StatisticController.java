package com.team01.controller;


import com.team01.domain.typeAndTotalPrice;
import com.team01.service.ISatisticInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class StatisticController {
    @Resource(name = "statisticService")
    ISatisticInfoService statisticService;


    @RequestMapping("datavs3")
    public String datavs3(){
        return "datavs3";
    }

    @RequestMapping("datavs4")
    public String datavs4(){
        return "datavs4";
    }


    @RequestMapping("pieChart")
    public String pieChart(Model model) {

       List<typeAndTotalPrice> list=statisticService.selectTypeAndTotalPrice();
        System.out.println(list);
        return "pieChart";
    }

}
