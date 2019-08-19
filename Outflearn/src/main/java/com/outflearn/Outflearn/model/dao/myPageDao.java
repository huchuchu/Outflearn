package com.outflearn.Outflearn.model.dao;

import java.util.List;


import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.RoadMapCon;

public interface myPageDao {
	
	String namespace = "myPage.";
	
	public List<ClassInfoDto> getWishList(int user_num);
	public List<ClassInfoDto> getSubscribe(int user_num);
	public List<RoadMapCon> getSubRoadmap(int user_num);

}
