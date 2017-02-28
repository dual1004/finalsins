package com.seven.sins.message.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.message.dao.MessageDAO;
import com.seven.sins.message.vo.MessageVO;

@Service("messageservice")
public class MessageServiceImpl implements MessageService{

	@Autowired
	protected MessageDAO messageDAO;
	
	@Override
	public int getListCount(String userid) {
		return messageDAO.getListCount(userid);
	}

	@Override
	public List<MessageVO> getMsgList(String userid, int currentPage, int limit) {
		return messageDAO.getMsgList(userid, currentPage, limit);
	}

	@Override
	public int getSendListCount(String userid) {
		return messageDAO.getSendListCount(userid);
	}

	@Override
	public List<MessageVO> getSendMsgList(String userId, int currentPage, int limit) {
		return messageDAO.getMsgSendList(userId, currentPage, limit);
	}

	@Override
	public int messageSpamInsert(String[] check_no) {
		return messageDAO.messageSpamInsert(check_no);
	}

	/*@Override
	public Map<String, MessageVO> getMsgMap(String userid, int currentPage, int limit) {
		return messageDAO.getMsgMap(userid, currentPage, limit);
	}*/

}
