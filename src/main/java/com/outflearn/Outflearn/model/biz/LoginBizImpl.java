package com.outflearn.Outflearn.model.biz;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.dao.LoginDao;
import com.outflearn.Outflearn.model.dao.LoginDaoImpl;

@Service
public class LoginBizImpl implements LoginBiz {
	
	
	@Inject
	private LoginDaoImpl dao;

	@Override
	public int insertUser(Map<String, String> map) {
		
		return dao.insertUser(map);
	}

	@Override
	public Map<String, Object> selectUSer(String user_id) {
		
		return dao.selectUSer(user_id);
	}

	@Override
	public UserInfoDto loginDo(String id, String pw) {
		return dao.loginDo(id, pw);
	}
	
	@Override
	public UserInfoDto loginChk(String userId, String userPw) {
		return dao.loginChk(userId, userPw);
	}

	@Override
	public int register(Map<String, String> map) {
		return dao.register(map);
	}

	@Override
	public UserInfoDto idCheck(String id) {
		
		return dao.idCheck(id);
	}

	@Override
	public UserInfoDto nickCheck(String nickname) {
		return dao.nickCheck(nickname);
	}

	@Override
	public UserInfoDto loginChkSns(String id) {
		return dao.loginChkSns(id);
	}

	@Override
	public boolean registChk(String id) {
		return dao.registChk(id);
	}

	@Override
	public int registSns(UserInfoDto dto) {
		return dao.registSns(dto);
	}

	@Override
	public int updateUserInfo(UserInfoDto dto) {
		return dao.updateUserInfo(dto);
	}

	@Override
	public int updateUserPw(UserInfoDto dto) {
		return dao.updateUserPw(dto);
	}

	@Override
	public int memberWithdraw(UserInfoDto dto) {
		return dao.memberWithdraw(dto);
	}

	@Override
	public UserInfoDto findId(String name, String nickname) {
		return dao.findId(name, nickname);
	}

	@Override
	public UserInfoDto findPw(String name, String id) {
		return dao.findPw(name, id);
	}

	@Override
	public int changePw(String pw, String id) {
		return dao.changePw(pw, id);
	}

	@Override
	public boolean usersNameCheck(String name) {
		boolean isCheck=false;
        int check=dao.usersNameCheck(name);
        // 0보다 크면 중복이 존재 true 반환
        if(check>0) {
            isCheck=true;
        }else {
            // 0이면 중복 없음.
            isCheck=false;
        }
        return isCheck;
	}



	@Override
	public UserInfoDto userAuth(UserInfoDto dto) {
		return dao.userAuth(dto);
	}

	@Override
	public Object emailChk(String email) {
		return dao.emailChk(email);
	}

	
}
