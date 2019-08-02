package com.outflearn.Outflearn.model.biz;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.UserInfoDto;

@Service
public interface LoginBiz {
	
	public int insertUser(Map<String, String> map);
	
	public Map<String, Object> selectUSer(String user_id);

}
