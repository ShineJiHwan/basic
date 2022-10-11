package com.pinetree.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.pinetree.service.UserService;
import com.pinetree.vo.UserVO;


@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/membership")
	public String user2() { //회원가입 페이지
		return "/user/user2";
	}
	
	@GetMapping("/login")
	public String user() { //로그인 페이지
		return "/user/user";
	}
	
	@PostMapping("/membership")
	public String membership(UserVO user,HttpServletRequest request,HttpServletResponse reseponse) {
		user.setEmail(user.getEmail()+"@"+user.getDomain());
		userService.InsertUser(user);
		return "index";
	}
	@GetMapping("PT_logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		//session.removeAttribute("login");
		session.invalidate();
		return "index";
	}
	
	@GetMapping
	public String membership_email_ch(UserVO user) {
		user.getEmail();
		userService.userKey_ch(user);
		return "index";
	}
	
}
