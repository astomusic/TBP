package org.nhnnext.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
public class BoardController {
	@RequestMapping("/form")
	public String form() {
		return "form";
	}
	
	@RequestMapping(value="/result", method=RequestMethod.POST)
	public String submit(String title, String content) {
		System.out.println("제목: " + title);
		System.out.println("내용: " + content);
		//System.out.println("파일: " + img_file);
		return "redirect:/";
	}
}
