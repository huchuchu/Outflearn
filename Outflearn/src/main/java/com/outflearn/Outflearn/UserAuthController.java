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
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.outflearn.Outflearn.model.biz.UserAuthBiz;

@Controller
public class UserAuthController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserAuthController.class);
	
	@Inject
	UserAuthBiz biz;
		
	@Inject
	BCryptPasswordEncoder passwordEncoder; //비밀번호 암호화 객체
	
	@RequestMapping("test01")
	public String test012(@RequestParam String test) {
		

		System.out.println(test);
				
		return "login";
	}
	
	@RequestMapping("test.do")
	public String testpage( Authentication auth) {

		logger.info("test.do 입장~!");		
		
		System.out.println("auth test 1 : " + auth);
		System.out.println("★★★★★★★★"+auth.getName());
		System.out.println(""+auth.getAuthorities());
		
		System.out.println("=================>>"+auth.getPrincipal());
		
	//	System.out.println(auth.getPrincipal().toString());

//		UserInfoDto dto = (UserInfoDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		System.out.println(dto.getUser_email());
		
		
//		UserInfoDto dto = (UserInfoDto)auth.getPrincipal();
//		System.out.println(dto.getUser_email());

		return "tutor/test01";
	}
	
	
	//권한이 없는 사용자에게 안내 페이지 출력
	@RequestMapping("denied")
	public String denied(Model model, AuthenticateAction auth, HttpServletRequest req ) {
		AccessDeniedException ade = (AccessDeniedException)req.getAttribute(WebAttributes.ACCESS_DENIED_403);
		
		model.addAttribute("errMsg", ade);
		return "denied";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginform";
	}
	

	
	
	

}
