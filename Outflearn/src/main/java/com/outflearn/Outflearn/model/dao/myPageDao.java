package com.outflearn.Outflearn.model.dao;

import java.util.List;
import java.util.Map;

import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.QADto;
import com.outflearn.Outflearn.dto.RoadMapCon;
import com.outflearn.Outflearn.dto.UserInfoDto;

public interface myPageDao {
	
	String namespace = "myPage.";
	
	public List<ClassInfoDto> getPreBasketClass(int user_num);
	public List<ClassInfoDto> getPreSubscribe(int user_num);
	public List<RoadMapCon> getPreSubRoadmap(int user_num);
	public List<QADto> getPreQA(int user_num);
	
	public List<ClassInfoDto> getBasketClass(int user_num);
	public List<ClassInfoDto> getSubscribe(int user_num);
	public List<RoadMapCon> getSubRoadmap(int user_num);
	public List<QADto> getQA(int user_num);
	
	public int reqLecturer(Map<String, String> map);
	
//관리자
	
	public List<Map<String, String>> getReqLecturer();
	public List<Map<String, String>> getUserList();
	
	public List<Map<String, String>> getPreReqLecturer();
	public List<Map<String, String>> getPreUserList();
	
	public int acceptReq(String user_num);
	public int deniReq(String user_num);
	
	public int userEnabled(String user_num);
	public int userDisabled(String user_num);
	
}
