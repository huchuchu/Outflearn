package com.outflearn.Outflearn.model.biz;

import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.MainStreamDto;
import com.outflearn.Outflearn.dto.RoadMapCon;
import com.outflearn.Outflearn.dto.RoadMapInfoDto;
import com.outflearn.Outflearn.dto.RoadUserCombineDto;
import com.outflearn.Outflearn.dto.SubStreamDto;

@Service
public interface RoadMapBiz {

	public int insertRoadMap(RoadMapInfoDto dto);
	
	public int selectSQ();
	
	public int insertroadNclass(@RequestParam String[] class_num, @RequestParam String seq);
	
	public List<MainStreamDto> mainStreamList();
	
	public List<SubStreamDto> subStreamList() ;	
	
	public List<ClassInfoDto> classInfoList(String[] subFilter);
	
	public List<RoadMapInfoDto> roadMapList();
	
	public RoadMapInfoDto selectOneRoadMap(String roadNum);
	
	public List<RoadMapCon> RoadMapConList(String roadNum);
	
	public List<ClassInfoDto> RoadClassInfoList(List<Integer> list);
	
	public int roadMapSubscribeInsert(String roadNum, String userNum);
	
	public int updateRoadSubscribe(String roandNum);
	
	public int roadJoinChk(String roadNum, String userNum);

	public List<RoadMapInfoDto> selectListPage(int firstIndex, int recordCountPerPage, String txt_search, String searchOption);
	
	public int selectTotalCountRoadMap(String txt_search, String searchOption);

	public List<RoadUserCombineDto> roadMapComList(int firstIndex, int recordCountPerPage, String txt_search,
			String searchOption);
}
