package com.seven.sins.qna.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.qna.vo.QnaContent;

@Repository("qnaDao")
public class QnaDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@SuppressWarnings("unchecked")
	public List<QnaContent> QnaAllList() {
		List<QnaContent> qnaList= (List<QnaContent>) sqlSession.selectList("selectAll");
		
		
		
		
		
		return qnaList;
	}

}
