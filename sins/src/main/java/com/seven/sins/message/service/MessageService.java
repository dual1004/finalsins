package com.seven.sins.message.service;

import java.util.List;
import java.util.Map;

import com.seven.sins.message.vo.MessageListVO;
import com.seven.sins.message.vo.MessageVO;

public interface MessageService {

	int getListCount(String userid);

	List<MessageVO> getMsgList(String userid, int currentPage, int limit);

	int getSendListCount(String userId);

	List<MessageVO> getSendMsgList(String userId, int currentPage, int limit);

	int messageSpamInsert(int[] check_no);

	int messageResiveDelet(int[] check_no);

	int getSeachListCount(MessageListVO listvo);

	List<MessageVO> getMsgSeachList(MessageListVO listvo, int currentPage, int limit);

	MessageVO getMessageOne(int msgno);

	List<String> autocomresiveid(MessageVO msgvo);

	int messageSend(MessageVO sendmsg);

	//Map<String, MessageVO> getMsgMap(String userid, int currentPage, int limit);

}
