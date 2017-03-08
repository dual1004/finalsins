package com.seven.sins.group.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.group.dao.GroupDAO;
import com.seven.sins.group.vo.GroupVO;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Autowired
	private GroupDAO groupDAO;

	@Override
	public ArrayList<GroupVO> selectGroupList() {
		ArrayList<GroupVO> list = groupDAO.selectGroupList();
		return list;
	}

	@Override
	public GroupVO selectGroup(int groupNo) {
		GroupVO vo = groupDAO.selectGroup(groupNo);
		return vo;
	}

	@Override
	public int insertGroup(GroupVO vo) {
		int result = groupDAO.insertGroup(vo);
		return result;
	}

	@Override
	public int updateGroup(GroupVO vo) {
		int result = groupDAO.updateGroup(vo);
		return result;
	}

	@Override
	public int deleteGroup(GroupVO vo) {
		int result = groupDAO.deleteGroup(vo);
		return result;
	}
	
	
}
