package com.seven.sins.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.group.vo.GroupWriteVO;

@Repository("groupWriteDAO")
public class GroupWriteDAO {

	private static final String NAMESPACE = "group.";

	@Autowired
	private SqlSession sqlSession;

	@SuppressWarnings("unchecked")
	public ArrayList<GroupWriteVO> selectGroupWriteList(int groupNo) {
		return (ArrayList<GroupWriteVO>)sqlSession.selectList(NAMESPACE + "selectGroupWriteList", groupNo);
	}

	public int insertGroupWrite(GroupWriteVO vo) {
		return sqlSession.insert(NAMESPACE + "insertGroupWrite", vo);
	}

	public int updateGroupWrite(GroupWriteVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteGroupWrite(int writeNo) {
		return sqlSession.update(NAMESPACE + "deleteGroupWrite", writeNo);
	}

}
