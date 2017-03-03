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
import com.seven.sins.message.vo.MessageListVO;
import com.seven.sins.message.vo.MessageVO;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageservice;
	
	//메세지 리시트 읽기 컨트롤러
	@RequestMapping("msgreadlist.j")
	public ModelAndView messageReadList(@SessionAttribute MemberVO loginUser,@RequestParam(value="page", required=false)String page, ModelAndView mv,
			MessageListVO listvo){
		String seach = listvo.getSeach();
		int currentPage = 1;
		int limit = 10;
		
		if (page != null)
			currentPage = Integer.parseInt(page);
		// 검색창에 아무것도없을대
		int totalListCount = 0;
		List<MessageVO> msglist = null;
		if(listvo.getSeach() == null || listvo.getSeach().equals("")){
			totalListCount = messageservice.getListCount(loginUser.getUserId());
			msglist = messageservice.getMsgList(loginUser.getUserId(), currentPage, limit);
		}else{
			totalListCount = messageservice.getSeachListCount(listvo);
			msglist = messageservice.getMsgSeachList(listvo, currentPage, limit);
		}
			
		
		//Map<String, MessageVO> msgmap = messageservice.getMsgMap(loginUser.getUserId(), currentPage, limit);
		int maxPage = (int) ((double) totalListCount / limit + 0.9);

		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		int endPage = startPage + limit - 1;

		if (maxPage < endPage)
			endPage = maxPage;

		listvo.setSeach(seach);
		mv.addObject("totalCount", totalListCount);
		mv.addObject("msglist", msglist);		
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("seach",listvo.getSeach());
		mv.addObject("select",listvo.getSelect());
		
		mv.setViewName("message/messageread");
		return mv;
	}
	//보낸 메시지 읽기
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
	//스팸등록 컨트롤러 
	@RequestMapping("msgspaminsert.j")
	public ModelAndView messageSpamInsert(int[] check_no, ModelAndView mv){
		int result = messageservice.messageSpamInsert(check_no);
		
		if(result > 0){
			//1개이상 스팸이 등록됨
			mv.setViewName("forward:msgreadlist.j");
		}else{
			//스팸등록 같은것만됨
			mv.setViewName("forward:msgreadlist.j");
		}
		
		return mv;
	}
	// 메시지 삭제(받은 메시지)
	@RequestMapping("msgrecivedel.j")
	public ModelAndView messageResiveDelete(int[] check_no, ModelAndView mv){
		int result = messageservice.messageResiveDelet(check_no);
		
		if(result > 0){
			mv.setViewName("forward:msgreadlist.j");
		}else{
			//삭제 실페페이지
			mv.setViewName("");
		}
		return mv;
	}
	
	// 메세지 1개 읽기 컨트롤러
	@RequestMapping("msgreaddetail.j")
	public ModelAndView messageReadOne(String userid, ModelAndView mv){
		return mv;
	}
	//메세지 보내기 컨트롤러 
	@RequestMapping("msgsead.j")
	public ModelAndView messageSead(@SessionAttribute MemberVO loginUser, String resiveid,String message,ModelAndView mv){
		return mv;
	}
	
}
