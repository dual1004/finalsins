package com.seven.sins.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.qna.dao.QnaDAO;
import com.seven.sins.qna.vo.QnaContent;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDao;
	
	

	@Override
	public List<QnaContent> selectList(int currentPage, int listLimit) {
		// TODO Auto-generated method stub
		return qnaDao.selectList(currentPage, listLimit);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return qnaDao.selectCount();
	}

	@Override
	public QnaContent getContent(int no) {
		// TODO Auto-generated method stub
		return qnaDao.getContent(no);
	}

	
	
}
