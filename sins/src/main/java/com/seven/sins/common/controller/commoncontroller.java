package com.seven.sins.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class commoncontroller {

	@RequestMapping("alink.do")
	public String alink(String path){
		return path;
	}
}
