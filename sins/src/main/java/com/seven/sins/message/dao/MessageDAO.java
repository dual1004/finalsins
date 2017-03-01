package com.seven.sins.message.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.message.vo.MessageVO;


@Repository("messageDAO")
public class MessageDAO {

	private static final String NAMESPACE = "Message.";

	@Autowired
	private SqlSession sqlSession;

	public int getListCount(String userid) {
		return (int)sqlSession.selectOne(NAMESPACE + "listcount", userid);
	}

	
	@SuppressWarnings("unchecked")
	public List<MessageVO> getMsgList(String userid, int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit; 
	    int endRow = startRow + limit - 1; 
	 
	    RowBounds rowbound= new RowBounds(startRow, endRow);
		return (List<MessageVO>)sqlSession.selectList(NAMESPACE + "readlist", userid, rowbound);
	}


	public int getSendListCount(String userid) {
		return (int)sqlSession.selectOne(NAMESPACE + "sendlistcount", userid);
	}


	@SuppressWarnings("unchecked")
	public List<MessageVO> getMsgSendList(String userId, int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit; 
	    int endRow = startRow + limit - 1; 
	    
	    RowBounds rowbound= new RowBounds(startRow, endRow);
		return (List<MessageVO>)sqlSession.selectList(NAMESPACE + "sendlist", userId, rowbound);
	}

	// 스팸 등록
	public int messageSpamInsert(int[] check_no) {
		int result = 0;
		for(int i = 0 ; i < check_no.length;i++){
			int no = check_no[i];
			result += (int)sqlSession.update(NAMESPACE + "spaminsert",no);
		}
		return result;
	}


/*	@SuppressWarnings("unchecked")
	public Map<String, MessageVO> getMsgMap(String userid, int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit; 
	    int endRow = startRow + limit - 1; 
	    
	    RowBounds rowbound= new RowBounds(startRow, endRow);
		return (Map<String, MessageVO>)sqlSession.selectMap(NAMESPACE + "selectmap", userid, "message_no", rowbound);
	}*/
	
	
}
