package com.seven.sins.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class commoncontroller {

	//단순 a링크
	@RequestMapping("alink.do")
	public String alink(String path){
		return path;
	}
}
