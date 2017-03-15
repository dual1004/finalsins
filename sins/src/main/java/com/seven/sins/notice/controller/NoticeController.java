package com.seven.sins.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.notice.service.NoticeService;
import com.seven.sins.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("selectNotice.k")
	public ModelAndView selectNotice(ModelAndView mv, String page){
		int currentPage = 1;
		int listLimit = 10;

		if (page != null)
			currentPage = Integer.parseInt(page);

		int totalListCount = noticeService.getListCount();
		
		int maxPage = (int) ((double) totalListCount / listLimit + 0.9);

		int startPage = (((int) ((double) currentPage / listLimit + 0.9)) - 1) * listLimit + 1;

		int endPage = startPage + listLimit - 1;

		if (maxPage < endPage)
			endPage = maxPage;
		
		List<NoticeVO> list = noticeService.selectNotice(currentPage, listLimit);
		
		mv.addObject("list", list);
		mv.addObject("totalCount", totalListCount);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.setViewName("notice/NoticeMain");
		
		return mv;
	}
}
