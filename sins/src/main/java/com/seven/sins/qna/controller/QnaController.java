package com.seven.sins.qna.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.qna.service.QnaService;
import com.seven.sins.qna.vo.QnaComment;
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
		
		if(no != null){
			int qNo = Integer.parseInt(no);
			QnaContent qc = qnaService.getContent(qNo);
			ArrayList<QnaComment> commentList = qnaService.getCommentList(Integer.parseInt(no));
			
			int commentCount = qnaService.getCommentCount(qNo);
			
			mv.addObject("qna", qc);
			mv.addObject("commentList", commentList);
			mv.addObject("commentCount", commentCount);
			mv.setViewName("qna/QnaDetail");
			}else{
				//에러
			}
			
			
			return mv;
	}
	
	
	@RequestMapping("insertCom.n")
	public @ResponseBody Map<String, ArrayList<QnaComment>> insertCom(@RequestParam(value="content") String content,
			@RequestParam(value="qnaNo") int qnaNo,
			@RequestParam(value="userId", required=false) String userId,
			@RequestParam(value="lev") int lev, QnaComment qc){
		
		System.out.println(content);
		
		Map<String, ArrayList<QnaComment>> map = new HashMap<String, ArrayList<QnaComment>>(); 

		
		
		qc.setBackupId("user01");
		qc.setClassify("QNA_COMMENT");
		qc.setContent(content);
		qc.setFilepath(null);
		qc.setLev(lev);
		qc.setQnaNo(qnaNo);
		qc.setRef(0);
		qc.setUserId("user01");
		
		
		
		
		int result = qnaService.insertCom(qc);
		
		ArrayList<QnaComment> comList = qnaService.getCommentList(qnaNo);
		
		
		if(result>0){
			map.put("comList", comList);
		}else{
			//실패
		}
		return map;
	}
}
