package com.seven.sins.search.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.search.vo.SearchChannelVO;
import com.seven.sins.search.vo.SearchMemberVO;

@Repository
public class SearchDAO {

	private static final String NAMESPACE="Search.";
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<SearchMemberVO> getMember(String userId, String word) {
		
		Map<String, String> map=new HashMap<String,String>();
		map.put("userId", userId);
		map.put("word", "%"+word+"%");
		
		RowBounds rowBounds = new RowBounds(0, 5);
		return (ArrayList<SearchMemberVO>) sqlSession.selectList(NAMESPACE+"searchMember", map, rowBounds);
	}


	@SuppressWarnings("unchecked")
	public ArrayList<SearchChannelVO> getChannel(String userId, String word) {

		Map<String, String> map=new HashMap<String,String>();
		map.put("userId", userId);
		map.put("word", "%"+word+"%");
		RowBounds rowBounds = new RowBounds(0, 5);
		
		return (ArrayList<SearchChannelVO>) sqlSession.selectList(NAMESPACE+"searchChannel", map, rowBounds);
	}

}
