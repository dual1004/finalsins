package com.seven.sins.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.group.vo.GroupVO;

@Repository("groupDAO")
public class GroupDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@SuppressWarnings("unchecked")
	public ArrayList<GroupVO> selectGroupList() {
		return (ArrayList<GroupVO>)sqlSession.selectList("group.selectGroupList");
	}

	public GroupVO selectGroup(int groupNo) {
		return (GroupVO)sqlSession.selectOne("group.selectGroup");
	}

	public int insertGroup(GroupVO vo) {
		return sqlSession.insert("group.insertGroup", vo);
	}

	public int updateGroup(GroupVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteGroup(GroupVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
