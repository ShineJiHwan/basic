package com.test.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	@GetMapping("/membership")
	public String user2() {
		return "/user/user2";
	}
	
	@GetMapping("/login")
	public String user() {
		return "/user/user";
	}
}
