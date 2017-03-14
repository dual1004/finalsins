package com.seven.sins.group.service;

import java.util.*;

import com.seven.sins.group.vo.GroupCommentVO;

public interface GroupCommentService {
	// 댓글 리스트.
	public ArrayList<GroupCommentVO> selectGroupCommentList(GroupCommentVO vo);
	
	// 댓글 쓰기.
	public int insertGroupComment(GroupCommentVO vo);
	
	// 댓글 수정.
	public int updateGroupComment(GroupCommentVO vo);
	
	// 댓글 삭제.
	public int deleteGroupComment(GroupCommentVO vo);
	
	// 게시글에 달린 댓글 갯수.
	public int countGroupComment(int writeNo);
}
