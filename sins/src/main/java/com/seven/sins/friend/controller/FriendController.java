package com.seven.sins.friend.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.friend.service.FriendService;
import com.seven.sins.friend.vo.FriendVO;
import com.seven.sins.member.vo.MemberVO;


@Controller
public class FriendController {

	@Autowired
	private FriendService friendService;
	
	
	@RequestMapping("selectFriendList.n")
	public @ResponseBody Map<String, ArrayList<FriendVO>> selectFriend(@RequestParam("userId") String userId){
		
		
		Map<String, ArrayList<FriendVO>> map = new HashMap<String, ArrayList<FriendVO>>();
		
		ArrayList<FriendVO> list= friendService.selectFriend(userId);
		
		map.put("friendList", list);
		
		
		return map;
		
	}
	
	
	@RequestMapping("friendRecom.n")
	public ModelAndView friendRecom(ModelAndView mv/*, @SessionAttribute("loginUser") MemberVO loginUser*/){
		
		
		int requestCount= friendService.getReqCount("user01");
		ArrayList<FriendVO> reqList=friendService.getRequest("user01");
		mv.addObject("reqList", reqList);
		mv.addObject("requestCount", requestCount);
		mv.setViewName("friend/friendDetail");
		
		return mv;
	}
	
	
	
}
