package com.seven.sins.fire.service;

import java.util.ArrayList;

import com.seven.sins.fire.vo.FireVO;

public interface FireService {

	int doChannelContentFire(FireVO fire);

	int cancelChannelContentFire(FireVO fire);

	ArrayList<FireVO> getFireList(FireVO search);

	int fireComment(FireVO vo);

	int fireCommentCancel(FireVO vo);

	/*String getUserId(FireVO fire);*/


}
