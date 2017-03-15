package com.seven.sins.mypage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.dao.MypageDAO;
import com.seven.sins.mypage.service.MypageService;
import com.seven.sins.mypage.vo.MypageCommentVO;
import com.seven.sins.mypage.vo.MypageVO;
@Service("mypageService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypageDAO;
	
	
	@Override
	public ArrayList<MypageVO> selectMypage(String userid) {
		ArrayList<MypageVO> list = mypageDAO.selectMypageList(userid);
		return list;
	}

	@Override
	public ArrayList<MypageCommentVO> selectMypageComment(String userid) {
		ArrayList<MypageCommentVO> list = mypageDAO.selectMypageCommentList(userid);
		return list;
	}

	@Override
	public MemberVO memberCheck(MemberVO m) {
		return mypageDAO.memberCheck(m);
	}

	@Override
	public int mypageSend(MypageVO mypage) {
		return mypageDAO.mypageSend(mypage);
	}

	@Override
	public int mypageComment(MypageCommentVO mypageComment) {
		return mypageDAO.mypageComment(mypageComment);
	}

	@Override
	public int mypageUpdate(MypageVO mypageComment) {
		return mypageDAO.mypageUpdate(mypageComment);
	}

	@Override
	public int mypageCommentUpdate(MypageCommentVO mypageComment) {
		return mypageDAO.mypageCommentUpdate(mypageComment);
	}

	@Override
	public int mypageDelete(MypageVO mypageComment) {
		System.out.println("서비스");
		return mypageDAO.mypageDelete(mypageComment);
	}

	@Override
	public int mypageCommentDelete(MypageCommentVO mypageComment) {
		return mypageDAO.mypageCommentDelete(mypageComment);
	}

	@Override
	public int getMypageCount() {
		// TODO Auto-generated method stub
		return mypageDAO.getMypageCount();
	}

	@Override
	public int getKeywordCount(String option, String keyword) {
		return mypageDAO.getKeywordCount(option, keyword);
	}
	
	

}
