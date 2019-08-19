package com.outflearn.Outflearn.model.dao;

import java.util.List;


import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.dto.connectUserClass;
import com.outflearn.Outflearn.dto.ClassReviewDto;

public interface LiveDao {
	
	String namespace = "live.";
	
	// Live
	public List<LiveDto> liveCalendar();
	public ClassInfoDto livePopup(int live_num);
	public List<ClassInfoDto> getMyClass(int user_num);
	public List<ClassInfoDto> liveRooms(String[] liveRooms);
	public ClassInfoDto getClassInfo(String class_num);
	
}
