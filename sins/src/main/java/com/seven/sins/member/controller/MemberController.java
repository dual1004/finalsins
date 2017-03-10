package com.seven.sins.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.member.service.MemberService;
import com.seven.sins.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("loginCheck.k")
	public String loginCheck(String userid, String userpwd, HttpSession session, MemberVO m){
		
		m.setUserId(userid);
		m.setUserPwd(userpwd);
		
		MemberVO loginUser = memberService.loginCheck(m);
		
		if(loginUser != null){
			session.setAttribute("loginUser", loginUser);
			
			return "common/newsfeed";
		}
		return null;
	}
	
	@RequestMapping("enroll.k")
	public String enrollMember(MemberVO member, Model mo){
		System.out.println(member);
		
		int result = memberService.enrollMember(member);
		
		String url = "";
		if(result > 0){
			mo.addAttribute(member);
			url = "member/enrollSuccess";
		}
		else {
			url = "member/enrollFail";
		}
		
		return url;
	}
	
	@RequestMapping("phoneCheck.k")
	@ResponseBody
	public String phoneCheck(HttpServletRequest request){
		
		String phone = request.getParameter("phone");
		
		int check = memberService.phoneCheck(phone);

		String result = String.valueOf(check);
		
		return result;
	}
	
	@RequestMapping("findId.k")
	public ModelAndView findId(MemberVO m, ModelAndView mv){
		String url = "";
		
		MemberVO findMember = memberService.findId(m);
		System.out.println(findMember);
		mv.addObject("member", findMember);
		if(findMember != null){
			mv.setViewName("member/findIdSuccess");
		}
		else {
			mv.setViewName("member/findIdFail");
		}
		
		return mv;
	}
	
	//모든맴버 아이디 가져오기 컨트롤러
	@RequestMapping("allmemberid.j")
	@ResponseBody
	public List<String> allMemberId(){
		return memberService.allMemberId();
	}
}
