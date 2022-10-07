package com.pinetree.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
				session.setAttribute("name", user.getName());
				result = "loginOK";
			}else {
				result = "pwfail";
			}
		}else {
			result = "NoEmail";
		}
		return result;
	}
	
	@RequestMapping(value="confirmEmail",method=RequestMethod.POST)
	public ResponseEntity<String> cofirm_email(@RequestBody UserVO uservo){ //이메일 중복 확인
		ResponseEntity<String> entity = null;
		
		try {
			String result = this.userService.confirmEmail(uservo);
			if(result == null) {
				entity = new ResponseEntity<String>("YES",HttpStatus.OK);
			}else {
				entity = new ResponseEntity<String>("NO",HttpStatus.OK);
			}
		
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
