package com.seven.sins.group.service;

import com.seven.sins.group.vo.GroupLikeVO;

public interface GroupLikeService {
	
	public int groupLike(GroupLikeVO vo);
	
	public int groupUnlike(GroupLikeVO vo);
}
