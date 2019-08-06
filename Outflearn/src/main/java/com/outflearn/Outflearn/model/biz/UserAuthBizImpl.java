package com.outflearn.Outflearn.model.biz;



import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.dao.UserAuthDao;
import com.outflearn.Outflearn.model.dao.UserAuthDaoImpl;

@Service
public class UserAuthBizImpl implements UserAuthBiz {
	
	@Inject
	UserAuthDaoImpl dao;	

	@Override
	public UserInfoDto selectUser(String user_id) {
		
		return dao.selectUser(user_id);
	}

	@Override
	public int checkFailureCount(String username) {
		
		return dao.checkFailureCount(username);
	}






}
