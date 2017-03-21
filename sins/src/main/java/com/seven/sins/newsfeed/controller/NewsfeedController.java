package com.seven.sins.newsfeed.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.channel.service.ChannelService;
import com.seven.sins.group.service.GroupService;
import com.seven.sins.member.service.MemberService;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.service.MypageService;
import com.seven.sins.mypage.vo.MypageVO;
import com.seven.sins.newsfeed.service.NewsfeedService;
import com.seven.sins.util.FileUtils;

@Controller("NewsfeedController.b")
public class NewsfeedController {

	/*@Autowired
	private NewsfeedService newsfeedService;*/
	@Autowired
	private MypageService mypageService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ChannelService channelservice;
	
	
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
	
	@RequestMapping("newsfeed.b")
	public ModelAndView Newsfeed(@SessionAttribute MemberVO loginUser, ModelAndView mv,
			 MypageVO myvo){
		
				return mv;
		
	}
}
