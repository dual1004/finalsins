package com.seven.sins.chat.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seven.sins.chat.handler.ChatHandler;
import com.seven.sins.group.vo.GroupMemberVO;

@Controller
public class BrodCast {

	@RequestMapping("brodcasting.j")
	public String viewChatingPage(){
		return "chat/chat";
<<<<<<< HEAD
=======
	}
	
	@RequestMapping("groupchating.j")
	public void grounChating(GroupMemberVO groupvo){
		ChatHandler chathandler = new ChatHandler();
		Map<Integer, chathandler> grouproom;
		
>>>>>>> refs/remotes/origin/master
	}
}
