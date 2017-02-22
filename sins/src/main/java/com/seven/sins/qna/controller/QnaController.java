package com.seven.sins.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.qna.service.QnaService;
import com.seven.sins.qna.vo.QnaContent;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;

	@RequestMapping("selectQna.n")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="page", required=false) String page) {

		int currentPage = 1;
		int listLimit = 10;

		if (page != null)
			currentPage = Integer.parseInt(page);

		int totalListCount = qnaService.getListCount();
		List<QnaContent> qnaList = qnaService.selectList(currentPage, listLimit);

		int maxPage = (int) ((double) totalListCount / listLimit + 0.9);

		int startPage = (((int) ((double) currentPage / listLimit + 0.9)) - 1) * listLimit + 1;

		int endPage = startPage + listLimit - 1;

		if (maxPage < endPage)
			endPage = maxPage;

		mv.addObject("totalCount", totalListCount);
		mv.addObject("qnaList", qnaList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);

		mv.setViewName("qna/QnaMain");
		return mv;
	}
	
	@RequestMapping("detailQna.n")
	public ModelAndView detailView(ModelAndView mv, @RequestParam(value="no", required=false) String no){
		
		if(no == null){
			//에러페이지
		}else{
		QnaContent qc = qnaService.getContent(Integer.parseInt(no));
		
		mv.addObject("qna", qc);
		mv.setViewName("qna/QnaDetail");
		}
		
		
		return mv;
	}
}
