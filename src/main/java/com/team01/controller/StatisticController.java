package com.team01.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatisticController {
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
}
