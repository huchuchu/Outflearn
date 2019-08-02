package com.outflearn.Outflearn.model.biz;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.model.dao.LoginDao;

@Service
public class LoginBizImpl implements LoginBiz {
	
	
	@Inject
	private LoginDao dao;

	@Override
	public int insertUser(Map<String, String> map) {
		
		return dao.insertUser(map);
	}

	@Override
	public Map<String, Object> selectUSer(String user_id) {
		
		return dao.selectUSer(user_id);
	}

}
