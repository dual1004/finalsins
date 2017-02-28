package com.seven.sins.qna.service;

import java.util.ArrayList;
import java.util.List;

import com.seven.sins.qna.vo.QnaComment;
import com.seven.sins.qna.vo.QnaContent;

public interface QnaService {

	List<QnaContent> selectList(int currentPage, int listLimit);

	int getListCount();

	QnaContent getContent(int qNo);

	int insertCom(QnaComment qc);

	ArrayList<QnaComment> getComment(int qNo);

	int getCommentCount(int qNo);

}
