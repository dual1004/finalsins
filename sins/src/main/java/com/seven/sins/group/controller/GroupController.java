package com.seven.sins.group.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.group.service.*;
import com.seven.sins.group.vo.GroupMemberVO;
import com.seven.sins.group.vo.GroupVO;
import com.seven.sins.group.vo.GroupWriteVO;
import com.seven.sins.member.vo.MemberVO;

@Controller("GroupController.y")
public class GroupController {
	
	@Autowired private GroupService groupService;
	@Autowired private GroupLikeService groupLikeService;
	@Autowired private GroupWriteService groupWriteService;
	@Autowired private GroupMemberService groupMemberService;
	@Autowired private GroupCommentService groupCommentService;
	
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
	public ModelAndView selectGroup(ModelAndView mv, int groupNo) {
		GroupVO vo = groupService.selectGroup(groupNo);
		ArrayList<GroupWriteVO> writeList = groupWriteService.selectGroupWriteList(groupNo);
		ArrayList<GroupMemberVO> memberList = groupMemberService.selectGroupMemberList(groupNo);
		
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
	public ModelAndView groupMemberDetail(ModelAndView mv, int groupNo) {
		ArrayList<GroupMemberVO> list = groupMemberService.selectGroupMemberList(groupNo);
		GroupVO vo = groupService.selectGroup(groupNo);
		
		mv.addObject("group", vo);
		mv.addObject("list", list);
		mv.setViewName("group/GroupMemberList");
		
		return mv;
	}
	// 글쓰기 ----------------------------------------------------------------------
	@RequestMapping("insertGroupWrite.y")
	public String insertGroupWrite(GroupWriteVO vo) {
		groupWriteService.insertGroupWrite(vo);
		
		return "forward:/selectGroup.y";
	}
	
	@RequestMapping("deleteGroupWrite.y")
	public String deleteGroupWrite(int writeNo) {
		groupWriteService.deleteGroupWrite(writeNo);
		
		return "forward:/selectGroup.y";
	}
	
	// 좋아요 ----------------------------------------------------------------------
	
	// 대글 -----------------------------------------------------------------------
}
