package com.seven.sins.friend.service;

import java.util.ArrayList;

import com.seven.sins.friend.vo.FriendVO;

public interface FriendService {

	ArrayList<FriendVO> selectFriend(String userId);

	ArrayList<FriendVO> getRequest(String userId);

	int getReqCount(String userId);

}
