package com.outflearn.Outflearn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.biz.ClassDataBiz;
import com.outflearn.Outflearn.service.KakaoRestapi;
@Controller
public class KakaoPayController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	public ClassDataBiz biz;
	
	@Autowired
	private KakaoRestapi kakaopay;
	
	
	@RequestMapping(value="oauth", method=RequestMethod.GET)
	public void	kakaoPayGet() { 
		
	}
	
	
	@RequestMapping(value="oauth", method=RequestMethod.POST)
	public String kakaoPay(String class_title, int class_price) {
		
		return "redirect:"+kakaopay.kakaoPayReady(class_title, class_price);
	}
	
	@RequestMapping(value="kakaoPaySuccess")
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, Authentication auth) {
		logger.info("kakaoPaySuccess get");
		logger.info("kakaoPaySuccess pg_token : " + pg_token);
		
		// 회원
		UserInfoDto uDto = (UserInfoDto) auth.getPrincipal();
		int user_num = uDto.getUser_num();
		
		
		// 장바구니 삭제
		biz.classBasketDelete(user_num);
		
	}
	
}
