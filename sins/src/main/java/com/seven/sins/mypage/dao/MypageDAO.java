package com.seven.sins.mypage.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.seven.sins.mypage.vo.MypageVO;

@Repository("mypageDAO")
public class MypageDAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	/*public static MypageVO mypage(MypageVO m){
		return (MypageVO)sqlSession.selectOne(NAMESPACE + "mypage" , m);
		
	}*/

	@SuppressWarnings("unchecked")
	public ArrayList<MypageVO> selectMypageList() {
		// TODO Auto-generated method stub
		return (ArrayList<MypageVO>)sqlSession.selectList("mypage.mypage");
	}

}
