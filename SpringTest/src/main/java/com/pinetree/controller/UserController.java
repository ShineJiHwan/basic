package com.pinetree.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class UserController {
	
	@GetMapping("/membership")
	public String user2() { //ȸ������ ������
		return "/user/user2";
	}
	
	@GetMapping("/login")
	public String user() { //�α��� ������
		return "/user/user";
	}
}
