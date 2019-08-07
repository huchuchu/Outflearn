package com.outflearn.Outflearn.model.biz;



import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.UserInfoDto;

@Service
public interface UserAuthBiz {
	
	public UserInfoDto selectUser(String user_id);
	
	int checkFailureCount(String username);


	
	
	

}
