package com.seven.sins.friend.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.friend.vo.FriendVO;

@Repository
public class FriendDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<FriendVO> selectFriend(String userId) {

		return (ArrayList<FriendVO>) sqlSession.selectList("selectFriend", userId);
	}


	@SuppressWarnings("unchecked")
	public ArrayList<FriendVO> getRequest(String userId) {
		return (ArrayList<FriendVO>) sqlSession.selectList("getRequest", userId);
	}


	public int getReqCount(String userId) {
		
		return (int) sqlSession.selectOne("getReqCount", userId);
	}


	

	
}
