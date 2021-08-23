package com.team01.service.impl;

import com.team01.dao.IMessageInfoDao;
import com.team01.domain.MessageInfo;
import com.team01.service.IMessageInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("messageInfoService")
public class MessageInfoServiceImp implements IMessageInfoService {

    @Autowired
    IMessageInfoDao messageInfoDao;

    @Override
    public List<MessageInfo> queryAllMessageInfo() {
        return messageInfoDao.queryAllMessageInfo();
    }

    @Override
    public List<MessageInfo> queryByMessageTitle(String messageTitle) {
        return messageInfoDao.queryByMessageTitle(messageTitle);
    }

    @Override
    public int addMessageInfo(MessageInfo messageInfo) {
        return messageInfoDao.addMessageInfo(messageInfo);
    }

    @Override
    public int deleteMessageInfo(int messageId) {
        return messageInfoDao.deleteMessageInfo(messageId);
    }

    @Override
    public MessageInfo queryByMessageId(int messageId) {
        return messageInfoDao.queryByMessageId(messageId);
    }

    @Override
    public int updateMessageInfo(MessageInfo messageInfo) {
        return messageInfoDao.updateMessageInfo(messageInfo);
    }
}
