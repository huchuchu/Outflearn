package com.outflearn.Outflearn.model.dao;



import org.springframework.stereotype.Repository;

import com.outflearn.Outflearn.dto.UserInfoDto;

@Repository
public interface UserAuthDao {
	
	String NAMESPACE = "userAuth.";
	
	public UserInfoDto selectUser(String user_id);
	
	void countFailure(String username);

	int checkFailureCount(String username);

	void disabledUsername(String username);

	void resetFailureCnt(String username);

	void updateAccessDate(String username);


}
