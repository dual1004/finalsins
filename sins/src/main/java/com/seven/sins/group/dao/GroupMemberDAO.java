package com.seven.sins.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.group.vo.GroupMemberVO;

@Repository("groupMemberDAO")
public class GroupMemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@SuppressWarnings("unchecked")
	public ArrayList<GroupMemberVO> selectGroupMemberList(int groupNo) {
		return (ArrayList<GroupMemberVO>)sqlSession.selectList("group.selectGroupMemberList", groupNo);
	}

	public int requestGroupMember(GroupMemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int agreeGroupMember(GroupMemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateGroupMember(GroupMemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteGroupMember(GroupMemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int countGroupMember(int groupNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
