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
		return (MemberVO)sqlSession.selectOne(NAMESPACE+"loginCheck", m);
	}

	public int findPw(MemberVO m) {
		return sqlSession.update(NAMESPACE+"findPw", m);
	}

	public int idCheck(String userid) {
		return (int)sqlSession.selectOne(NAMESPACE+"idCheck", userid);
	}
	

	public int enrollMember(MemberVO member) {
		return sqlSession.insert(NAMESPACE+"enrollMember", member);
	}

	public int phoneCheck(String phone) {
		return (int)sqlSession.selectOne(NAMESPACE+"phoneCheck", phone);
	}

	public MemberVO findId(MemberVO m) {
		return (MemberVO) sqlSession.selectOne(NAMESPACE+"findId", m);
	}
}
