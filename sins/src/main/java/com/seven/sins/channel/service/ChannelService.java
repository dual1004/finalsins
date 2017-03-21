package com.seven.sins.channel.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelLikeVO;
import com.seven.sins.channel.vo.ChannelListVO;
import com.seven.sins.channel.vo.ChannelVO;

public interface ChannelService {
	public ArrayList<ChannelListVO> selectChannelList();
	public ChannelVO selectChannelPage(ChannelVO vo);
	int insertChannel(ChannelListVO c);
	public ArrayList<ChannelArticleVO> selectArticle(ChannelArticleVO vo);
	public ChannelVO selectchannelImageCalled(ChannelVO vo);
	public int insertChannelArticle(ChannelArticleVO vo);
	public int articleLikeClick(ChannelLikeVO vo);
	public int articleUnLikeClick(ChannelLikeVO vo);
	public ArrayList<ChannelLikeVO> selectLikeList(ChannelArticleVO articleVo);
	public int updateChannel(ChannelListVO listVo);

}
