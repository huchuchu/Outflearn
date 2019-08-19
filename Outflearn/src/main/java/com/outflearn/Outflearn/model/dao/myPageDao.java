package com.outflearn.Outflearn.model.dao;

import java.util.List;


import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.dto.RoadMapCon;
import com.outflearn.Outflearn.dto.connectUserClass;
import com.outflearn.Outflearn.dto.ClassReviewDto;

public interface myPageDao {
	
	String namespace = "myPage.";
	
	public List<ClassInfoDto> getWishList(int user_num);
	public List<ClassInfoDto> getSubscribe(int user_num);
	public List<RoadMapCon> getSubRoadmap(int user_num);

}
