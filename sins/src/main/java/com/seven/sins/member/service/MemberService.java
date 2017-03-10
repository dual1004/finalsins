package com.seven.sins.member.service;

import com.seven.sins.member.vo.MemberVO;

public interface MemberService {

	MemberVO loginCheck(MemberVO m);
	int findPw(MemberVO m);
	int idCheck(String userid);
	int enrollMember(MemberVO member);
	int phoneCheck(String phone);
	MemberVO findId(MemberVO m);
}
