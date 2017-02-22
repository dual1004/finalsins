package com.seven.sins.message.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.message.dao.MessageDAO;
import com.sun.javafx.collections.MappingChange.Map;

@Service("messageservice")
public class MessageServiceImpl implements MessageService{

	@Autowired
	protected MessageDAO messageDAO;
	@Override
	public Map<String, Object> messageReadlist(String userid) {
		return messageDAO.messageReadList(userid);
	}

}
