package com.seven.sins.mypage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.mypage.service.MypageService;
import com.seven.sins.mypage.vo.MypageVO;

@Controller("MypageController.b")
public class MypageController {

	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("mypage.b")
	public ModelAndView mypage(ModelAndView mv){
		System.out.println("부석호 테스트");
		ArrayList<MypageVO> list = mypageService.selectMypage();
		
		mv.addObject("list" , list);
		mv.setViewName("mypage/mypage");
		
		return mv;
	}
	
	//@RequestMapping("mypage.b")
	
}
