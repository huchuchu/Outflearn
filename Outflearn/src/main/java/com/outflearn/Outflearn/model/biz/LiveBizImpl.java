package com.outflearn.Outflearn.model.biz;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.dto.connectUserClass;
import com.outflearn.Outflearn.dto.ClassReviewDto;
import com.outflearn.Outflearn.model.dao.ClassDataDao;
import com.outflearn.Outflearn.model.dao.LiveDao;


@Service
public class LiveBizImpl implements LiveBiz {
	
	@Autowired
	private LiveDao dao;

	@Override
	public List<LiveDto> liveCalendar() {
		return dao.liveCalendar();
	}

	@Override
	public ClassInfoDto livePopup(int live_num) {
		return dao.livePopup(live_num);
	}

	@Override
	public List<ClassInfoDto> getMyClass(int user_num) {
		return dao.getMyClass(user_num);
	}

	@Override
	public List<ClassInfoDto> liveRooms(String[] liveRooms) {
		return dao.liveRooms(liveRooms);
	}

	@Override
	public ClassInfoDto getClassInfo(String class_num) {
		return dao.getClassInfo(class_num);
	}
	
}
