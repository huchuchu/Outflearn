package com.outflearn.Outflearn.dto;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserInfoDto extends User {
	
	//User class : 사용자의 상세 정보를 담는 역할
	
	private int user_num;
	private String user_id;
	private String user_name;
	private String user_nickname;
	private String user_email;
	private String user_autority;
	

	public UserInfoDto(String username, String password, boolean enabled, 
			boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities, int user_num, String user_id, String user_name, String user_nickname, String user_email, String user_authority ){
		//userClass에 보내는 코드
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
		this.user_num = user_num;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
		this.user_email = user_email;
		this.user_autority = user_authority;
		
	}


	public String getUser_autority() {
		return user_autority;
	}


	public void setUser_autority(String user_autority) {
		this.user_autority = user_autority;
	}


	public int getUser_num() {
		return user_num;
	}


	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_nickname() {
		return user_nickname;
	}


	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	@Override
	public String toString() {
		return "UserInfoDto [user_num=" + user_num + ", user_id=" + user_id + ", user_name=" + user_name
				+ ", user_nickname=" + user_nickname + ", user_email=" + user_email + ", user_autority=" + user_autority
				+ "]";
	}


	

}
