package com.seven.sins.fire.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seven.sins.fire.service.FireService;
import com.seven.sins.fire.vo.FireVO;
import com.seven.sins.member.vo.MemberVO;

@Controller
public class FireController {
	
	@Autowired
	private FireService fireService;
	
	@RequestMapping("fireContent.k")
	@ResponseBody
	public String fireChannelContent(FireVO fire, HttpSession session){
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		fire.setFireById(loginUser.getUserId());

		String result = "";
		System.out.println(fire);
		int doFire = fireService.doChannelContentFire(fire);
		
		result = String.valueOf(doFire);

		return result;
	}
	
	
	@RequestMapping("cancelFireContent.k")
	@ResponseBody
	public String CancelChannelContent(FireVO fire, HttpSession session){
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		fire.setFireById(loginUser.getUserId());

		String result = "";
		
		int doFire = fireService.cancelChannelContentFire(fire);
		
		result = String.valueOf(doFire);

		return result;
	}
	
	@RequestMapping("fireComment.k")
	@ResponseBody
	public String fireComment(FireVO vo, HttpSession session){
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		vo.setFireById(member.getUserId());
		System.out.println(vo);
		String result = String.valueOf(fireService.fireComment(vo));
		
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("fireCommentCancel.k")
	@ResponseBody
	public String fireCommentCancel(FireVO vo, HttpSession session){
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		vo.setFireById(member.getUserId());
		System.out.println(vo);
		String result = String.valueOf(fireService.fireCommentCancel(vo));
		
		System.out.println(result);
		return result;
	}
	
}
