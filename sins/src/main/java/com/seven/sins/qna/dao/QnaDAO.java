package com.seven.sins.qna.dao;

import java.util.*;
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

		int startRow = (currentPage - 1) * listLimit;
		int endRow = startRow + listLimit;

		RowBounds rowbounds = new RowBounds(startRow, endRow);

		return (List<QnaContent>) sqlSession.selectList("selectList", null, rowbounds);

	}

	public int selectCount() {
		return (Integer) sqlSession.selectOne("selectCount");
	}

	public QnaContent getContent(int qNo) {

		return (QnaContent) sqlSession.selectOne("selectQna", qNo);
	}

	public int insertCom(QnaComment qc) {

		return sqlSession.insert("commentInsert", qc);
	}

	@SuppressWarnings("unchecked")
	public ArrayList<QnaComment> getCommentList(int qNo) {
		return (ArrayList<QnaComment>) sqlSession.selectList("selectComment", qNo);
	}

	public int insertQna(QnaContent qna) {

		return sqlSession.insert("insertQna", qna);
	}

	public void increaseCount(int qNo) {
		sqlSession.update("increaseCount", qNo);
	}

	public int getKeywordCount(String option, String keyword) {
		Map<String, String> map = new HashMap<String, String>();

		keyword = "%" + keyword + "%";

		map.put("option", option);
		map.put("keyword", keyword);

		return (int) sqlSession.selectOne("keywordCount", map);

	}

	@SuppressWarnings("unchecked")
	public List<QnaContent> searchList(int currentPage, int listLimit, String option, String keyword) {

		Map<String, String> map = new HashMap<String, String>();

		keyword = "%" + keyword + "%";

		map.put("option", option);
		map.put("keyword", keyword);

		int startRow = (currentPage - 1) * listLimit;
		int endRow = startRow + listLimit;

		RowBounds rowbounds = new RowBounds(startRow, endRow);

		return (List<QnaContent>) sqlSession.selectList("searchList", map, rowbounds);
	}

}
