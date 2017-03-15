package com.seven.sins.mypage.service;

import java.util.ArrayList;

import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.vo.MypageCommentVO;
import com.seven.sins.mypage.vo.MypageVO;

public interface MypageService {

	//public ArrayList<MypageVO> selectMypage();

	public ArrayList<MypageVO> selectMypage(String string);

	//public ArrayList<MypageCommentVO> selectMypageComment();

	public ArrayList<MypageCommentVO> selectMypageComment(String string);

	public MemberVO memberCheck(MemberVO m);

	public int mypageSend(MypageVO mypage);

	public int mypageComment(MypageCommentVO mypageComment);

	public int mypageUpdate(MypageVO mypageComment);

	public int mypageCommentUpdate(MypageCommentVO mypageComment);

	public int mypageDelete(MypageVO mypageComment);

	public int mypageCommentDelete(MypageCommentVO mypageComment);

	public int getMypageCount();

	public int getKeywordCount(String option, String keyword);

}
