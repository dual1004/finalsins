package com.seven.sins.group.service;

import com.seven.sins.group.vo.GroupLikeVO;

public interface GroupLikeService {
	
	// 좋아요.
	public int groupLike(GroupLikeVO vo);
	
	// 좋아요 취소.
	public int groupUnlike(GroupLikeVO vo);
}
