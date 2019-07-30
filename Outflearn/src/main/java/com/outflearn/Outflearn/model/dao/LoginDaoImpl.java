package com.outflearn.Outflearn.model.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.outflearn.Outflearn.dto.UserInfoDto;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Inject
	SqlSessionTemplate sqlSession;


	@Override
	public int insertUser(Map<String, String> map) {
	
		return sqlSession.insert(NAMESPACE+"insertUser", map);
	}

	@Override
	public Map<String, Object> selectUSer(String user_id) {
		
		return sqlSession.selectOne(NAMESPACE+"selectUser", user_id);
	}


}
