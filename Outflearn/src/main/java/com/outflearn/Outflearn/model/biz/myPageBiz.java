package com.outflearn.Outflearn.model.biz;

import java.util.List;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.dto.QADto;
import com.outflearn.Outflearn.dto.RoadMapCon;
import com.outflearn.Outflearn.dto.connectUserClass;
import com.outflearn.Outflearn.dto.ClassReviewDto;

public interface myPageBiz {
		
		public List<ClassInfoDto> getPreBasketClass(int user_num);
		public List<ClassInfoDto> getPreSubscribe(int user_num);
		public List<RoadMapCon> getPreSubRoadmap(int user_num);
		public List<QADto> getPreQA(int user_num);
		
		public List<ClassInfoDto> getBasketClass(int user_num);
		public List<ClassInfoDto> getSubscribe(int user_num);
		public List<RoadMapCon> getSubRoadmap(int user_num);
		public List<QADto> getQA(int user_num);
		
	
}
