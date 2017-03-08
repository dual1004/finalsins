package com.seven.sins.group.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.group.service.*;
import com.seven.sins.group.vo.GroupVO;

@Controller("GroupController.y")
public class GroupController {
	
	@Autowired private GroupService groupService;
	@Autowired private GroupLikeService groupLikeService;
	@Autowired private GroupWriteService groupWriteService;
	@Autowired private GroupMemberService groupMemberService;
	@Autowired private GroupCommentService groupCommentService;
	
	/*@RequestMapping("selectGroupList.y")
	public ArrayList<GroupVO> selectGroupList() {
		ArrayList<GroupVO> list = groupService.selectGroupList();
		
		return list;
	}*/
	
	@RequestMapping("selectGroupList.y")
	public ModelAndView selectGroupList(ModelAndView mv) {
		ArrayList<GroupVO> list = groupService.selectGroupList();
		mv.addObject("list", list);
		mv.setViewName("group/GroupList");
		
		return mv;
	}
	
	@RequestMapping("insertGroup.y")
	public ModelAndView insertGroup(ModelAndView mv, GroupVO vo) {
		groupService.insertGroup(vo);
		return mv;
	}
}
