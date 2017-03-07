package com.seven.sins.common.mail.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.common.mail.Email;
import com.seven.sins.common.mail.EmailSender;
import com.seven.sins.member.service.MemberService;
import com.seven.sins.member.vo.MemberVO;

@Controller
public class MailController {
	
		@Autowired
		private EmailSender emailSender;
		@Autowired
		private Email email;
		@Autowired
		private MemberService memberService;
		
		
		public String RandomNum(){
    		StringBuffer sb = new StringBuffer();
    		for(int i = 0; i < 7; i++){
    			int n = (int)(Math.random() * 10);
    			sb.append(n);
    		}
    		return sb.toString();
    	}
		
	    @RequestMapping("findPwd.p")
	    public String sendEmailAction (String userid, MemberVO m, Model mo ) throws Exception{
	    	
	    	String rePwd = RandomNum();
	    	
	    	m.setUserId(userid);
	    	m.setUserPwd(rePwd);
	    	
	    	int a = memberService.findPw(m);
	
			String result ="";
			
	        if(a > 0) {
	            email.setContent("비밀번호는 "+rePwd+" 입니다.");
	            email.setReceiver(userid);
	            email.setSubject(userid+"님 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            
	            mo.addAttribute(email);	          
	          
	            result="email/emailSend";
	        } else {
	        	result="email/emailFail";
	        }
			return result;
	    }
	    /*@Resource MappingJacksonJsonView ajaxMainView;*/
	    @RequestMapping(value="idCheck.p")
	    @ResponseBody
	    public ModelAndView idCheck(MemberVO newid, ModelAndView mv){
	    	List<String> list = new Vector<>();
	    	mv.setViewName("jsonView");
	    	mv.addObject("id", newid);
	    	//int idCheck = memberService.idCheck(userid);
	    	
	    	//String idc = String.valueOf(idCheck);
	    	
	    	list.add(newid.getUserId());
	    	list.add("afsf2sf");
	    	
	    	
	    	return mv;
	    }
	
}
