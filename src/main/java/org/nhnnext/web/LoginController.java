package org.nhnnext.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="/login/new.json", method=RequestMethod.POST)
	public @ResponseBody LoginResult signincheck(Member member) {
		LoginResult loginresult = new LoginResult();
		memberrepository.save(member);
		List<Member> copy = (List<Member>) memberrepository.findAll();
		for(Member m : copy) {
			String oUserId = m.getUserid();
			String oPassword = m.getPassword();
			String oName =  m.getName();
			if (member.getUserid().equals(oUserId) && member.getName().equals(oName) && member.getPassword().equals(oPassword)) {
				loginresult.setResult("OK");
				loginresult.setCode(200);
				return loginresult;
			}
		}
		loginresult.setResult("error");
		loginresult.setCode(400);
		return loginresult;
	} 
	
	@RequestMapping(value="/login/get", method=RequestMethod.POST)
	public String login(String userid, String password, HttpSession session) {
		System.out.println("here" + userid + password);
	// TODO userId에 해당하는 사용를 데이터베이스에서 조회
	// TODO 사용자가 입력한 비밀번호와 데이터베이스에서 조회한 사용자 비밀번호가 같은지 확인 
		List<Member> copy = (List<Member>) memberrepository.findAll();
		for(Member member : copy) {
			String oUserId = member.getUserid();
			String oPassword = member.getPassword();
			String oName =  member.getName();
			//String result = "{code = 200;result = OK;}";
			if (userid.equals(oUserId) && password.equals(oPassword)) {
				session.setAttribute("userid", userid);
				session.setAttribute("name", oName);
				//return "{code = 200;result = OK;}";
			}
		}
		//return "{code = 400;result = error;}";
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/login/get.json", method=RequestMethod.POST)
	public @ResponseBody LoginResult check(String userid, String password, HttpSession session) {
		//System.out.println("here" + userid + password);
		LoginResult loginresult = new LoginResult();
		List<Member> copy = (List<Member>) memberrepository.findAll();
		for(Member member : copy) {
			String oUserId = member.getUserid();
			String oPassword = member.getPassword();
			String oName =  member.getName();
			//long oid = member.getId();
			if (userid.equals(oUserId) && password.equals(oPassword)) {
				session.setAttribute("userid", userid);
				session.setAttribute("name", oName);
				loginresult.setResult("OK");
				loginresult.setCode(200);
				return loginresult;
			}
		}
		loginresult.setResult("error");
		loginresult.setCode(400);
		return loginresult;
	}
	
	@RequestMapping("/logout")
    public String logout(HttpSession session) {
		session.removeAttribute("userid");
		session.removeAttribute("name");
		return "redirect:/board/list";
    }
}

