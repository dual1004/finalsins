package com.seven.sins.member.service;

import java.util.*;

import com.seven.sins.member.vo.MemberVO;

public interface MemberService {

	MemberVO loginCheck(MemberVO m);
	int findPw(MemberVO m);
	int idCheck(String userid);
	int enrollMember(MemberVO member);
	int phoneCheck(String phone);
	MemberVO findId(MemberVO m);
	List<String> allMemberId();
	int changePwd(MemberVO m);
	int changeBirth(MemberVO m);
	int phoneChange(MemberVO m);
	int deleteMember(MemberVO m);
	ArrayList<String> getCity();
	ArrayList<String> getPartition(String city);
	int changeAddress(MemberVO m);
	int setLoginFailCheck(String userid);
	int getLoginFailCheck(String userid);
	int setBanTime(String userid);
	int loginFailCheckZero(MemberVO loginUser);
	int addressDelete(MemberVO m);
	int birthDelete(MemberVO m);
	
}
