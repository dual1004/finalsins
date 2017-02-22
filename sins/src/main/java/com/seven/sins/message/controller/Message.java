package com.seven.sins.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.message.service.MessageService;

@Controller
public class Message {

	@Autowired
	private MessageService messageservice;
	
	@RequestMapping("msgread.j")
	public ModelAndView messageReadOne(String userid, ModelAndView mv){
		return mv;
	}
	
	@RequestMapping("msgsead.j")
	public ModelAndView messageSead(String userid,String message,ModelAndView mv){
		return mv;
	}
	
}
