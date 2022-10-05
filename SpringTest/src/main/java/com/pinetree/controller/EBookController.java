package com.pinetree.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EBookController {
	
	@GetMapping("/e-book")
	public String eBook() {
		return "e-book/eBook";
	}
}
