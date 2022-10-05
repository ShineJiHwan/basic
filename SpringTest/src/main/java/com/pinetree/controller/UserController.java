package com.pinetree.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class UserController {
	
	@GetMapping("/membership")
	public String user2() { //회원가입 페이지
		return "/user/user2";
	}
	
	@GetMapping("/login")
	public String user() { //로그인 페이지
		return "/user/user";
	}
}
