package com.outflearn.Outflearn.model.dao;

import java.util.Map;

import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.dto.memberRegisterDto;

public interface LoginDao {
	
	String NAMESPACE = "auth.";
	
	public int insertUser(Map<String, String> map);
	
	public Map<String, Object> selectUSer(String user_id);
	
	
	public UserInfoDto loginDo(String id, String pw);
	
	public UserInfoDto loginChk(String id, String pw);
	
	public int register(Map<String, String> map);
	
	public memberRegisterDto idCheck(String id);
	
	public UserInfoDto nickCheck(String nickname);
	
	public UserInfoDto loginChkSns(String id);
	
	public boolean registChk(String id);
	
	public int registSns(UserInfoDto dto);
	
	public int updateUserInfo(UserInfoDto dto);
	
	public int updateUserPw(UserInfoDto dto);
	
	public int memberWithdraw(UserInfoDto dto);
	
	public UserInfoDto findId(String name, String nickname);
	
	public UserInfoDto findPw(String name, String id);
	
	public int changePw(String pw, String id);

	public int usersNameCheck(String name);
	
	

}
