package com.outflearn.Outflearn.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;



public class UserDeniedHandler implements AccessDeniedHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDeniedHandler.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		logger.info("exception : {}", accessDeniedException);
		logger.info("localozeMessage : {} ", accessDeniedException.getLocalizedMessage());
		logger.info("Message : {}", accessDeniedException.getMessage());
		logger.info("StackTrace : {}", accessDeniedException.getStackTrace());
		
	
		request.setAttribute("errMsg", accessDeniedException.getMessage());		
		request.getRequestDispatcher("/WEB-INF/views/denied.jsp").forward(request, response);
		
	}

}
