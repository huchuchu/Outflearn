package com.outflearn.Outflearn.model.biz;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.MainStreamDto;
import com.outflearn.Outflearn.dto.RoadMapCon;
import com.outflearn.Outflearn.dto.RoadMapInfoDto;
import com.outflearn.Outflearn.dto.RoadUserCombineDto;
import com.outflearn.Outflearn.dto.SubStreamDto;
import com.outflearn.Outflearn.model.dao.RoadMapDao;

@Service
public class RoadMapBizImpl implements RoadMapBiz {
	
	@Inject
	RoadMapDao dao;

	@Override
	public int insertRoadMap(RoadMapInfoDto dto) {
		
		return dao.insertRoadMap(dto);
	}

	@Override
	public int selectSQ() {
		
		return dao.selectSQ();
	}

	@Override
	public int insertroadNclass(String[] class_num, String seq) {
		
		return dao.insertroadNclass(class_num, seq);
	}

	@Override
	public List<MainStreamDto> mainStreamList() {
		
		return dao.mainStreamList();
	}

	@Override
	public List<SubStreamDto> subStreamList() {
		
		return dao.subStreamList();
	}
	
	@Override
	public List<ClassInfoDto> classInfoList(String[] subFilter) {
		
		return dao.classInfoList(subFilter);
	}

	@Override
	public List<RoadMapInfoDto> roadMapList() {
		
		return dao.roadMapList();
	}

	@Override
	public RoadMapInfoDto selectOneRoadMap(String roadNum) {
	
		return dao.selectOneRoadMap(roadNum);
	}

	@Override
	public List<Integer> RoadMapConList(String roadNum) {
		
		return dao.RoadMapConList(roadNum);
	}

	@Override
	public List<ClassInfoDto> RoadClassInfoList(List<Integer> list) {
		
		return dao.RoadClassInfoList(list);
	}

	@Override
	public int roadMapSubscribeInsert(String roadNum, String userNum) {
		
		return dao.roadMapSubscribeInsert(roadNum, userNum);
	}

	@Override
	public int updateRoadSubscribe(String roandNum) {
		
		return dao.updateRoadSubscribe(roandNum);
	}

	@Override
	public int roadJoinChk(String roadNum, String userNum) {
		
		return dao.roadJoinChk(roadNum, userNum);
	}

	@Override
	public int roadMapSubscribeDelete(String roadNum, String userNum) {
		
		return dao.roadMapSubscribeDelete(roadNum, userNum);
	}

	@Override
	public int deleteRoadSubscribe(String roadNum) {
		
		return dao.deleteRoadSubscribe(roadNum);
	}

	@Override
	public List<RoadUserCombineDto> roadMapComList() {
		
		return dao.roadMapComList();
	}

	@Override
	public RoadUserCombineDto roadMapComSelectOne(String roadNum) {
		
		return dao.roadMapComSelectOne(roadNum);
	}
	
	@Override
	public List<RoadMapInfoDto> selectListPage(int firstIndex, int recordCountPerPage, String txt_search,
			String searchOption) {
		return dao.selectListPage(firstIndex, recordCountPerPage, txt_search, searchOption);
	}

	@Override
	public int selectTotalCountRoadMap(String txt_search, String searchOption) {
		
		return dao.selectTotalCountRoadMap(txt_search, searchOption);
	}





}
