package com.outflearn.Outflearn.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.outflearn.Outflearn.dto.MainStreamDto;
import com.outflearn.Outflearn.dto.RoadMapInfoDto;
import com.outflearn.Outflearn.dto.SubStreamDto;

@Repository
public class RoadMapDaoImpl implements RoadMapDao {
	
	@Inject
	SqlSessionTemplate session;

	//roadmap paege1 작성
	@Override
	public int insertRoadMap(RoadMapInfoDto dto) {
		
		int res = 0;
		
		try {
			session.insert(NAMESPACE+"roadmapInsert", dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	//현재 시퀀스 가져오기
	@Override
	public int selectSQ() {
		int seq = 0;
		System.out.println("selectSQ 들어옴");
		
		try {
			seq = session.selectOne(NAMESPACE+"selectSQ");
		}catch (Exception e) {
			e.printStackTrace();
		}	
	
		return seq;
	}

	//roadmap paege2 작성
	@Override
	public int insertroadNclass(String[] class_num, String seq) {
		
		System.out.println("insert roadNClassDao입장::::::::");
		
		for(String res : class_num) {
			System.out.println(res);
		}
		
				
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("seq",seq);
		
		Map<String, Object> staffMap;
		
		List<String> staffList = new ArrayList<>();
		
		for(int i=0; i<class_num.length; i++) {
			
			staffList.add(class_num[i]);
		}
		
		System.out.println("staffLsit"+staffList.size());		
		
		paramMap.put("staffList", staffList);
		
		return session.insert(NAMESPACE+"roadNclass", paramMap);
	}

	@Override
	public List<MainStreamDto> mainStreamList() {
		
		List<MainStreamDto> list = new ArrayList<MainStreamDto>();
		
		try {
			list = session.selectList(NAMESPACE+"mainStreamList");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<SubStreamDto> subStreamList() {
		
		List<SubStreamDto> list = new ArrayList<SubStreamDto>();
		
		try {
			session.selectList(NAMESPACE+"subStramList");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}




	
	



}
