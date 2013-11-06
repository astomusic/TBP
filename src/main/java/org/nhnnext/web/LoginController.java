package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private MemberRepository memberrepository;
	
	@RequestMapping("/form")
    public String form() {
        return "login/form";
    }
	
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String signin(Member member) {
		memberrepository.save(member);
		return "redirect:/";
	} 
	
}

