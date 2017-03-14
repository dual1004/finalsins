package com.seven.sins.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.group.vo.GroupVO;

@Repository("groupDAO")
public class GroupDAO {
	
	private static final String NAMESPACE = "group.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@SuppressWarnings("unchecked")
	public ArrayList<GroupVO> selectGroupList() {
		return (ArrayList<GroupVO>)sqlSession.selectList(NAMESPACE + "selectGroupList");
	}

	public GroupVO selectGroup(int groupNo) {
		return (GroupVO)sqlSession.selectOne(NAMESPACE + "selectGroup", groupNo);
	}

	public int insertGroup(GroupVO vo) {
		int groupResult = sqlSession.insert(NAMESPACE + "insertGroup", vo);

		// 그룹 생성 성공시, 생성자를 멤버 테이블에 운영자로 추가.
		if(groupResult > 0) 
			sqlSession.insert(NAMESPACE + "insertGroupAdmin", vo);
		
		return groupResult;
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
