package com.seven.sins.channel.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.channel.service.ChannelService;
import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelLikeVO;
import com.seven.sins.channel.vo.ChannelListVO;
import com.seven.sins.channel.vo.ChannelVO;
import com.seven.sins.member.vo.MemberVO;

@Controller
public class ChannelController {

	@Autowired
	private ChannelService channelservice;

	@SuppressWarnings("null")
	@RequestMapping("selectChannelPage.l")	
	public ModelAndView selectChannelPage(ModelAndView mv, ChannelVO vo, ChannelArticleVO articleVo, ChannelListVO listVo, HttpSession session) {
		ChannelVO channelImageCalled = channelservice.selectchannelImageCalled(vo);
		mv.addObject("channelImageCalled", channelImageCalled);

		ArrayList<ChannelArticleVO> selectArticle = channelservice.selectArticle(articleVo);
		mv.addObject("selectArticle", selectArticle);
		
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		articleVo.setUser_id(member.getUserId());
		ArrayList<ChannelLikeVO> selectLikeList = channelservice.selectLikeList(articleVo);
		mv.addObject("selectLikeList", selectLikeList);
		if(selectLikeList.size() == 0 || selectLikeList == null){
			ChannelLikeVO temp = new ChannelLikeVO();
			temp.setChan_article_no(0);
			selectLikeList.add(temp);
		}
		ChannelVO channelPage = channelservice.selectChannelPage(vo);
		System.out.println(channelPage);
		mv.addObject("channelPage", channelPage);
		mv.setViewName("channel/channelPage");
		return mv;
		
	}

	@RequestMapping("insertChannelArticle.l")
	public String insertChannelArticle(ChannelArticleVO vo) {
		channelservice.insertChannelArticle(vo);
		return "forward:/selectChannelPage.l";
	}

	@RequestMapping("updateChannel.l")
	public String updateChannel(ChannelListVO vo){
		int channel_no = vo.getChannel_no();
		channelservice.updateChannel(vo);
		System.out.println(vo);
		return "forward:/selectChannelPage.l?channel_no="+channel_no;
	}
	
	// -----------------채널 게시물 좋아요
	@RequestMapping("articleLikeClick.l")
	@ResponseBody
	public String articleLikeClick(ChannelLikeVO vo, HttpSession sessionId) {
		
		MemberVO loginUser = (MemberVO) sessionId.getAttribute("loginUser");
		vo.setUser_id(loginUser.getUserId());
		int res = channelservice.articleLikeClick(vo);
		String result = String.valueOf(res);
		return result;
	}
	// -----------------채널 게시물 좋아요 해제
	@RequestMapping("articleUnLikeClick.l")
	public String articleUnLikeClick(ChannelLikeVO vo, HttpSession sessionId) {
		MemberVO loginUser = (MemberVO)sessionId.getAttribute("loginUser");
		vo.setUser_id(loginUser.getUserId());
		channelservice.articleUnLikeClick(vo);
		return "forward:/selectChannelPage.l";
	}
	

	@RequestMapping("selectChannelList.l")
	public ModelAndView selectChannelList(ModelAndView mv) {
		ArrayList<ChannelListVO> channellist = channelservice.selectChannelList();
		mv.addObject("channellist", channellist);
		mv.setViewName("channel/channelList");

		return mv;
	}

	@RequestMapping("insertChannel.l")
	public String insertChannel(ChannelListVO c, HttpServletRequest request, HttpSession session) throws Exception {
		c.setChannel_name(request.getParameter("channelName"));
		c.setChannel_filepath(request.getParameter("channelFilepath"));
		c.setChannel_info(request.getParameter("channelInfo"));
		c.setCategory1(request.getParameter("category1"));
		c.setChannel_keyword(request.getParameter("channelKeyword"));
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		c.setChannel_user_id(m.getUserId());

		int a = channelservice.insertChannel(c);

		String result = "";

		if (a > 0)
			result = "forward:selectArticle.l";
		else
			result = "common/error";

		return result;

	}
}
