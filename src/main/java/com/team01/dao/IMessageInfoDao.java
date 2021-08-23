package com.team01.dao;

import com.team01.domain.MessageInfo;

import java.util.List;

public interface IMessageInfoDao {

    public List<MessageInfo> queryAllMessageInfo();

    public List<MessageInfo> queryByMessageTitle(String messageTitle);

    public int addMessageInfo(MessageInfo messageInfo);

    public int deleteMessageInfo(int messageId);

    public MessageInfo queryByMessageId(int messageId);

    public int updateMessageInfo(MessageInfo messageInfo);
}
