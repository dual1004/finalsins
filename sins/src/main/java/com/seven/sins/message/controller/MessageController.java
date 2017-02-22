package com.seven.sins.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.message.service.MessageService;
import com.sun.javafx.collections.MappingChange.Map;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageservice;
	
	//메세지 리시트 읽기 컨트롤러
	@RequestMapping("msglist.j")
	public ModelAndView messageReadList(String userid, ModelAndView mv){
		mv.setViewName("message/messagemain");
		Map<String, Object> map = messageservice.messageReadlist(userid); 
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
