package com.outflearn.Outflearn.model.dao;

import com.outflearn.Outflearn.dto.UserInfoDto;

public interface LoginDao {
	
	String NAMESPACE = "auth.";
	
	public UserInfoDto loginDo(String id, String pw);

}
