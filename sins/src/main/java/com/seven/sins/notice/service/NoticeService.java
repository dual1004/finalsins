package com.seven.sins.notice.service;

import java.util.List;

import com.seven.sins.notice.vo.NoticeVO;

public interface NoticeService {

	int getListCount();

	List<NoticeVO> selectNotice(int currentPage, int listLimit);

}
