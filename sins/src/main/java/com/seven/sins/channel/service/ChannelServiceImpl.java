package com.seven.sins.channel.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.channel.dao.ChannelDAO;
import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelLikeVO;
import com.seven.sins.channel.vo.ChannelListVO;
import com.seven.sins.channel.vo.ChannelVO;

@Service
public class ChannelServiceImpl implements ChannelService {
	@Autowired
	private ChannelDAO channelDAO;
	
	@Override
	public ArrayList<ChannelListVO> selectChannelList() {
		ArrayList<ChannelListVO> list = channelDAO.selectChannelList();
		return list;
	}
	
	@Override
	public int insertChannel(ChannelListVO c) {
		int result = channelDAO.insertChannel(c);
		return result;
	}

	@Override
	public ArrayList<ChannelArticleVO> selectArticle(ChannelArticleVO vo) {
		ArrayList<ChannelArticleVO> selectArticle = channelDAO.selectArticle(vo);
		return selectArticle;
	}
	@Override
	public int insertChannelArticle(ChannelArticleVO vo) {
		return channelDAO.insertChannelArticle(vo);
	}
	@Override
	public int articleLikeClick(ChannelLikeVO vo) {
		return channelDAO.articleLikeClick(vo);
	}
	@Override
	public int articleUnLikeClick(ChannelLikeVO vo) {
		return channelDAO.articleUnLikeClick(vo);
	}
	@Override
	public ChannelVO selectChannelPage(ChannelVO vo) {
		return channelDAO.selectChannelPage(vo);
	}
	
	@Override
	public ChannelVO selectchannelImageCalled(ChannelVO vo) {
		return channelDAO.selectchannelImageCalled(vo);
	}

	@Override
	public ArrayList<ChannelLikeVO> selectLikeList(ChannelArticleVO articleVo) {
		return channelDAO.selectLikeList(articleVo);
	}

	@Override
	public int updateChannel(ChannelListVO listVo) {
		return channelDAO.updateChannel(listVo);
	}

}
