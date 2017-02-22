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
	public List<QnaContent> QnaAllList() {
		
		return qnaDao.QnaAllList();
		
		
	}

	
	
}
