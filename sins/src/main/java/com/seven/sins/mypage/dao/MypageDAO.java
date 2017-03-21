package com.seven.sins.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.vo.MypageCommentVO;
import com.seven.sins.mypage.vo.MypageLikeVO;
import com.seven.sins.mypage.vo.MypageVO;

@Repository("mypageDAO")
public class MypageDAO {

	private static final String NAMESPACE = "mypage.";

	
	@Autowired
	private SqlSession sqlSession;
	
	/*public static MypageVO mypage(MypageVO m){
		return (MypageVO)sqlSession.selectOne(NAMESPACE + "mypage" , m);
		
	}*/

	@SuppressWarnings("unchecked")
	public ArrayList<MypageVO> selectMypageList(String userid) {
		return (ArrayList<MypageVO>)sqlSession.selectList("mypage.mypage", userid);
	}

	@SuppressWarnings("unchecked")
	public ArrayList<MypageCommentVO> selectMypageCommentList(String userid) {
		return (ArrayList<MypageCommentVO>)sqlSession.selectList("mypage.mypageComment", userid);
	}

	public MemberVO memberCheck(MemberVO m) {
		return (MemberVO)sqlSession.selectOne("mypage.memberCheck", m);
	}

	public int mypageSend(MypageVO mypage) {
		return (int)sqlSession.insert(NAMESPACE + "mypageSend", mypage);
	}

	public int mypageComment(MypageCommentVO mypageComment) {
		return (int)sqlSession.insert(NAMESPACE + "mypageCommentIn", mypageComment);
	}

	public int mypageUpdate(MypageVO mypageComment) {
		return (int)sqlSession.update(NAMESPACE + "mypageUpdate", mypageComment);
	}

	public int mypageCommentUpdate(MypageCommentVO mypageComment) {
		return (int)sqlSession.update(NAMESPACE + "mypageCommentUpdate", mypageComment);
	}

	public int mypageDelete(MypageVO mypageComment) {
		System.out.println("DAO");
		return (int)sqlSession.delete(NAMESPACE + "mypageDelete", mypageComment);
	}

	public int mypageCommentDelete(MypageCommentVO mypageComment) {
		return (int)sqlSession.delete(NAMESPACE + "mypageCommentDelete", mypageComment);
	}

	public int getMypageCount() {
		return (Integer) sqlSession.selectOne(NAMESPACE + "mypageCount");
	}

	public int getKeywordCount(String option, String keyword) {
		Map<String, String> map = new HashMap<String, String>();

		keyword = "%" + keyword + "%";

		map.put("option", option);
		map.put("keyword", keyword);

		return (int) sqlSession.selectOne("keywordCount", map);
	}

	public int MypageLike(MypageLikeVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + "MypageLike", vo);
	}

	public int MypageUnLike(MypageLikeVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + "MypageUnLike", vo);
	}

	public ArrayList<MypageLikeVO> mypageLikeList(MypageLikeVO mylike) {
		// TODO Auto-generated method stub
		return (ArrayList<MypageLikeVO>)sqlSession.selectList(NAMESPACE + "mypageLikeList", mylike);
	}

	public int mypageLikeUpdate(MypageVO myvo) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + "mypageLikeUpdate", myvo);
	}

	public MypageVO MypageSelectLike(MypageVO myvo) {
		// TODO Auto-generated method stub
		return (MypageVO) sqlSession.selectOne(NAMESPACE + "MypageSelectLike", myvo);
	}
	

}
