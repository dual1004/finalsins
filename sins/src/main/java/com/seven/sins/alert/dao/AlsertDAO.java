package com.seven.sins.alert.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.alert.vo.AlertVO;

@Repository("alertDAO")
public class AlsertDAO {

	private static final String NAMESPACE = "alert.";

	@Autowired
	private SqlSession sqlSession;
	
	@SuppressWarnings("unchecked")
	public List<AlertVO> getAlertList(String userId, int start, int limit) {
		RowBounds rowbownd = new RowBounds(start,limit); 
		return (List<AlertVO>)sqlSession.selectList(NAMESPACE+"startlist", userId, rowbownd);
	}

	public int getAllcount(String userId) {
		return (int) sqlSession.selectOne(NAMESPACE+"allcount", userId);
	}
}
