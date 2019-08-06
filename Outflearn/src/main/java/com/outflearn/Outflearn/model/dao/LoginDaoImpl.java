package com.outflearn.Outflearn.model.dao;

import java.util.HashMap;

import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.dto.memberRegisterDto;

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

	@Override
	public UserInfoDto loginChk(String id, String pw) {
		UserInfoDto dto = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", id);
		map.put("userPw", pw);
		
		dto = sqlSession.selectOne(NAMESPACE + "loginChk", map);
		
		return dto;
	}

	@Override
	public int register(Map<String, String> map) {
		int res = 0;
		
		res = sqlSession.insert(NAMESPACE + "memberRegister", map); 
			
	
		return res;
	}

	@Override
	public memberRegisterDto idCheck(String id) {
		
		memberRegisterDto dto = null;
		
		System.out.println("아이디 유효성 검사중");
		
			dto = sqlSession.selectOne(NAMESPACE + "idChk", id);
				
		return dto;
	}

	@Override
	public UserInfoDto nickCheck(String nickname) {
		UserInfoDto dto = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("nickname", nickname);
		
		System.out.println("닉네임 유효성 검사중");
		
		dto = sqlSession.selectOne(NAMESPACE + "nickChk", map);
		
		return dto;
	}

	
	  @Override public UserInfoDto loginChkSns(String id) {
	 /* 
	  UserInfoDto dto = new UserInfoDto();
	  
	  Map<String, String> map = new HashMap<String, String>(); map.put("userId",
	  id);
	  
	  dto = sqlSession.selectOne(NAMESPACE + "loginChkSns", map);
	 */ 
	  return null; }
	 

	
	  @Override public boolean registChk(String id) { 
		
		  boolean temp = false;
	  /*
	  UserInfoDto dto = new UserInfoDto();
	  
	  Map<String, String> map = new HashMap<String, String>(); map.put("userId",
	  id);
	  
	  dto = sqlSession.selectOne(NAMESPACE + "registChk", map); if(dto == null) {
	  temp = true; } else { temp = false; }
	 */  
	  return temp; }
	

	@Override
	public int registSns(UserInfoDto dto) {
		int res = 0;
		
		res = sqlSession.insert(NAMESPACE + "registSns", dto);
			if(res>0) {
				sqlSession.commit();
			}
		
		return res;
	}

	@Override
	public int updateUserInfo(UserInfoDto dto) {
		int res = 0;
		
		res = sqlSession.update(NAMESPACE + "updateUserInfo", dto);
			
			if(res>0) {
				sqlSession.commit();
			}
		
		return res;
	}

	@Override
	public int updateUserPw(UserInfoDto dto) {
		int res = 0;
		
		res = sqlSession.update(NAMESPACE + "updateUserPw", dto);
			
			if(res>0) {
				sqlSession.commit();
			}
		
		return res;
	}

	@Override
	public int memberWithdraw(UserInfoDto dto) {

		return 0;
	}

	@Override
	public UserInfoDto findId(String name, String nickname) {
		/*
		System.out.println("이메일 가져오기");
		System.out.println(name+" "+nickname);
		UserInfoDto dto = new UserInfoDto();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userName", name);
		map.put("userNickname", nickname);
		
		System.out.println(map);
		
		dto = sqlSession.selectOne(NAMESPACE + "bringByname", map);
		
		System.out.println(dto);
		*/
		return null;
	}

	@Override
	public UserInfoDto findPw(String name, String id) {
		/*
		System.out.println("이메일 가져오기");
		System.out.println(name+" "+id);
		UserInfoDto dto = new UserInfoDto();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userName", name);
		map.put("userId", id);
		System.out.println(map);
		
		dto = sqlSession.selectOne(NAMESPACE+"bringByid", map);
		
		System.out.println(dto);
		*/
		return null;
	}

	@Override
	public int changePw(String pw, String id) {
		int res = 1;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userPw", pw);
		map.put("userId", id);
			
		res = sqlSession.insert(NAMESPACE + "changePw", map);
		
		return res;
	}

	public UserInfoDto userAuth(UserInfoDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object emailChk(String email) {
		
		return sqlSession.selectOne(NAMESPACE + "checkEmail", email);
	}

	@Override
	public int usersNameCheck(String name) {
		// TODO Auto-generated method stub
		return 0;
	}



}
