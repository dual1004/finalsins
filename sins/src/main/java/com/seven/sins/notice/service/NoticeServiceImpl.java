package com.seven.sins.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.notice.dao.NoticeDAO;
import com.seven.sins.notice.vo.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public int getListCount() {
		return noticeDAO.getListCount();
	}

	@Override
	public List<NoticeVO> selectNotice(int currentPage, int listLimit) {
		return noticeDAO.selectNotice(currentPage, listLimit);
	}

}
