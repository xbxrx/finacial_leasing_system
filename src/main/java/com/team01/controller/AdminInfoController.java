package com.team01.controller;


import com.team01.domain.AdminInfo;
import com.team01.service.IAdiminInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;

@Controller
public class AdminInfoController {
    @Resource(name="adminInfoService")
    IAdiminInfoService adminInfoService;

    @RequestMapping("/")
    public String loginPage(){
        return "login";
    }

    @RequestMapping("login")
    public String login(String adminName, String adminPassword, Model model, HttpSession session)
    {

       AdminInfo adminInfo= adminInfoService.queryByNameAndPassword(adminName,adminPassword);

       if(adminInfo!=null){
           session.setAttribute("adminName",adminName);
           return "index";
    }else {
           model.addAttribute("errorMessage","用户名或密码错误，请重新登录!");
           return "login";
       }
    }
    @RequestMapping("toLogout")
    public String toLogout(HttpServletRequest request){
        Enumeration em = request.getSession().getAttributeNames();
        while(em.hasMoreElements()){
            request.getSession().removeAttribute(em.nextElement().toString());
        }
        return "login";
    }

}
