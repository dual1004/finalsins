package com.seven.sins.mypage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.mypage.dao.MypageDAO;
import com.seven.sins.mypage.service.MypageService;
import com.seven.sins.mypage.vo.MypageVO;
@Service("mypageService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypageDAO;
	
	@Override
	public ArrayList<MypageVO> selectMypage() {
		ArrayList<MypageVO> list = mypageDAO.selectMypageList();
		return list;
	}

}
