package com.outflearn.Outflearn.model.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.outflearn.Outflearn.dto.UserInfoDto;

@Repository
public class UserAuthDaoImpl implements UserAuthDao {

	@Inject
	SqlSessionTemplate sqlSession;
	
	@Override
	public UserInfoDto selectUser(String user_id) {
		
		return sqlSession.selectOne(NAMESPACE+"selectUser", user_id);
	}

	@Override
	public void countFailure(String username) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int checkFailureCount(String username) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void disabledUsername(String username) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void resetFailureCnt(String username) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAccessDate(String username) {
		// TODO Auto-generated method stub
		
	}

}
