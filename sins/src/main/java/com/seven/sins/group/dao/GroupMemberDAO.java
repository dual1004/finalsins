package com.seven.sins.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.group.vo.GroupMemberVO;

@Repository("groupMemberDAO")
public class GroupMemberDAO {

	private static final String NAMESPACE = "group.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@SuppressWarnings("unchecked")
	public ArrayList<GroupMemberVO> selectGroupMemberList(int groupNo) {
		return (ArrayList<GroupMemberVO>)sqlSession.selectList(NAMESPACE + "selectGroupMemberList", groupNo);
	}

	public int requestGroupMember(GroupMemberVO vo) {
		return sqlSession.insert(NAMESPACE + "requestGroupMember", vo);
	}

	public int agreeGroupMember(GroupMemberVO vo) {
		return sqlSession.update(NAMESPACE + "agreeGroupMember", vo);
	}

	public int updateGroupMember(GroupMemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteGroupMember(GroupMemberVO vo) {
		return sqlSession.delete(NAMESPACE + "deleteGroupMember", vo);
	}

	public int countGroupMember(int groupNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
