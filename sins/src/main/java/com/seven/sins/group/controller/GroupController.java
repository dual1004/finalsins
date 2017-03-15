package com.seven.sins.group.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.group.service.*;
import com.seven.sins.group.vo.GroupMemberVO;
import com.seven.sins.group.vo.GroupVO;
import com.seven.sins.group.vo.GroupWriteVO;
import com.seven.sins.member.vo.MemberVO;

@Controller("GroupController.y")
public class GroupController {

	@Autowired
	private GroupService groupService;
	@Autowired
	private GroupLikeService groupLikeService;
	@Autowired
	private GroupWriteService groupWriteService;
	@Autowired
	private GroupMemberService groupMemberService;
	@Autowired
	private GroupCommentService groupCommentService;

	// 그룹 관련------------------------------------------------------------------

	// 그룹 클릭 시, 리스트 보여줌.
	@RequestMapping("selectGroupList.y")
	public ModelAndView selectGroupList(ModelAndView mv) {
		ArrayList<GroupVO> list = groupService.selectGroupList();
		mv.addObject("list", list);
		mv.setViewName("group/GroupList");

		return mv;
	}

	// 그룹 리스트에서 그룹 하나 선택 시, 그룹 메인으로 이동함.
	@RequestMapping("selectGroup.y")
	public ModelAndView selectGroup(ModelAndView mv, int groupNo, @SessionAttribute MemberVO loginUser) {
		GroupVO vo = groupService.selectGroup(groupNo);
		ArrayList<GroupWriteVO> writeList = groupWriteService.selectGroupWriteList(groupNo);
		ArrayList<GroupMemberVO> memberList = groupMemberService.selectGroupMemberList(groupNo);
		
		// 그룹 회원인지 확인.
		String memberCheck = "false";
		
		for (GroupMemberVO member : memberList) {
			if (loginUser.getUserId().equals(member.getUserId()) && member.getGroupAccept().equals("Y")) {
				memberCheck = "true";
			} else if(loginUser.getUserId().equals(member.getUserId()) && member.getGroupAccept().equals("N")) {
				memberCheck = "wait";
			}
		}
		
		System.out.println(memberCheck);
		
		mv.addObject("memberCheck", memberCheck);
		mv.addObject("group", vo);
		mv.addObject("writeList", writeList);
		mv.addObject("memberList", memberList);
		mv.setViewName("group/GroupMain");

		return mv;
	}

	// 그룹 생성.
	@RequestMapping("insertGroup.y")
	public String insertGroup(GroupVO vo) {
		groupService.insertGroup(vo);
		return "forward:/selectGroupList.y";
	}

	// 그룹 멤버--------------------------------------------------------------------
	// 그룹에 가입된 멤버 상세히 보여줌.
	@RequestMapping("groupMemberDetail.y")
	public ModelAndView groupMemberDetail(ModelAndView mv, int groupNo, @SessionAttribute MemberVO loginUser) {
		ArrayList<GroupMemberVO> list = groupMemberService.selectGroupMemberList(groupNo);
		GroupVO vo = groupService.selectGroup(groupNo);
		
		for(GroupMemberVO member : list) {
			if(loginUser.getUserId().equals(member.getUserId())) {
				mv.addObject("member", member);
			}
		}
		
		mv.addObject("group", vo);
		mv.addObject("list", list);
		mv.setViewName("group/GroupMemberList");

		return mv;
	}

	// 회원이 아닌 사람이 그룹 가입 요청
	@RequestMapping("requestGroupMember.y")
	public String requestGroupMember(GroupMemberVO vo) {
		groupMemberService.requestGroupMember(vo);
		
		return "forward:/selectGroup.y";
	}
	
	// 가입 승인.
	@RequestMapping("agreeGroupMember.y")
	public String agreeGroupMember(GroupMemberVO vo) {
		groupMemberService.agreeGroupMember(vo);
		
		return "forward:/groupMemberDetail.y";
	}
	
	// 가입 거절.
	@RequestMapping("disagreeGroupMember.y")
	public String disagreeGroupMember(GroupMemberVO vo) {
		groupMemberService.deleteGroupMember(vo);
		
		return "forward:/groupMemberDetail.y";
	}
	
	// 글쓰기----------------------------------------------------------------------
	// 글 추가
	@RequestMapping("insertGroupWrite.y")
	public String insertGroupWrite(GroupWriteVO vo) {
		groupWriteService.insertGroupWrite(vo);

		return "forward:/selectGroup.y";
	}
	
	// 글 삭제
	@RequestMapping("deleteGroupWrite.y")
	public String deleteGroupWrite(int writeNo) {
		groupWriteService.deleteGroupWrite(writeNo);

		return "forward:/selectGroup.y";
	}

	// 좋아요 ----------------------------------------------------------------------

	// 댓글 -----------------------------------------------------------------------
}
