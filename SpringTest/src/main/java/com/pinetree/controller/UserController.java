package com.pinetree.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pinetree.service.UserService;
import com.pinetree.vo.UserVO;


@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/membership")
	public String user2() { //ȸ������ ������
		return "/user/user2";
	}
	
	@GetMapping("/login")
	public String user() { //�α��� ������
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
		session.removeAttribute("login");
		return "index";
	}
	
}
