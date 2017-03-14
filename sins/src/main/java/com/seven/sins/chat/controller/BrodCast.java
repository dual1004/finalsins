package com.seven.sins.chat.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seven.sins.chat.handler.ChatHandler;

@Controller
public class BrodCast {
	private static Map<Integer, ChatHandler> grouproom = new HashMap<Integer, ChatHandler>();
	
	@RequestMapping("brodcasting.j")
	public String viewChatingPage(){
		return "chat/chat";

	}
}