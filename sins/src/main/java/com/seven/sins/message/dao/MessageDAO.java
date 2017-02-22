package com.seven.sins.message.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.message.vo.MessageVO;
import com.sun.javafx.collections.MappingChange.Map;

@Repository("messageDAO")
public class MessageDAO {

	@Autowired
	private SqlSession sqlSessionTemplate;
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> messageReadList(String userid) {
		return (Map<String, Object>) sqlSessionTemplate.selectList("", userid);
				
	}
	
	
}
