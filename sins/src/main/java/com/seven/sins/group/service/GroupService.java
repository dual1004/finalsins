package com.seven.sins.group.service;

import java.util.*;

import com.seven.sins.group.vo.*;

public interface GroupService {

	public ArrayList<GroupVO> selectGroupList();
	
	public GroupVO selectGroup(int groupNo);
	
	public int insertGroup(GroupVO vo);
	
	public int updateGroup(GroupVO vo);
	
	public int deleteGroup(GroupVO vo);
	
	
	
	
}
