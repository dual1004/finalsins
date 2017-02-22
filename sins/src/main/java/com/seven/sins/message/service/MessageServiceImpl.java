package com.seven.sins.message.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.message.dao.MessageDAO;
import com.seven.sins.message.vo.MessageVO;

@Service("messageservice")
public class MessageServiceImpl implements MessageService{

	@Autowired
	protected MessageDAO messageDAO;
	@Override
	public List<MessageVO> messageReadlist(String userid) {
		return messageDAO.messageReadList(userid);
	}

}
