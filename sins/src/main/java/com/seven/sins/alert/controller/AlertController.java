package com.seven.sins.alert.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.alert.service.AlsertServceinter;
import com.seven.sins.alert.service.AlsertService;
import com.seven.sins.alert.vo.AlertVO;
import com.seven.sins.member.vo.MemberVO;

@Controller
public class AlertController {

	@Autowired
	private AlsertServceinter alertservice;
	
	@RequestMapping("alertlist.j")
	public ModelAndView alertList(@SessionAttribute MemberVO loginUser, ModelAndView mv){
		int start = 1;
		int limit = 10;
		List<AlertVO> list = alertservice.getAlertList(loginUser.getUserId(), start, limit);
		
		int count = alertservice.getAllcount(loginUser.getUserId());

		mv.setViewName("alert/alertlist");
		mv.addObject("list", list);
		mv.addObject("limit", limit);
		mv.addObject("count",count);
		return mv;
	}
}
