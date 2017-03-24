package com.seven.sins.channel.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelCommentVO;
import com.seven.sins.channel.vo.ChannelLikeVO;
import com.seven.sins.channel.vo.ChannelListVO;
import com.seven.sins.channel.vo.ChannelVO;
import com.seven.sins.fire.vo.FireVO;

@Repository
public class ChannelDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String NAMESPACE = "Channel.";

	public int insertChannel(ChannelListVO c) {
		return sqlSession.insert(NAMESPACE + "insertChannel", c);
	}

	@SuppressWarnings("unchecked")
	public ArrayList<ChannelListVO> selectChannelList() {
		return (ArrayList<ChannelListVO>) sqlSession.selectList(NAMESPACE + "selectChannelList");
	}

	@SuppressWarnings("unchecked")
	public ArrayList<ChannelArticleVO> selectArticle(ChannelArticleVO vo) {
		return (ArrayList<ChannelArticleVO>) sqlSession.selectList(NAMESPACE + "selectArticle", vo);
	}

	public ChannelVO selectChannelPage(ChannelVO vo) {
		return (ChannelVO) sqlSession.selectOne(NAMESPACE + "selectChannelPage", vo);
	}

	public ChannelVO selectchannelImageCalled(ChannelVO vo) {
		return (ChannelVO) sqlSession.selectOne(NAMESPACE + "channelImageCalled", vo);
	}

	public int insertChannelArticle(ChannelArticleVO vo) {
		System.out.println("3");
		return sqlSession.insert(NAMESPACE + "insertChannelArticle", vo);
	}

	public int articleLikeClick(ChannelLikeVO vo) {
		return sqlSession.insert(NAMESPACE + "articleLikeClick", vo);
	}

	public int articleUnLikeClick(ChannelLikeVO vo) {
		return sqlSession.delete(NAMESPACE + "articleUnLikeClick", vo);
	}

	@SuppressWarnings("unchecked")
	public ArrayList<ChannelLikeVO> selectLikeList(ChannelArticleVO articleVo) {
		return (ArrayList<ChannelLikeVO>) sqlSession.selectList(NAMESPACE + "selectLikeList", articleVo);
	}

	public int updateChannel(ChannelListVO listVo) {
		return sqlSession.update(NAMESPACE + "updateChannel", listVo);
	}

	public int channelCommentInsert(ChannelCommentVO vo) {
		return sqlSession.insert(NAMESPACE + "channelCommentInsert", vo);
	}

	@SuppressWarnings("unchecked")
	public ArrayList<ChannelCommentVO> selectChannelCommentList(int chan_article_no) {
		return (ArrayList<ChannelCommentVO>) sqlSession.selectList(NAMESPACE + "channelCommentList", chan_article_no);
	}

	// 원석 부분
	public String getMasterId(ChannelVO vo) {
		return (String) sqlSession.selectOne(NAMESPACE + "getMasterId", vo);
	}

	@SuppressWarnings("unchecked")
	public ArrayList<FireVO> getFireArticleList(FireVO channelPage) {
		return (ArrayList<FireVO>) sqlSession.selectList("Fire.getFireArticleList", channelPage);
	}
	// 여기까지 원석부분

	public int deleteChannelComment(ChannelCommentVO vo) {
		return sqlSession.delete(NAMESPACE+"deleteChannelComment", vo);
	}

}
