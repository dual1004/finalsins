package com.seven.sins.search.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.search.service.SearchService;
import com.seven.sins.search.vo.SearchChannelVO;
import com.seven.sins.search.vo.SearchMemberVO;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("totalSearch.n")
	public @ResponseBody Map<String, ArrayList> totalSearch(@RequestParam("word") String word,
			@SessionAttribute(value="loginUser", required=false) MemberVO loginUser){
		
		String userId="";
		if(loginUser==null)
			userId="%";
		else
			userId=loginUser.getUserId();
		
		
		Map<String, ArrayList> map = new HashMap<String, ArrayList>();
		
		ArrayList<SearchMemberVO> mlist= searchService.getMember(userId, word);
		
		ArrayList<SearchChannelVO> clist=searchService.getChannel(userId, word); 

		map.put("mlist", mlist);
		map.put("clist", clist);
		
		return map;
		
	}
	
	
}
