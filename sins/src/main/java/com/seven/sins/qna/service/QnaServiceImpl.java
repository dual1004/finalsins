package com.seven.sins.qna.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.qna.dao.QnaDAO;
import com.seven.sins.qna.vo.QnaComment;
import com.seven.sins.qna.vo.QnaContent;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDao;
	
	

	@Override
	public List<QnaContent> selectList(int currentPage, int listLimit) {
		return qnaDao.selectList(currentPage, listLimit);
	}

	@Override
	public int getListCount() {
		return qnaDao.selectCount();
	}

	@Override
	public QnaContent getContent(int qNo) {
		return qnaDao.getContent(qNo);
	}

	@Override
	public int insertCom(QnaComment qc) {
		return qnaDao.insertCom(qc);
	}

	@Override
	public ArrayList<QnaComment> getCommentList(int qNo) {
		
		return qnaDao.getCommentList(qNo);
	}

	@Override
	public int getCommentCount(int qNo) {
		return qnaDao.getCommentCount(qNo);
	}

	

	
	
}
