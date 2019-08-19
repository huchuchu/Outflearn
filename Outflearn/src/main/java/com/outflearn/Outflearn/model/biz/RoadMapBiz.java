package com.outflearn.Outflearn.model.biz;

import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.MainStreamDto;
import com.outflearn.Outflearn.dto.RoadMapInfoDto;
import com.outflearn.Outflearn.dto.SubStreamDto;

@Service
public interface RoadMapBiz {

	public int insertRoadMap(RoadMapInfoDto dto);
	
	public int selectSQ();
	
	public int insertroadNclass(@RequestParam String[] class_num, @RequestParam String seq);
	
	public List<MainStreamDto> mainStreamList();
	
	public List<SubStreamDto> subStreamList() ;
	
	public List<ClassInfoDto> classInfoList(String[] subFilter);

}
