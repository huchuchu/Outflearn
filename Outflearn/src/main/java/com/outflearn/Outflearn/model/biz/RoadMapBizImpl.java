package com.outflearn.Outflearn.model.biz;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.MainStreamDto;
import com.outflearn.Outflearn.dto.RoadMapInfoDto;
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



	



}
