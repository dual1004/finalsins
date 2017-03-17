package com.seven.sins.member.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.member.service.MemberService;
import com.seven.sins.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 로그인용 컨트롤러
	@RequestMapping("loginCheck.k")
	public String loginCheck(String userid, String userpwd, HttpSession session, MemberVO m){
		
		m.setUserId(userid);
		m.setUserPwd(userpwd);
		
		MemberVO loginUser = memberService.loginCheck(m);
		
		if(loginUser != null){
			session.setAttribute("loginUser", loginUser);
			
			return "common/newsfeed";
		}
		return "member/idCheckFail";
	}
	
	// 회원가입용 컨트롤러
	@Value("#{dir['dir.url']}")
	private String dir;
	
	@RequestMapping("enroll.k")
	public String enrollMember(MemberVO member, Model mo){
		
		int result = memberService.enrollMember(member);
		String filePath = dir + member.getUserId();
		
		String url = "";
		if(result > 0){
			
			File file = new File(filePath);
			if(file.exists() == false){
				file.mkdirs();
			};
			
			mo.addAttribute(member);
			url = "member/enrollSuccess";
		}
		else {
			url = "member/enrollFail";
		}
		
		return url;
	}
	
	// 전화번호 중복체크용 컨트롤러
	@RequestMapping("phoneCheck.k")
	@ResponseBody
	public String phoneCheck(HttpServletRequest request){
		String phone = request.getParameter("phone");
		
		int check = memberService.phoneCheck(phone);

		String result = String.valueOf(check);
		
		return result;
	}
	
	// 비밀번호 찾기용 컨트롤러
	@RequestMapping("findId.k")
	public ModelAndView findId(MemberVO m, ModelAndView mv){
		String url = "";
		
		MemberVO findMember = memberService.findId(m);
		mv.addObject("member", findMember);
		if(findMember != null){
			mv.setViewName("member/findIdSuccess");
		}
		else {
			mv.setViewName("member/findIdFail");
		}
		
		return mv;
	}
	
	// 비밀번호 변경용 컨트롤러
	@RequestMapping("changePwd.k")
	public String changePwd(MemberVO m, HttpSession session, Model mo){
		String url = "";
	
		int result = memberService.changePwd(m);
		
		if(result > 0){
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			loginUser.setUserPwd(m.getUserPwd());
			session.setAttribute("loginUser", loginUser);
			mo.addAttribute("message", "비밀번호");
			url = "member/infoModifySuccess";
		}
		else {
			mo.addAttribute("message", "비밀번호 바꾸기를");
			url = "member/changeFail";
		}
		
		return url;
	}
	
	// 생일 수정용 컨트롤러
	@RequestMapping("changeBirth.k")
	public String changeBirth(MemberVO m, HttpSession session, Model mo){
		String url = "member/myInfo";
		
		m.setBirth(m.getBirth().substring(2));
		
		int result = memberService.changeBirth(m);
		if(result > 0){
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			loginUser.setBirth(m.getBirth());
			session.setAttribute("loginUser", loginUser);
			mo.addAttribute("message", "생일");
			url = "member/infoModifySuccess";
		}
		else {
			mo.addAttribute("message", "생일 정보 바꾸기");
			url = "member/changeFail";
		}
		
		return url;
	}
	
	// 전화번호 수정용 컨트롤러
	@RequestMapping("phoneChange.k")
	public String phoneChange(MemberVO m, HttpSession session, Model mo){
		String url = "";
		
		int result = memberService.phoneChange(m);
		
		if(result > 0){
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			loginUser.setPhone(m.getPhone());
			session.setAttribute("loginUser", loginUser);
			mo.addAttribute("message", "전화번호");
			url = "member/infoModifySuccess";
		}
		else {
			mo.addAttribute("message", "전화번호 바꾸기");
			url = "member/changeFail";
		}
		
		return url;
	}
	
	// 회원 탈퇴용 컨트롤러
	@RequestMapping("deleteMember.k")
	public String deleteMember(MemberVO m, HttpSession session, Model mo){
		String url = "";
		
		int result = memberService.deleteMember(m);
		
		if(result > 0){
			session.invalidate();
			url="member/deleteMemberSuccess";
		}
		else {
			mo.addAttribute("message", "회원탈퇴");
			url="member/changeFail";
		}
		
		return url;
	}
	
	// 로그아웃용 컨트롤러
	@RequestMapping("logout.k")
	public String logout(HttpSession session){
		session.invalidate();
		
		return "member/logoutSuccess";
	}
	
	// 주소 수정중 도 정보 가져오기
	@RequestMapping("getCity.k")
	@ResponseBody
	public List<String> getCity(ArrayList<String> list){
		String result = "";
		list = memberService.getCity();
		
		
		return list;
	}
	
	// 도 선택시 시 정보 가져가기
	@RequestMapping("getPartition.k")
	@ResponseBody
	public List<String> getPartition(ArrayList<String> list, HttpServletRequest request){
		String city = request.getParameter("city");
		
		list = memberService.getPartition(city);
		
		list.remove(0);
		
		return list;
	}
	
	// 주소 수정용 컨트롤러
	@RequestMapping("changeAddress.k")
	public String changeAddress(HttpServletRequest request, MemberVO m, Model mo, HttpSession session){
		String url = "";
		
		String city = request.getParameter("city");
		String partition = request.getParameter("partition");
		
		String address = city + " " + partition;
		
		m.setAddress(address);
		
		int result = memberService.changeAddress(m);
		
		if(result > 0){
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			loginUser.setAddress(m.getAddress());
			session.setAttribute("loginUser", loginUser);
			mo.addAttribute("message", "주소");
			url = "member/infoModifySuccess";
		}
		else {
			mo.addAttribute("message", "주소 바꾸기");
			url = "member/changeFail";
		}
		
		
		return url;
	}
	
}
