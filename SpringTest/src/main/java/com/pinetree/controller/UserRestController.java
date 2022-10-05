package com.pinetree.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.pinetree.service.UserService;
import com.pinetree.vo.UserVO;

@RestController
public class UserRestController {
	@Autowired
	private UserService userService;
	
	@PostMapping("/PT_login")
	public String pt_login(@RequestBody UserVO uservo, HttpSession session, HttpServletResponse response,HttpServletRequest request) {
		String result = null;
		UserVO user = userService.selectLogin(uservo);
		if(user != null) {
			if(user.getPw().equals(uservo.getPw())) {
				session.setAttribute("login", user);
				result = "loginOK";
			}else {
				result = "loginNO";
			}
		}
		return result;
	}
}
