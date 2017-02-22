package com.seven.sins.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.qna.service.QnaService;
import com.seven.sins.qna.vo.QnaContent;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("QnaAll.n")
	public ModelAndView QnaAllList(ModelAndView mv){
		
		List<QnaContent> qnaList= qnaService.QnaAllList();
		
		mv.addObject("qnaList", qnaList);
		mv.setViewName("qna/QnaMain");
		return mv;
	}
}
