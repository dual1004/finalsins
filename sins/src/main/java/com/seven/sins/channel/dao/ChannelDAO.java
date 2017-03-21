package com.seven.sins.channel.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelLikeVO;
import com.seven.sins.channel.vo.ChannelListVO;
import com.seven.sins.channel.vo.ChannelVO;
@Repository
public class ChannelDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="Channel.";
	
	public int insertChannel(ChannelListVO c) {
		return sqlSession.insert(NAMESPACE+"insertChannel", c);
	}
	@SuppressWarnings("unchecked")
	public ArrayList<ChannelListVO> selectChannelList() {
		return (ArrayList<ChannelListVO>)sqlSession.selectList(NAMESPACE+"selectChannelList");
	}
	@SuppressWarnings("unchecked")
	public ArrayList<ChannelArticleVO> selectArticle(ChannelArticleVO vo) {
		return (ArrayList<ChannelArticleVO>)sqlSession.selectList(NAMESPACE+"selectArticle", vo);
	}
	public ChannelVO selectChannelPage(ChannelVO vo) {
		return (ChannelVO)sqlSession.selectOne(NAMESPACE+"selectChannelPage",vo);
	}
	public ChannelVO selectchannelImageCalled(ChannelVO vo) {
		return (ChannelVO)sqlSession.selectOne(NAMESPACE+"channelImageCalled",vo);
	}
	public int insertChannelArticle(ChannelArticleVO vo) {
		return sqlSession.insert(NAMESPACE+"insertChannelArticle", vo);
	}
	public int articleLikeClick(ChannelLikeVO vo) {
		return sqlSession.insert(NAMESPACE+"articleLikeClick", vo);
	}
	public int articleUnLikeClick(ChannelLikeVO vo) {
		return sqlSession.delete(NAMESPACE+"articleUnLikeClick", vo);
	}
	@SuppressWarnings("unchecked")
	public ArrayList<ChannelLikeVO> selectLikeList(ChannelArticleVO articleVo) {
		return (ArrayList<ChannelLikeVO>)sqlSession.selectList(NAMESPACE+"selectLikeList", articleVo);
	}
	public int updateChannel(ChannelListVO listVo) {
		return sqlSession.update(NAMESPACE+"updateChannel", listVo);
	}
	
	
}
