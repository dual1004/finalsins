package com.seven.sins.qna.dao;


import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.qna.vo.QnaContent;

@Repository("qnaDao")
public class QnaDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@SuppressWarnings("unchecked")
	public List<QnaContent> selectList(int currentPage, int listLimit) {
		
		
		int startRow = (currentPage - 1) * listLimit + 1; 
	    int endRow = startRow + listLimit - 1; 
	    
	    RowBounds rowbounds= new RowBounds(startRow, endRow);
		
		return (List<QnaContent>) sqlSession.selectList("selectList", null, rowbounds);
		
		
	}
	
	
	public int selectCount(){
		return (Integer)sqlSession.selectOne("selectCount");
	}


	public QnaContent getContent(int no) {
		
		return (QnaContent)sqlSession.selectOne("selectQna", no);
	}
	

}
