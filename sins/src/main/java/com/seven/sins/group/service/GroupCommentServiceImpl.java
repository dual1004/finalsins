package com.seven.sins.group.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.group.dao.GroupCommentDAO;
import com.seven.sins.group.vo.GroupCommentVO;

@Service
public class GroupCommentServiceImpl implements GroupCommentService {

	@Autowired
	private GroupCommentDAO groupCommentDAO;
	
	@Override
	public ArrayList<GroupCommentVO> selectGroupCommentList() {
		ArrayList<GroupCommentVO> list = groupCommentDAO.selectGroupCommentList();
		return list;
	}

	@Override
	public int insertGroupComment(GroupCommentVO vo) {
		int result = groupCommentDAO.insertGroupComment(vo);
		return result;
	}

	@Override
	public int updateGroupComment(GroupCommentVO vo) {
		int result = groupCommentDAO.updateGroupComment(vo);
		return result;
	}

	@Override
	public int deleteGroupComment(GroupCommentVO vo) {
		int result = groupCommentDAO.deleteGroupComment(vo);
		return result;
	}

	@Override
	public int countGroupComment(int groupNo) {
		int result = groupCommentDAO.countGroupComment(groupNo);
		return result;
	}
}
