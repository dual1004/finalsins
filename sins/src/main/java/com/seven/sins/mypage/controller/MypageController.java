package com.seven.sins.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.member.service.MemberService;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.message.vo.MessageListVO;
import com.seven.sins.mypage.service.MypageService;
import com.seven.sins.mypage.vo.MypageCommentVO;
import com.seven.sins.mypage.vo.MypageVO;

@Controller("MypageController.b")
public class MypageController {
	private String masterId;

	@Autowired
	private MypageService mypageService;
	
	//마이페이지 글 목록 조회용
	@RequestMapping("mypage.b")
	public ModelAndView mypage(@SessionAttribute MemberVO loginUser, ModelAndView mv,
			@RequestParam(value = "page", required = false) String page, MypageVO myvo
			, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "option", required = false) String option){
		
		//페이징 처리 필요
		/*int currentPage = 1;
		int limit = 10;
		
		if (page != null)
			currentPage = Integer.parseInt(page);
		
		int totalListCount = 0;
		if (keyword == null)
			totalListCount = mypageService.getMypageCount();
		else
			totalListCount = mypageService.getKeywordCount(option, keyword);

		int maxPage = (int) ((double) totalListCount / limit + 0.9);

		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		int endPage = startPage + limit - 1;

		if (maxPage < endPage)
			endPage = maxPage;
		
		
		if (keyword == null)*/
		ArrayList<MypageVO> mylist = null;
		
		
		 mylist = mypageService.selectMypage(loginUser.getUserId());
		 ArrayList<MypageCommentVO> mycolist = null;
		 mycolist = mypageService.selectMypageComment(loginUser.getUserId());
		 MemberVO memberUser = loginUser;
		 
		mv.addObject("mylist" , mylist);
		mv.addObject("mycolist" , mycolist);
		mv.addObject("memberUser" , memberUser);
		mv.addObject("loginUser" , loginUser);
		
		mv.setViewName("mypage/mypage");
		
		return mv;
	}
	//마이페이지 댓글 조회용
	@RequestMapping("mypagePoto.b")
	public ModelAndView mypagePoto(@SessionAttribute MemberVO loginUser,ModelAndView mv){
		//페이징 처리 필요
		ArrayList<MypageVO> mylist = null;
		 mylist = mypageService.selectMypage(loginUser.getUserId());
		 
		mv.addObject("mylist" , mylist);
		
		mv.setViewName("mypage/mypagePoto");
		
		return mv;
	}
	//다른 사람의 마이페이지로 갔을 경우
	@RequestMapping("mypage2.b")
	public ModelAndView mypage2(@SessionAttribute MemberVO loginUser,@RequestParam(value="userid", required=false)String userid, ModelAndView mv, MemberVO m, MypageVO my){
		ArrayList<MypageVO> mylist = null;
		ArrayList<MypageCommentVO> mycolist = null;
		if(userid == null){
			 mylist = mypageService.selectMypage(masterId);
			 
			 mycolist = mypageService.selectMypageComment(masterId);
			 
			 m.setUserId(masterId);
			 
			 userid = masterId;
		}else{
		
		 mylist = mypageService.selectMypage(userid);
		
		 mycolist = mypageService.selectMypageComment(userid);
		 
		 m.setUserId(userid);
		}
		 MemberVO memberUser = mypageService.memberCheck(m);
		
		mv.addObject("mylist" , mylist);
		mv.addObject("mycolist" , mycolist);
		mv.addObject("userid" , userid);
		mv.addObject("memberUser" , memberUser);
		mv.addObject("loginUser" , loginUser);
		
		
		
		mv.setViewName("mypage/mypage");
		masterId=null;
		return mv;
	}
	//내정보 보기
	@RequestMapping("mypageDetail.b")
	public ModelAndView mypageDetail(@SessionAttribute MemberVO loginUser,@RequestParam(value="userid", required=false)String userid, ModelAndView mv, MemberVO m){
		 //임시로
		 userid ="user01";
		
		ArrayList<MypageVO> mylist = null;
		 mylist = mypageService.selectMypage(userid);
		 ArrayList<MypageCommentVO> mycolist = null;
		 mycolist = mypageService.selectMypageComment(userid);
		 
		
		 m.setUserId(userid);
		 MemberVO memberUser = mypageService.memberCheck(m);
		
		mv.addObject("mylist" , mylist);
		mv.addObject("mycolist" , mycolist);
		mv.addObject("userid" , userid);
		mv.addObject("memberUser" , memberUser);
		mv.addObject("loginUser" , loginUser);
		
		
		
		mv.setViewName("mypage/mypageInfo");
		
		return mv;
	}
	//글 작성 하기
	@RequestMapping("mypageInsert.b")
	public ModelAndView mypageInsert(@SessionAttribute MemberVO loginUser, HttpServletRequest request, ModelAndView mv, MypageVO mypage
			,@RequestParam(value = "txtContent") String txtContent, @RequestParam(value = "pageid") String pageid
			){
		System.out.println(pageid);
		mypage.setContent(txtContent);
		mypage.setUserid(loginUser.getUserId());
		mypage.setCreateid(pageid);
		
		int result = mypageService.mypageSend(mypage);
		if(result > 0){
			masterId=pageid;
			mv.setViewName("forward:mypage2.b");
		}else{
			mv.setViewName("에러페이지");
		}
		
		return mv;
	}
	//댓글 작성
	@RequestMapping("mypageComment.b")
	public ModelAndView mypageComment(@SessionAttribute MemberVO loginUser, HttpServletRequest request, ModelAndView mv, MypageCommentVO mypageComment
			,@RequestParam(value = "txtComment") String txtComment, @RequestParam(value = "writeno") int writeno,
			@RequestParam(value = "pageid") String pageid
			){
		mypageComment.setContent(txtComment);
		mypageComment.setUserid(loginUser.getUserId());
		mypageComment.setContentno(writeno);
		int result = mypageService.mypageComment(mypageComment);
		if(result > 0){
			masterId=pageid;
			mv.setViewName("forward:mypage2.b");
		}else{
			mv.setViewName("에러페이지");
		}
		
		return mv;
	}
	
	//글 수정
	@RequestMapping("mypageUpdate.b")
	public ModelAndView mypageUpdate(@SessionAttribute MemberVO loginUser, HttpServletRequest request, ModelAndView mv, MypageVO mypageComment
			,@RequestParam(value = "txtComment") String txtComment, @RequestParam(value = "writeno") int writeno, @RequestParam(value = "filepath") String filepath
			){
		mypageComment.setContent(txtComment);
		mypageComment.setUserid(loginUser.getUserId());
		mypageComment.setWriteno(writeno);
		mypageComment.setFilepath(filepath);
		int result = mypageService.mypageUpdate(mypageComment);
		if(result > 0){
			mv.setViewName("forward:mypage2.b");
		}else{
			mv.setViewName("에러페이지");
		}
		
		return mv;
	}
	
	//댓글 수정
	@RequestMapping("mypageCommentUpdate.b")
	public ModelAndView mypageCommentUpdate(@SessionAttribute MemberVO loginUser, HttpServletRequest request, ModelAndView mv, MypageCommentVO mypageComment
			,@RequestParam(value = "txtComment") String txtComment, @RequestParam(value = "writeno") int writeno,
			@RequestParam(value = "pageid") String pageid
			){
		mypageComment.setContent(txtComment);
		mypageComment.setUserid(loginUser.getUserId());
		mypageComment.setContentno(writeno);
		
		int result = mypageService.mypageCommentUpdate(mypageComment);
		if(result > 0){
			masterId=pageid;
			mv.setViewName("forward:mypage2.b");
		}else{
			mv.setViewName("에러페이지");
		}
		
		return mv;
	}
	//글 삭제
	@RequestMapping("mypageDelete.b")
	public ModelAndView mypageDelete(@SessionAttribute MemberVO loginUser, HttpServletRequest request, ModelAndView mv, MypageVO mypageComment
			,@RequestParam(value = "writeno", required=false) String writeno,
			@RequestParam(value = "pageid") String pageid
			){
		int writeno2 = Integer.parseInt(writeno);
		System.out.println("111222");
		mypageComment.setUserid(loginUser.getUserId());
		mypageComment.setWriteno(writeno2);
		
		int result = mypageService.mypageDelete(mypageComment);
		if(result > 0){
			masterId=pageid;
			mv.setViewName("forward:mypage2.b");
		}else{
			mv.setViewName("에러페이지");
		}
		
		return mv;
	}
	//댓글 삭제
	@RequestMapping("mypageCommentDelete.b")
	public ModelAndView mypageCommentDelete(@SessionAttribute MemberVO loginUser, HttpServletRequest request, ModelAndView mv, MypageCommentVO mypageComment
			, @RequestParam(value = "writeno") int writeno,
			@RequestParam(value = "pageid") String pageid
			){
		System.out.println(writeno);
		mypageComment.setUserid(loginUser.getUserId());
		mypageComment.setCommentno(writeno);
		int result = mypageService.mypageCommentDelete(mypageComment);
		if(result > 0){
			masterId=pageid;
			mv.setViewName("forward:mypage2.b");
		}else{
			System.out.println("에러페이지");
			mv.setViewName("에러페이지");
		}
		
		return mv;
	}
	
	
	}
	

