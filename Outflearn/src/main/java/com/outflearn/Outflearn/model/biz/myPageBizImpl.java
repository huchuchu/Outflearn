package com.outflearn.Outflearn.model.biz;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.dto.RoadMapCon;
import com.outflearn.Outflearn.dto.connectUserClass;
import com.outflearn.Outflearn.dto.ClassReviewDto;
import com.outflearn.Outflearn.model.dao.ClassDataDao;
import com.outflearn.Outflearn.model.dao.myPageDao;


@Service
public class myPageBizImpl implements myPageBiz {
	
	@Autowired
	private myPageDao dao;

	@Override
	public List<ClassInfoDto> getWishList(int user_num) {
		return dao.getWishList(user_num);
	}

	@Override
	public List<ClassInfoDto> getSubscribe(int user_num) {
		return dao.getSubscribe(user_num);
	}

	@Override
	public List<RoadMapCon> getSubRoadmap(int user_num) {
		return dao.getSubRoadmap(user_num);
	}

		
}
