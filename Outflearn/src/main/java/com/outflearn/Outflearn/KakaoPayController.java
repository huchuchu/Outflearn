package com.outflearn.Outflearn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.outflearn.Outflearn.service.KakaoRestapi;
@Controller
public class KakaoPayController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private KakaoRestapi kakaopay;
	
	
	@RequestMapping(value="oauth", method=RequestMethod.GET)
	public void	kakaoPayGet() { 
		
	}
	
	
	@RequestMapping(value="oauth", method=RequestMethod.POST)
	public String kakaoPay() {
		
		return "redirect:"+kakaopay.kakaoPayReady();
	}
	
	@RequestMapping(value="kakaoPaySuccess")
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		logger.info("kakaoPaySuccess get");
		logger.info("kakaoPaySuccess pg_token : " + pg_token);
		
		model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
		
	}
}
