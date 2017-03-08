package com.seven.sins.friend.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.friend.dao.FriendDAO;
import com.seven.sins.friend.vo.FriendVO;

@Service
public class FriendServiceImpl implements FriendService {

	@Autowired
	private FriendDAO friendDao;
	
	@Override
	public ArrayList<FriendVO> selectFriend(String userId) {

		
		return friendDao.selectFriend(userId);
	}

	@Override
	public ArrayList<FriendVO> getRequest(String userId) {
		return friendDao.getRequest(userId);
	}

	@Override
	public int getReqCount(String userId) {
		return friendDao.getReqCount(userId);
	}

}
