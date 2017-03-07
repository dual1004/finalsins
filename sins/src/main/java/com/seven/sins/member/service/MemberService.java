package com.seven.sins.member.service;

import com.seven.sins.member.vo.MemberVO;

public interface MemberService {

	MemberVO loginCheck(MemberVO m);
	int findPw(MemberVO m);
	int idCheck(String userid);
}
