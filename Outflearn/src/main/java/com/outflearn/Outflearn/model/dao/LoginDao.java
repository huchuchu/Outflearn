package com.outflearn.Outflearn.model.dao;

import java.util.Map;

import com.outflearn.Outflearn.dto.UserInfoDto;

public interface LoginDao {
	
	String NAMESPACE = "auth.";
	
	public int insertUser(Map<String, String> map);
	
	public Map<String, Object> selectUSer(String user_id);

}
