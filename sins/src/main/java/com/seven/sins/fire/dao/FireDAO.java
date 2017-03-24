package com.seven.sins.fire.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.fire.vo.FireVO;

@Repository("fireDAO")
public class FireDAO {
	
	private static final String NAMESPACE = "Fire.";
	@Autowired
	private SqlSession sqlSession;
	
	/*public String getUserId(FireVO fire) {
		return (String)sqlSession.selectOne(NAMESPACE+"getUserId", fire);
	}*/

	public int doChannelContentFire(FireVO fire) {
		return (int)sqlSession.insert(NAMESPACE+"doChannelContentFire", fire);
	}

	public int cancelChannelContentFire(FireVO fire) {
		return (int)sqlSession.delete(NAMESPACE+"cancelChannelContentFire", fire);
	}

	@SuppressWarnings("unchecked")
	public ArrayList<FireVO> getFireList(FireVO search) {
		return (ArrayList<FireVO>)sqlSession.selectList(NAMESPACE+"getFireList", search);
	}

	public int fireComment(FireVO vo) {
		return (int)sqlSession.insert(NAMESPACE+"fireComment", vo);
	}

	public int fireCommentCancel(FireVO vo) {
		return (int)sqlSession.insert(NAMESPACE+"fireCommentCancel", vo);
	}
}
