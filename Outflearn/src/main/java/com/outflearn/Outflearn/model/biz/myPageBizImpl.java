package com.outflearn.Outflearn.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.QADto;
import com.outflearn.Outflearn.dto.RoadMapCon;
import com.outflearn.Outflearn.dto.RoadMapInfoDto;
import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.dao.myPageDao;


@Service
public class myPageBizImpl implements myPageBiz {
	
	@Autowired
	private myPageDao dao;
	@Override
	public List<ClassInfoDto> getBasketClass(int user_num) {
		return dao.getBasketClass(user_num);
	}

	@Override
	public List<ClassInfoDto> getSubscribe(int user_num) {
		return dao.getSubscribe(user_num);
	}

	@Override
	public List<RoadMapCon> getSubRoadmap(int user_num) {
		return dao.getSubRoadmap(user_num);
	}

	@Override
	public List<QADto> getQA(int user_num) {
		return dao.getQA(user_num);
	}
	
	@Override
	public List<ClassInfoDto> getPreBasketClass(int user_num) {
		return dao.getPreBasketClass(user_num);
	}

	@Override
	public List<ClassInfoDto> getPreSubscribe(int user_num) {
		return dao.getPreSubscribe(user_num);
	}

	@Override
	public List<RoadMapCon> getPreSubRoadmap(int user_num) {
		return dao.getPreSubRoadmap(user_num);
	}

	@Override
	public List<QADto> getPreQA(int user_num) {
		return dao.getPreQA(user_num);
	}

	@Override
	public List<ClassInfoDto> getPreMyClass(int user_num) {
		return dao.getPreMyClass(user_num);
	}
	
	@Override
	public int reqLecturer(String lecturerNum, String lecturerPhone, String lecturerIntro, String lecturerClass) {
		
		Map<String, String> map =  new HashMap<String, String>();
		
		map.put("lecturerNum", lecturerNum);
		map.put("lecturerPhone", lecturerPhone);
		map.put("lecturerIntro", lecturerIntro);
		map.put("lecturerClass", lecturerClass);
		
		return dao.reqLecturer(map);
	}
	
//강사
	
	@Override
	public int setLiveSchedule(String setClass, String setTitle, String setDate, String setAuthor) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("setClass", setClass);
		map.put("setTitle", setTitle);
		map.put("setDate", setDate);
		map.put("setAuthor", setAuthor);
		
		return dao.setLiveSchedule(map);
	}
	
	@Override
	public List<ClassInfoDto> myClass(int user_num) {
		return dao.myClass(user_num);
	}
	
	@Override
	public int deleteClass(String class_num) {
		return dao.deleteClass(class_num);
	}
	
	@Override
	public List<RoadMapInfoDto> myRoadmap(int user_num) {
		return dao.myRoadmap(user_num);
	}
	
	@Override
	public int deleteRoadmap(String roadmap_num) {
		return dao.deleteRoadmap(roadmap_num);
	}
	
//관리자	

	@Override
	public List<Map<String, String>> getReqLecturer() {
		return dao.getReqLecturer();
	}

	@Override
	public List<Map<String, String>> getUserList() {
		return dao.getUserList();
	}

	@Override
	public List<Map<String, String>> getPreReqLecturer() {
		return dao.getPreReqLecturer();
	}

	@Override
	public List<Map<String, String>> getPreUserList() {
		return dao.getPreUserList();
	}

	@Override
	public int acceptReq(String user_num) {
		return dao.acceptReq(user_num);
	}

	@Override
	public int deniReq(String user_num) {
		return dao.deniReq(user_num);
	}

	@Override
	public int userEnabled(String user_num) {
		return dao.userEnabled(user_num);
	}

	@Override
	public int userDisabled(String user_num) {
		return dao.userDisabled(user_num);
	}
		
}
