package com.outflearn.Outflearn.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.filter.OAuth2ClientAuthenticationProcessingFilter;
import org.springframework.security.oauth2.client.filter.OAuth2ClientContextFilter;
import org.springframework.security.oauth2.client.token.grant.code.AuthorizationCodeResourceDetails;
import org.springframework.security.oauth2.client.token.grant.implicit.ImplicitResourceDetails;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;

import com.outflearn.Outflearn.model.biz.LoginBizImpl;

@Configuration
@EnableOAuth2Client
public class UserOAuth2ClientConfig {

	@Autowired
	OAuth2ClientContext oauth2ClientContext;
	
	@Autowired
	LoginBizImpl lobinBiz;
	
	@Bean
	@Value("${security.oauth2.client}")
	AuthorizationCodeResourceDetails github() {
		return new AuthorizationCodeResourceDetails();
		
	}
	
	@Bean
	@Value("${security.oauth2.resource}")
	ImplicitResourceDetails githubResource() {
		return new ImplicitResourceDetails();
	}
	
	@Bean("sso.filter")
	Filter ssoFilter() {
		List<Filter> filters = new ArrayList<>();
		
		//github
		OAuth2ClientAuthenticationProcessingFilter github
		= new OAuth2ClientAuthenticationProcessingFilter("/sign-in/github");
	github.setRestTemplate(new OAuth2RestTemplate(github(), oauth2ClientContext));	
	github.setTokenServices(new UserTokenServices(githubResource().getUserInfoUri(), github().getClientId());
	);
	}
}
