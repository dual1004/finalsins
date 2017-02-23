package com.seven.sins.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seven.sins.member.service.MemberService;
import com.seven.sins.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("loginCheck.k")
	public String loginCheck(HttpServletRequest request, HttpSession session){
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		
		MemberVO m = new MemberVO();
		m.setUserId(userid);
		m.setUserPwd(userpwd);
		
		MemberVO loginUser = memberService.loginCheck(m);
		
		if(loginUser != null){
			session.setAttribute("loginUser", loginUser);
			
			return "/";
		}
		
		return null;
	}
}
