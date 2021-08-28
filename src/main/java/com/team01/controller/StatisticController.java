package com.team01.controller;


import com.team01.domain.Statistic;
import com.team01.service.ISatisticInfoService;
import com.team01.domain.typeAndTotalPrice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import java.util.List;

@Controller
public class StatisticController {
    @Resource(name = "statisticInfoService")
    private ISatisticInfoService satisticInfoService;


    @RequestMapping("datavs3")
    public String datavs3(Model model){
        List<Statistic> statistics=satisticInfoService.statisticByRentTotal();
        System.out.println(statistics.toString());
        model.addAttribute("statistics",statistics);
        return "barChart";
    }

    @RequestMapping("datavs4")
    public String datavs4(){
        return "datavs4";
    }


    @RequestMapping("pieChart")
    public String pieChart(Model model) {
        List<typeAndTotalPrice> list=satisticInfoService.selectTypeAndTotalPrice();
        System.out.println(list);
        return "pieChart";
    }

}
