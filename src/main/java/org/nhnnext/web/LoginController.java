package org.nhnnext.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
public class LoginController {
	@Autowired
	private MemberRepository memberrepository;
	
	@RequestMapping("/login/form")
    public String form() {
        return "login/form";
    }
	
	@RequestMapping(value="/login/new", method=RequestMethod.POST)
	public String signin(Member member) {
		memberrepository.save(member);
		return "redirect:/";
	} 
	
	@RequestMapping(value="/login/get", method=RequestMethod.POST)
	public String login(String userid, String password, HttpSession session) {
		System.out.println("here");
	// TODO userId에 해당하는 사용를 데이터베이스에서 조회
	// TODO 사용자가 입력한 비밀번호와 데이터베이스에서 조회한 사용자 비밀번호가 같은지 확인 
		List<Member> copy = (List<Member>) memberrepository.findAll();
		for(Member member : copy) {
			String oUserId = member.getUserid();
			String oPassword = member.getPassword();
			String oName =  member.getName();
			if (userid.equals(oUserId) && password.equals(oPassword)) {
				session.setAttribute("userid", userid);
				session.setAttribute("name", oName);
			}
		}
		return "redirect:/board/list";
	}
	
	@RequestMapping("/logout")
    public String logout(HttpSession session) {
		session.removeAttribute("userid");
		session.removeAttribute("name");
		return "redirect:/board/list";
    }
}

