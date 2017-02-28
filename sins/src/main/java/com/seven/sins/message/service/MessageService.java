package com.seven.sins.message.service;

import java.util.List;
import java.util.Map;

import com.seven.sins.message.vo.MessageVO;

public interface MessageService {

	int getListCount(String userid);

	List<MessageVO> getMsgList(String userid, int currentPage, int limit);

	int getSendListCount(String userId);

	List<MessageVO> getSendMsgList(String userId, int currentPage, int limit);

	int messageSpamInsert(String[] check_no);

	//Map<String, MessageVO> getMsgMap(String userid, int currentPage, int limit);

}
