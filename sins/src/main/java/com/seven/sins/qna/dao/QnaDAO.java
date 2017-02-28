package com.seven.sins.qna.dao;




import java.util.ArrayList;
import java.util.List;







import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.qna.vo.QnaComment;
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


	public QnaContent getContent(int qNo) {
		
		return (QnaContent)sqlSession.selectOne("selectQna", qNo);
	}


	public int insertCom(QnaComment qc) {

		return sqlSession.insert("commentInsert", qc);
	}


	
	@SuppressWarnings("unchecked")
	public ArrayList<QnaComment> getComment(int qNo) {
		return (ArrayList<QnaComment>) sqlSession.selectList("selectComment", qNo);
	}


	public int getCommentCount(int qNo) {
		return (int) sqlSession.selectOne("commentCount", qNo);
	}
	

}
