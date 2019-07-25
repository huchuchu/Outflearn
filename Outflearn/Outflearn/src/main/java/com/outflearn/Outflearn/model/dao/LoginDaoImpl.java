package com.outflearn.Outflearn.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.outflearn.Outflearn.dto.UserInfoDto;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public UserInfoDto loginDo(String id, String pw) {

		UserInfoDto dto = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);

		try {
			dto = sqlSession.selectOne(NAMESPACE + "login", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

}
