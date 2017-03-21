package com.seven.sins.search.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.search.dao.SearchDAO;
import com.seven.sins.search.vo.SearchChannelVO;
import com.seven.sins.search.vo.SearchMemberVO;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	private SearchDAO searchDao;
	
	@Override
	public ArrayList<SearchMemberVO> getMember(String userId, String word) {
		return searchDao.getMember(userId, word);
	}

	@Override
	public ArrayList<SearchChannelVO> getChannel(String userId, String word) {
		return searchDao.getChannel(userId, word);
	}

	
}
