package com.outflearn.Outflearn.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.dao.LoginDao;

@Service
public class LoginBizImpl implements LoginBiz{

	@Autowired
	private LoginDao dao;
	
	@Override
	public UserInfoDto loginDo(String id, String pw) {
		return dao.loginDo(id, pw);
	}

}
