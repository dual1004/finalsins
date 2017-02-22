package com.seven.sins.message.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.message.vo.MessageVO;
import com.sun.javafx.collections.MappingChange.Map;

@Repository("messageDAO")
public class MessageDAO {

	private static final String NAMESPACE = "Message.";

	@Autowired
	private SqlSession sqlSession;
	
	@SuppressWarnings("unchecked")
	public List<MessageVO> messageReadList(String userid) {
		return (List<MessageVO>) sqlSession.selectList(NAMESPACE + "selectlist", userid);
				
	}
	
	
}
