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
	public @ResponseBody Map<String, ArrayList<FriendVO>> selectFriend(@SessionAttribute("loginUser") MemberVO member){
		
		
		Map<String, ArrayList<FriendVO>> map = new HashMap<String, ArrayList<FriendVO>>();
		
		ArrayList<FriendVO> list= friendService.selectFriend(member.getUserId());
		
		map.put("friendList", list);
		
		
		return map;
		
	}
	
	
	@RequestMapping("friendMain.n")
	public String friendMain(){
		
		
		return "friend/friendDetail";
	}
	
	@RequestMapping("friendAccept.n")
	public @ResponseBody Map<String, ArrayList<FriendVO>> accept(@RequestParam(value = "userId", required=false) String reqId,
			@RequestParam(value="option") int option,
			@SessionAttribute("loginUser") MemberVO member){
		
		//option 값이 1이면 수락 2면 거절 나머지는 첫로딩
		String userId=member.getUserId();
		
		if(reqId!=null){
			if(option==1)
				friendService.acceptFriend(userId, reqId);
			
			if(option==2)
				friendService.rejectFriend(userId, reqId);
		}
		
		Map<String, ArrayList<FriendVO>> map = new HashMap<String, ArrayList<FriendVO>>();
		
		ArrayList<FriendVO> resList=friendService.getResponse(userId);
		
		
		
		
		map.put("resList", resList);
		
		
		
		
		return map;
	}
	
	@RequestMapping("cancelReq.n")
	public @ResponseBody Map<String, ArrayList<FriendVO>> cancelReq(@RequestParam(value = "userId", required=false) String resId,
			@RequestParam(value="option") int option,
			@SessionAttribute("loginUser") MemberVO member){
		
		//option 값이 1이면 취소 나머지는 첫로딩
		String userId=member.getUserId();
		
		if(resId!=null){
			if(option==1)
				friendService.rejectFriend(resId, userId);
		
		}
		
		Map<String, ArrayList<FriendVO>> map = new HashMap<String, ArrayList<FriendVO>>();
		
		ArrayList<FriendVO> reqList=friendService.getRequest(userId);
		
		
		
		
		map.put("reqList", reqList);
		
		
		
		
		return map;
	}
	
	
	
	
	
	
	@RequestMapping("friendFind.n")
	public ModelAndView friendFind(ModelAndView mv, 
			@RequestParam(value="userName", defaultValue="%") String userName,
			@RequestParam(value="birth", defaultValue="%") String birth,
			@RequestParam(value="address", defaultValue="%") String address,
			@RequestParam(value="phone", defaultValue="%") String phone,
			@SessionAttribute("loginUser") MemberVO member
			){
		
		Map<String, String> query=new HashMap<String, String>();
		
		
		if(!userName.equals("%"))
			userName="%"+userName+"%";
		
		if(!birth.equals("0"))
			birth= "%"+birth.substring(2)+"%";
		else 
			birth="%";
		
		if(!address.equals("%")){
			address="%"+address+"%";
			mv.addObject("viewAddress",1);
		}
		
		query.put("userId", member.getUserId());
		query.put("userName", userName);
		query.put("birth", birth);
		query.put("address", address);
		query.put("phone", phone);
		
		ArrayList<MemberVO> resultList=friendService.friendFind(query);
		
		mv.addObject("resultList", resultList);
		
		
		mv.setViewName("friend/resultFind");
		
		return mv;
		
	}
	
	
	@RequestMapping("recommend.n")
	public @ResponseBody Map<String, ArrayList<FriendVO>> recommend(@SessionAttribute("loginUser") MemberVO member
			,@RequestParam(value="resId", required=false) String resId){
		
		
		String userId=member.getUserId();
		if(resId!=null){
			friendService.addFriend(userId, resId);
		}
		
		Map<String, ArrayList<FriendVO>> map = new HashMap<String, ArrayList<FriendVO>>();
		
		ArrayList<FriendVO> recList=friendService.getRecommend(userId);
		
		map.put("recList", recList);
		
		return map;
	}
	
	@RequestMapping("addFriend.n")
	public @ResponseBody Map<String, String> addFriend(@SessionAttribute("loginUser") MemberVO member,
			@RequestParam("resId") String resId
			){
		Map<String,String> map=new HashMap<String,String>();
		String userId=member.getUserId();
		
		
		friendService.addFriend(userId, resId);
		
		map.put("result", "ok");
		return map;
		
	}
}
