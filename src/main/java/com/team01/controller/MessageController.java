package com.team01.controller;


import com.team01.domain.MessageInfo;
import com.team01.service.IMessageInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

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
    public String addMessageResult(String messageTitle,String authorName,String productContent,Model model){
        MessageInfo messageInfo=new MessageInfo(messageTitle,authorName,productContent);

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
    public String updateMessageResult(Model model,int messageId,String messageTitle,String authorName,String productContent){
        MessageInfo messageInfo=new MessageInfo(messageTitle,authorName,productContent);
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
