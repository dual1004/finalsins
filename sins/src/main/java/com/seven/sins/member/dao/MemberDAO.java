package com.seven.sins.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAO {

	private static final String NAMESPACE = "Member.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO loginCheck(MemberVO m) {
		return (MemberVO) sqlSession.selectOne(NAMESPACE+"loginCheck", m);
	}

}
