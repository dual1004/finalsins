package com.seven.sins.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.member.dao.MemberDAO;
import com.seven.sins.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO loginCheck(MemberVO m) {
		return memberDAO.loginCheck(m);
	}

	@Override
	public int findPw(MemberVO m) {
		return memberDAO.findPw(m);
	}

	@Override
	public int idCheck(String userid) {
		return memberDAO.idCheck(userid);
	}

}
