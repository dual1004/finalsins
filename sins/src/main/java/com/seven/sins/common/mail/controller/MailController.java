package com.seven.sins.common.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	    public ModelAndView sendEmailAction (String userid, MemberVO m, ModelAndView mv ) throws Exception{
	    	
	    	String rePwd = RandomNum();
	    	
	    	m.setUserId(userid);
	    	m.setUserPwd(rePwd);
	    	
	    	int a = memberService.findPw(m);
			
	        if(a > 0) {
	            email.setContent("비밀번호는 "+rePwd+" 입니다.");
	            email.setReceiver(userid);
	            email.setSubject(userid+"님 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            
	            mv.setViewName("/WEB-INF/views/email/emaiSend");
 	            mv.addObject(email);
// 	            mv.addObject(rePwd);
	          
	        }
			return mv;
	    }
	
}
