package com.seven.sins.mypage.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.channel.service.ChannelService;
import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.fire.service.FireService;
import com.seven.sins.fire.vo.FireVO;
import com.seven.sins.group.service.GroupService;
import com.seven.sins.group.vo.GroupCommentVO;
import com.seven.sins.group.vo.GroupWriteVO;
import com.seven.sins.member.service.MemberService;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.service.MypageService;
import com.seven.sins.mypage.vo.MypageCommentVO;
import com.seven.sins.mypage.vo.MypageLikeVO;
import com.seven.sins.mypage.vo.MypageVO;
import com.seven.sins.util.FileUtils;

@Controller("MypageController.b")
public class MypageController {
	private String masterId;

	@Autowired
	private MypageService mypageService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ChannelService channelservice;
	

	@Autowired
	private FireService fireService;
	
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
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
		
		// 원석 부분
				 FireVO search = new FireVO();
				 
				 search.setClassify("MY_PAGE");
				 search.setFireById(loginUser.getUserId());
				
				 ArrayList<FireVO> fireList = mypageService.getFireList(search);
				 
				 if(fireList.size() < 1){
					 	FireVO fivo = new FireVO("MY_PAGE", 0, "admin", "admin", 0, 0);
						
					 	fireList.add(fivo);
				 }
				 
				 mv.addObject("fireList", fireList);
				 // 여기까지
		
		
		MypageLikeVO mylike = new MypageLikeVO();
		mylike.setUserid(loginUser.getUserId());
		ArrayList<MypageLikeVO> likeList = mypageService.mypageLikeList(mylike);
		ArrayList<MypageVO> mylist = null;
		 mylist = mypageService.selectMypage(loginUser.getUserId());
		 ArrayList<MypageCommentVO> mycolist = null;
		 mycolist = mypageService.selectMypageComment(loginUser.getUserId());
		 MemberVO memberUser = loginUser;
		 
		mv.addObject("mylist" , mylist);
		mv.addObject("mycolist" , mycolist);
		mv.addObject("memberUser" , memberUser);
		mv.addObject("loginUser" , loginUser);
		mv.addObject("likeList" , likeList);
		
		mv.setViewName("mypage/mypage");
		
		return mv;
	}
	//마이페이지 사진 조회용
	@RequestMapping("mypagePoto.b")
	public ModelAndView mypagePoto(@SessionAttribute MemberVO loginUser,ModelAndView mv, @RequestParam(value="userid", required=false)String userid,MemberVO m){
		m.setUserId(userid);
		MemberVO memberUser = mypageService.memberCheck(m);
		ArrayList<MypageVO> mylist = null;
		 mylist = mypageService.selectMypage(loginUser.getUserId());
		 
		mv.addObject("mylist" , mylist);
		mv.addObject("memberUser" , memberUser);
		
		mv.setViewName("mypage/mypagePoto");
		
		return mv;
	}
	//다른 사람의 마이페이지로 갔을 경우
	@RequestMapping("mypage2.b")
	public ModelAndView mypage2(@SessionAttribute MemberVO loginUser,@RequestParam(value="userid", required=false)String userid, ModelAndView mv, MemberVO m, MypageVO my){
		ArrayList<MypageVO> mylist = null;
		ArrayList<MypageCommentVO> mycolist = null;
		 MypageLikeVO mylike = new MypageLikeVO();
		 ArrayList<MypageLikeVO> likeList = null;
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
		// 원석 부분
		 FireVO search = new FireVO();
		 
		 search.setClassify("MY_PAGE");
		 search.setFireById(loginUser.getUserId());
		 if(userid == null){
		 search.setFireId(masterId);
		 }else{
			 search.setFireId(userid);
		 }
		 ArrayList<FireVO> fireList = mypageService.getFireList(search);
		 
		 if(fireList.size() < 1){
			 	FireVO fivo = new FireVO("MY_PAGE", 0, "admin", "admin", 0, 0);
				
			 	fireList.add(fivo);
		 }
		 
		 mv.addObject("fireList", fireList);
		 // 여기까지

		mylike.setUserid(loginUser.getUserId());
		likeList = mypageService.mypageLikeList(mylike);
		 MemberVO memberUser = mypageService.memberCheck(m);
		
		mv.addObject("mylist" , mylist);
		mv.addObject("mycolist" , mycolist);
		mv.addObject("userid" , userid);
		mv.addObject("memberUser" , memberUser);
		mv.addObject("loginUser" , loginUser);
		mv.addObject("likeList" , likeList);
		
		
		
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
			,@RequestParam(value = "txtContent") String txtContent, @RequestParam(value = "pageid") String pageid,
			@RequestParam("file") MultipartFile file){
		
		if(file.isEmpty() == false){
			String userid = loginUser.getUserId();
			try {
				
				System.out.println("111111");
				System.out.println(file);
				String filePath = fileUtils.fileInfo(userid, file);
				mypage.setFilepath(filePath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{String a= "";
			mypage.setFilepath(a);
		}
		System.out.println(txtContent);
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
		mypageComment.setBackupid(pageid);
		mypageComment.setContentno(writeno);
		System.out.println(pageid);
		System.out.println(pageid);
		System.out.println(pageid);
		System.out.println(pageid);
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
			,@RequestParam(value = "txtComment") String txtComment, @RequestParam(value = "writeno") int writeno, @RequestParam(value = "filepath") String filepath,
			@RequestParam(value = "pageid") String pageid, @RequestParam("file") MultipartFile file
			){
		
		if(file.isEmpty() == false){
			String userid = loginUser.getUserId();
			try {
				String filePath = fileUtils.fileInfo(userid, file);
				
				
				mypageComment.setFilepath(filePath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			
			mypageComment.setFilepath(filepath);
		}
		
		mypageComment.setContent(txtComment);
		mypageComment.setUserid(loginUser.getUserId());
		mypageComment.setWriteno(writeno);
		
		int result = mypageService.mypageUpdate(mypageComment);
		if(result > 0){
			masterId=pageid;
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
		mypageComment.setCommentno(writeno);
		System.out.println(txtComment+" "+writeno+" "+loginUser.getUserId());
		
		
		int result = mypageService.mypageCommentUpdate(mypageComment);
		System.out.println(result);
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
	
	// 좋아요 ----------------------------------------------------------------------
		@RequestMapping("mypageLike.b")
		public @ResponseBody int MypageLike(MypageLikeVO vo, ModelAndView mv) {
			MypageVO myvo = new MypageVO();
			myvo.setWriteno(vo.getWriteNo());
			
			int result = mypageService.MypageLike(vo);
			
			myvo = mypageService.MypageSelectLike(myvo);
			int like = myvo.getWritelike();
			System.out.println(like);
			like +=1;
			MypageVO myvo2 = new MypageVO();
			myvo2.setWritelike(like);
			myvo2.setWriteno(vo.getWriteNo());
			
			int result2 = mypageService.mypageLikeUpdate(myvo2);
			
			return result;
		}
		
		@RequestMapping("MypageUnLike.b")
		public @ResponseBody int MypageUnLike(MypageLikeVO vo, ModelAndView mv) {
			MypageVO myvo = new MypageVO();
			myvo.setWriteno(vo.getWriteNo());
			
			int result = mypageService.MypageUnLike(vo);
			
			myvo = mypageService.MypageSelectLike(myvo);
			int like = myvo.getWritelike();
			
			System.out.println(like);
			like -=1;
			if(like<0)
				like=0;
			
			MypageVO myvo2 = new MypageVO();
			myvo2.setWritelike(like);
			myvo2.setWriteno(vo.getWriteNo());
			
			int result2 = mypageService.mypageLikeUpdate(myvo2);
			
			return result;
		}
		
		//게시물 상세 보기 페이지
		@RequestMapping("contentsMain.b")
		public ModelAndView contentsMain(@SessionAttribute MemberVO loginUser,
				@RequestParam(value="writeno", required=false)int writeno,
				@RequestParam(value="classify", required=false)String classify,
				@RequestParam(value="userid", required=false)String userid,
				ModelAndView mv, MypageVO my, GroupWriteVO gv, ChannelArticleVO cv, MemberVO m){
			System.out.println(classify);
				if(classify.contains("MY_PAGE")){
					my.setClassify(classify);
					my.setWriteno(writeno);
					MypageVO mypage = mypageService.contentsMain(my);
					ArrayList<MypageCommentVO> mycolist = null;
					 mycolist = mypageService.contentsMainComment(writeno);
					 
					 m.setUserId(userid);
					 MemberVO memberUser = mypageService.memberCheck(m);
					 
					 mv.addObject("mycolist" , mycolist);
					 mv.addObject("mypage" , mypage);
					 mv.addObject("memberUser" , memberUser);
					mv.addObject("loginUser" , loginUser);
				}else if(classify.contains("GROUP_MAIN")){
					gv.setClassify(classify);
					gv.setWriteNo(writeno);
					//GroupWriteVO group= groupService.contentsMain(gv);
				}else if(classify.contains("CHANNEL_ARTICLE")){
					cv.setClassify(classify);
					cv.setChan_article_no(writeno);
					//ChannelArticleVO channel = channelservice.contentsMain(cv);
				}else{
					
				}
			
			
			
			
			
			mv.setViewName("mypage/contentsMain");
			return mv;
			
			
			
		}
		
		// 댓글 -----------------------------------------------------------------------
		@RequestMapping("selectMypageCommentList.b")
		public @ResponseBody ArrayList<MypageCommentVO> selectMypageCommentList(int writeNo) {
			
			ArrayList<MypageCommentVO> commentList = mypageService.selectMypageCommentList(writeNo);
			
			return commentList;
		}
		
		@RequestMapping("insertMypageComment.b")
		public @ResponseBody ArrayList<MypageCommentVO> insertMypageComment(MypageCommentVO vo) {

			mypageService.insertMypageComment(vo);
			
			return selectMypageCommentList(vo.getContentno());
		}
		
		
	}
	

