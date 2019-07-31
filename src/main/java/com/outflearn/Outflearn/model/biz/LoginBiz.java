package com.outflearn.Outflearn.model.biz;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.UserInfoDto;

@Service
public interface LoginBiz {
	
	public int insertUser(Map<String, String> map);
	
	public Map<String, Object> selectUSer(String user_id);
	
	public UserInfoDto loginDo(String id, String pw);
	
	public UserInfoDto loginChk(String id, String pw);
	
	public int register(Map<String, String> map);
	
	public UserInfoDto idCheck(String id);
	
	public UserInfoDto nickCheck(String nickname);
	
	public UserInfoDto loginChkSns(String id);
	
	public boolean registChk(String id);
	
	public int registSns(UserInfoDto dto);
	
	public int updateUserInfo(UserInfoDto dto);
	
	public int updateUserPw(UserInfoDto dto);
	
	public int memberWithdraw(UserInfoDto dto);
	
	public UserInfoDto findId(String name, String nickname);
	
	public UserInfoDto findPw(String name, String id);
	
	public int changePw(String password, String id);

	public boolean usersNameCheck(String name);

	public UserInfoDto userAuth(UserInfoDto dto);

	public Object emailChk(String email);
	

}
