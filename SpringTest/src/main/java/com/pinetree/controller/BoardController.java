package com.pinetree.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	@GetMapping("/board")
	public String board() {
		return "board/board";
	}
	
	@GetMapping("/boardWrite")
	public String boardWrite() {
		return "board/boardWrite";
	}
}
