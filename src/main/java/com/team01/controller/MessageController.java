package com.team01.controller;


import com.team01.domain.MessageInfo;
import com.team01.service.IMessageInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class MessageController {

    @Resource(name = "messageInfoService")
    IMessageInfoService messageInfoService;

    @RequestMapping("toMessageInfo")
    public String toMessageInfo(Model model){
        List<MessageInfo> messageInfos=messageInfoService.queryAllMessageInfo();
        model.addAttribute("messageInfos",messageInfos);
        return "messageInfo";
    }

    @RequestMapping("toAddMessage")
    public String doAdd(){
        return "addMessage";
    }

    @RequestMapping("toAddMessageResult")
    public String addMessageResult(@RequestParam("myfile") MultipartFile myfile, String messageTitle, String authorName, String productContent, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
//拿到文件的名字

        String oldname = myfile.getOriginalFilename();

        String path = request.getServletContext().getRealPath("/images/");
        File filepath = new File(path);
        if (!filepath.exists()) {
            //如果不存在文件夹就生成一个文件夹
            filepath.mkdirs();
        }

        String newname = UUID.randomUUID() + "_" + oldname;
        File newfile = new File(filepath, newname);
        myfile.transferTo(newfile);

        String img="http://localhost:8080/web/images/"+newname;
        MessageInfo messageInfo=new MessageInfo(messageTitle,authorName,productContent,img);

        int i= messageInfoService.addMessageInfo(messageInfo);
        if (i>0){
            model.addAttribute("Message","标题为"+messageTitle+"作者为"+authorName+"信息添加成功");
        }else{
            model.addAttribute("Message","标题为"+messageTitle+"作者为"+authorName+"信息添加失败");
        }
        List<MessageInfo> messageInfos=messageInfoService.queryAllMessageInfo();
        model.addAttribute("messageInfos",messageInfos);
        return "messageInfo";
    }

    @RequestMapping("toQueryByMessageId")
    public String queryByMessageId(Model model,int messageId){
        MessageInfo messageInfo=messageInfoService.queryByMessageId(messageId);
        model.addAttribute("messageInfo",messageInfo);
        return "message";
    }

    @RequestMapping("toQueryMessage")
    public String queryByTitle(String messageTitle,Model model){
        if("".equals(messageTitle)){
            model.addAttribute("Message","请输入关键字！");
        }
        List<MessageInfo> messageInfos= messageInfoService.queryByMessageTitle(messageTitle);
        model.addAttribute("messageInfos",messageInfos);
        return "messageInfo";
    }

    @RequestMapping("toDeleteMessage")
    public String deleteMessage(Model model,int messageId){
        System.out.println("messageId="+messageId);

        int i= messageInfoService.deleteMessageInfo(messageId);
        if(i>0){
            model.addAttribute("Message","信息号为"+messageId+"的信息删除成功");
        }else
        {
            model.addAttribute("Message","信息号为"+messageId+"的信息删除失败");
        }
        List<MessageInfo> messageInfos=messageInfoService.queryAllMessageInfo();
        model.addAttribute("messageInfos",messageInfos);
        return "messageInfo";
    }

    @RequestMapping("toUpdateMessage")
    public String doUpdateMessage(int messageId,Model model){
        MessageInfo messageInfo=messageInfoService.queryByMessageId(messageId);
        model.addAttribute("messageInfo",messageInfo);
        return "updateMessage";
    }

    @RequestMapping("toUpdateMessageResult")
    public String updateMessageResult(@RequestParam("myfile") MultipartFile myfile, Model model,int messageId,String messageTitle,String authorName,String productContent, HttpServletRequest request, HttpServletResponse response) throws IOException {
//拿到文件的名字
        String img;
        if(!myfile.isEmpty()){
            String oldname = myfile.getOriginalFilename();

            String path = request.getServletContext().getRealPath("/images/");
            File filepath = new File(path);
            if (!filepath.exists()) {
                //如果不存在文件夹就生成一个文件夹
                filepath.mkdirs();
            }

            String newname = UUID.randomUUID() + "_" + oldname;
            File newfile = new File(filepath, newname);
            myfile.transferTo(newfile);

            img="http://localhost:8080/web/images/"+newname;


        }else {
            img=messageInfoService.queryByMessageId(messageId).getImg();
        }

        MessageInfo messageInfo=new MessageInfo(messageTitle,authorName,productContent,img);
        messageInfo.setMessageId(messageId);

       int i= messageInfoService.updateMessageInfo(messageInfo);
       if(i>0){
           model.addAttribute("Message","信息号为"+messageId+"的信息更新成功");
       }else{
           model.addAttribute("Message","信息号为"+messageId+"的信息更新失败");
       }
        List<MessageInfo> messageInfos=messageInfoService.queryAllMessageInfo();
        model.addAttribute("messageInfos",messageInfos);
        return "messageInfo";
    }
    @RequestMapping("batchDeleteMessageInfo")
    public String batchDeleteMessageInfo(@RequestParam(name = "ids") int[] messageId,Model model){
        int count=messageInfoService.batchDeleteMessageInfo(messageId);
        List<MessageInfo> messageInfos=messageInfoService.queryAllMessageInfo();
        model.addAttribute("messageInfos",messageInfos);
        model.addAttribute("Message","共删除"+count+"条信息");
        return "messageInfo";
    }


}
