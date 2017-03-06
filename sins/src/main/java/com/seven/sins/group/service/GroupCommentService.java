package com.seven.sins.group.service;

import java.util.*;

import com.seven.sins.group.vo.GroupCommentVO;

public interface GroupCommentService {
	public ArrayList<GroupCommentVO> selectGroupCommentList();
	
	public int insertGroupComment(GroupCommentVO vo);
	
	public int updateGroupComment(GroupCommentVO vo);
	
	public int deleteGroupComment(GroupCommentVO vo);
	
	public int countGroupComment(int groupNo);
}
