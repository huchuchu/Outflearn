package com.outflearn.Outflearn.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.outflearn.Outflearn.dto.UserInfoDto;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		
		System.out.println("UserLoginSuccessHandler: 2");
		
		UserInfoDto dto = (UserInfoDto)authentication.getPrincipal();
		System.out.println(dto);
		String msg = authentication.getName()+"님 환영합니다";
		System.out.println(msg+"님 환영합니다");
		request.setAttribute("msg", msg);
		RequestDispatcher rd = request.getRequestDispatcher("/");
		rd.forward(request, response);	
		
	}

}
