package com.team01.controller;


import com.team01.domain.AdminInfo;
import com.team01.service.IAdiminInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class AdminInfoController {
    @Resource(name="adminInfoService")
    IAdiminInfoService adminInfoService;

    @RequestMapping("/")
    public String loginPage(){
        return "login";
    }

    @RequestMapping("login")
    public String login(String adminName, String adminPassword, Model model)
    {

       AdminInfo adminInfo= adminInfoService.queryByName(adminName);

       if(adminInfo.getAdminPassword().equals(adminPassword)){
           return "index";
    }else {
           model.addAttribute("message","账户或密码错误");
           return "login";
       }
    }

}
