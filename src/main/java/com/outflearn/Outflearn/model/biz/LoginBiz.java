package com.outflearn.Outflearn.model.biz;

import com.outflearn.Outflearn.dto.UserInfoDto;

public interface LoginBiz {
	
	public UserInfoDto loginDo(String id, String pw);

}
