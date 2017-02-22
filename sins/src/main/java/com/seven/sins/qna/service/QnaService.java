package com.seven.sins.qna.service;

import java.util.List;

import com.seven.sins.qna.vo.QnaContent;

public interface QnaService {

	List<QnaContent> selectList(int currentPage, int listLimit);

	int getListCount();

	QnaContent getContent(int parseInt);

}
