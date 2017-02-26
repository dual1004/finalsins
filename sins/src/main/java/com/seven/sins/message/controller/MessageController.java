package com.seven.sins.message.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.message.service.MessageService;
import com.seven.sins.message.vo.MessageVO;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageservice;
	
	//메세지 리시트 읽기 컨트롤러
	@RequestMapping("msgreadlist.j")
	public ModelAndView messageReadList(@SessionAttribute MemberVO loginUser,@RequestParam(value="page", required=false)String page, ModelAndView mv){
		int currentPage = 1;
		int limit = 10;

		if (page != null)
			currentPage = Integer.parseInt(page);

		int totalListCount = messageservice.getListCount(loginUser.getUserId());
		List<MessageVO> msglist = messageservice.getMsgList(loginUser.getUserId(), currentPage, limit);
		//Map<String, MessageVO> msgmap = messageservice.getMsgMap(loginUser.getUserId(), currentPage, limit);
		int maxPage = (int) ((double) totalListCount / limit + 0.9);

		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		int endPage = startPage + limit - 1;

		if (maxPage < endPage)
			endPage = maxPage;

		mv.addObject("totalCount", totalListCount);
		mv.addObject("msglist", msglist);		
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		
		mv.setViewName("message/messageread");
		return mv;
	}
	
	@RequestMapping("msgsendlist.j")
	public ModelAndView messageSendList(@SessionAttribute MemberVO loginUser,@RequestParam(value="page", required=false)String page, ModelAndView mv){
		int currentPage = 1;
		int limit = 10;

		if (page != null)
			currentPage = Integer.parseInt(page);

		int sendListCount = messageservice.getSendListCount(loginUser.getUserId());
		List<MessageVO> msgsendlist = messageservice.getSendMsgList(loginUser.getUserId(), currentPage, limit);

		int maxPage = (int) ((double) sendListCount / limit + 0.9);

		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		int endPage = startPage + limit - 1;

		if (maxPage < endPage)
			endPage = maxPage;

		mv.addObject("sendlistCount", sendListCount);
		mv.addObject("msgsendlist", msgsendlist);		
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);

		mv.setViewName("message/messagesendlist");
		return mv;
	}
	
	// 메세지 1개 읽기 컨트롤러
	@RequestMapping("msgread.j")
	public ModelAndView messageReadOne(String userid, ModelAndView mv){
		return mv;
	}
	//메세지 보내기 컨트롤러 
	@RequestMapping("msgsead.j")
	public ModelAndView messageSead(String sendid, String resiveid,String message,ModelAndView mv){
		return mv;
	}
	
}
