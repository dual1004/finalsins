package com.seven.sins.qna.controller;



import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.qna.service.QnaService;
import com.seven.sins.qna.vo.QnaComment;
import com.seven.sins.qna.vo.QnaContent;
import com.seven.sins.util.FileUtils;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@Resource
	private FileUtils fileUtils;

	@RequestMapping("selectQna.n")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "option", required = false) String option) {

		int currentPage = 1;
		int listLimit = 10;
		if (page != null)
			currentPage = Integer.parseInt(page);

		int totalListCount = 0;

		if (keyword == null)
			totalListCount = qnaService.getListCount();
		else
			totalListCount = qnaService.getKeywordCount(option, keyword);

		
		
		int maxPage = (int) ((double) totalListCount / listLimit + 0.9);
		int startPage = (((int) ((double) currentPage / listLimit + 0.9)) - 1) * listLimit + 1;

		int endPage = startPage + listLimit - 1;
		
		
		if (maxPage < endPage)
			endPage = maxPage;

		List<QnaContent> qnaList;
		if (keyword == null)
			qnaList = qnaService.selectList(currentPage, listLimit);
			
		
		else{
			qnaList = qnaService.searchList(currentPage, listLimit, option, keyword);
			mv.addObject("keyword", keyword);
			mv.addObject("option", option);
		}
		
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
	public ModelAndView detailView(ModelAndView mv, @RequestParam(value = "no", required = false) String no) {


		if (no != null) {
			int qNo = Integer.parseInt(no);

			qnaService.increaseCount(qNo);
			QnaContent qc = qnaService.getContent(qNo);
			ArrayList<QnaComment> commentList = qnaService.getCommentList(qNo);

			mv.addObject("qna", qc);
			mv.addObject("commentList", commentList);

			mv.setViewName("qna/QnaDetail");

		} else {
			// 에러
		}

		return mv;
	}

	@RequestMapping("insertCom.n")
	public @ResponseBody Map<String, ArrayList<QnaComment>> insertCom(@RequestParam(value = "content") String content,
			@RequestParam(value = "qnaNo") int qnaNo,
			@RequestParam(value = "lev") int lev, QnaComment qc,
			@SessionAttribute("loginUser") MemberVO member) {

		String userId=member.getUserId();
		Map<String, ArrayList<QnaComment>> map = new HashMap<String, ArrayList<QnaComment>>();

		qc.setBackupId(userId);
		qc.setClassify("QNA_COMMENT");
		qc.setContent(content);
		qc.setFilepath(null);
		qc.setLev(lev);
		qc.setQnaNo(qnaNo);
		qc.setRef(0);
		qc.setUserId(userId);

		int result = qnaService.insertCom(qc);

		ArrayList<QnaComment> comList = qnaService.getCommentList(qnaNo);

		if (result > 0) {
			map.put("comList", comList);

		} else {
			// 실패
		}
		return map;
	}
	
	

	@RequestMapping("write.n")
	public String qnaWrite(QnaContent qna, @RequestParam("title") String title,
			@RequestParam("content") String content,
			@SessionAttribute("loginUser") MemberVO member,
			@RequestParam(value="uploadFile", required=false) MultipartFile file,
			HttpServletRequest request) {
		
		
		
		String userId=member.getUserId();
		qna.setUserId(userId);
		qna.setTitle(title);
		qna.setContent(content);
		
		
		
		if(file != null){
			
			String filePath="";
			try {
				filePath = fileUtils.fileInfo(userId, file);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			qna.setFilepath(filePath);		
		}
		
	     
		
		
		int result = qnaService.insertQna(qna);

		String viewName = "";
		if (result > 0) 
			viewName = "redirect:selectQna.n";
		 else 
			viewName = "qna/error?message=글쓰기 에러";
		

		request.setAttribute("log", "글쓰기 완료");
		return viewName;
	

	}

}




