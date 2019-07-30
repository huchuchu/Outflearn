package com.outflearn.Outflearn;

import java.nio.file.AccessDeniedException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonSubTypes.Type;
import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.biz.LoginBiz;

@Controller
public class LoginController {

	@Inject
	BCryptPasswordEncoder passwordEncoder; //비밀번호 암호화 객체
	
	@Inject
	private LoginBiz biz;
	
	//로그인 페이지로 이동
	@RequestMapping("loginform")
	public String loginform() {
		return "login";
	}
	
	@RequestMapping("joinform")
	public String joinform() {
		return "insert";
	}
	
	@RequestMapping("userjoin") 
	public String userInsert(@RequestParam String id, @RequestParam String passwd, @RequestParam String name,
					@RequestParam String nickname, @RequestParam String email	) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", id);
		System.out.println("암호화 전 비번" + passwd);
		String encryptPassword = passwordEncoder.encode(passwd);
		System.out.println("암호화 후 비번" + encryptPassword);
		map.put("user_pw", encryptPassword);
		map.put("user_name", name);
		map.put("user_nickname", nickname);
		map.put("user_email", email);
		
		biz.insertUser(map);	
		
		return "login";
	}
	
	//권한이 없는 사용자에게 안내 페이지 출력
	@RequestMapping("denied")
	public String denied(Model model, AuthenticateAction auth, HttpServletRequest req ) {
		AccessDeniedException ade = (AccessDeniedException)req.getAttribute(WebAttributes.ACCESS_DENIED_403);
		
		model.addAttribute("errMSg", ade);
		return "denied";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginform";
	}
	
	
	


}
