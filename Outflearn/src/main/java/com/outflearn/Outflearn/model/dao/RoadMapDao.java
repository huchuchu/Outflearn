package com.outflearn.Outflearn.model.dao;

import java.util.List;


import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.MainStreamDto;
import com.outflearn.Outflearn.dto.RoadMapInfoDto;
import com.outflearn.Outflearn.dto.SubStreamDto;

@Repository
public interface RoadMapDao {
	
	String NAMESPACE = "road.";
	
	public int insertRoadMap(RoadMapInfoDto dto);
	
	public int selectSQ();
	
	public int insertroadNclass(@RequestParam String[] class_num, @RequestParam String seq);	
	
	public List<MainStreamDto> mainStreamList();
	
	public List<SubStreamDto> subStreamList() ;
	
	public List<ClassInfoDto> classInfoList(String[] subFilter);
	
	public List<RoadMapInfoDto> roadMapList();
	
	public RoadMapInfoDto selectOneRoadMap(String roadNum);
	
	public List<RoadMapInfoDto> selectListPage(int firstIndex, int recordCountPerPage, String txt_search, String searchOption);
	
	public int selectTotalCountRoadMap(String txt_search, String searchOption);

	public int selectTotalCountRoadMapTwo(String txt_search, String searchOption, String class_category);

	public List<RoadMapInfoDto> selectListPageTwo(int firstIndex, int recordCountPerPage, String txt_search,
			String searchOption, String class_category);
}
