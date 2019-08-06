package com.outflearn.Outflearn;

import java.io.UnsupportedEncodingException;

import java.nio.file.AccessDeniedException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.codehaus.jackson.JsonNode;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.biz.LoginBiz;
import com.outflearn.Outflearn.model.biz.LoginBizImpl;
import com.outflearn.Outflearn.service.UserAuthenticationService;



@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);


	
	@Inject
	BCryptPasswordEncoder passwordEncoder; //비밀번호 암호화 객체
	
	@Inject
	private LoginBizImpl biz;
	
	private String randompassword;
	
	//로그인 페이지로 이동
	@RequestMapping("loginform")
	public String loginform() {
		return "login";
	}
	
	//회원가입페이지로 이동 
	@RequestMapping("registerform.do")
	public String joinform() {
		return "memberRegister";
	}
	
		
	//회원가입
	@RequestMapping("register.do") 
	public String userInsert(@RequestParam String user_id, @RequestParam String user_pw,
					@RequestParam String user_nickname, @RequestParam String user_email	) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		System.out.println("암호화 전 비번" + user_pw);
		String encryptPassword = passwordEncoder.encode(user_pw);
		System.out.println("암호화 후 비번" + encryptPassword);
		map.put("user_pw", encryptPassword);
		map.put("user_nickname", user_nickname);
		map.put("user_email", user_email);
		
		biz.insertUser(map);	
		
		return "login";
	}
	
	
	@RequestMapping("kakaoUserinsert")
	@ResponseBody
	public void kakao_userInsert(@RequestParam String user_id, @RequestParam String user_pw,
			@RequestParam String user_nickname, @RequestParam String user_email	) {
		
		int res = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		System.out.println("암호화 전 비번" + user_pw);
		String encryptPassword = passwordEncoder.encode(user_pw);
		System.out.println("암호화 후 비번" + encryptPassword);
		map.put("user_pw", encryptPassword);
		map.put("user_nickname", user_nickname);
		map.put("user_email", user_email);
		
		biz.insertUser(map);	
		
	}
	


	

	
	
	@RequestMapping("idChk.do")
	@ResponseBody
	public Map<String, Boolean> idChk(String id) {
		logger.info("아이디 중복체크");
		
		System.out.println(id);
		boolean idChk = false;
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		if(biz.idCheck(id)== null) {
			idChk = true;
			map.put("idChk", idChk);
		}else {
			map.put("idChk", idChk);
		}
		
		return map;
	}

	@RequestMapping(value="nickChk.do", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Boolean> nickChk(String nickname){
		logger.info("닉네임 중복체크");
		System.out.println(nickname);
		boolean nickChk = false;
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if(biz.nickCheck(nickname) ==null) {
			nickChk = true;
			map.put("nickChk", nickChk);
		}else {
			map.put("nickChk", nickChk);
		}
		return map;
		
	}
	
	
	@RequestMapping(value="sendEmail.do", method=RequestMethod.GET)
	@ResponseBody
	public void sendEmail(String email) throws UnsupportedEncodingException, MessagingException {
		randompassword = MakeRandom.GetRandomPassword();
		System.out.println(randompassword);
		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPassword("dkdntvmfjs1");
		mailSender.setPort(587);
		mailSender.setUsername("outflearn@gmail.com");
		if(mailSender.getPort()==587) {
			Properties javaMailProperties = new Properties();
			javaMailProperties.setProperty("mail.smtp.starttls.enable", "true");
			mailSender.setJavaMailProperties(javaMailProperties);
		}
		
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, false, "UTF-8");
		helper.setFrom(new InternetAddress("outflearn@gmail.com", "아웃프런"));
		helper.setTo(new InternetAddress(email,""));
		System.out.println("email:" + email);
		helper.setSubject("[아웃프런]인증번호 test");
		helper.setText("<a><b style='color:blue;'>인증번호 : " +randompassword+"<a>", true);
		
		try {
			mailSender.send(msg);
		} catch (MailException ex) {
			logger.error("메일발송 실패", ex);
		}
		
	}
		
	
	@RequestMapping(value="emailCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Boolean> email_check(String ranNumPass) {
		
		
		boolean ranChk = false;
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		System.out.println(ranNumPass);
		System.out.println(randompassword);
		
		if(randompassword.equals(ranNumPass)) {
			ranChk = true;
			map.put("ranChk", ranChk);
		}else {
			map.put("idchk", ranChk);
		}
		
		return map;
	}
	


	
	
	
	
	

	
	

	
	
	


}
