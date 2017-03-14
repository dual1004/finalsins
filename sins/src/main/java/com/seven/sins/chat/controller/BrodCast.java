package com.seven.sins.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BrodCast {

	@RequestMapping("brodcasting.j")
	public String viewChatingPage(){
		return "chat/chat";
	}
}
