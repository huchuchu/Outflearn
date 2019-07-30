package com.outflearn.Outflearn;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.biz.LoginBiz;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginBiz biz;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "loginDo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> loginDo(String id, String pw, HttpSession session) {

		UserInfoDto dto = biz.loginDo(id, pw);

		boolean loginChk = false;

		if (dto != null) {
			session.setAttribute("UserInfo", dto);
			loginChk = true;
		}

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("loginChk", loginChk);

		return map;
	}

}
