package com.outflearn.Outflearn.model.biz;

import java.util.List;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.ClassReviewDto;

public interface ClassDataBiz {
	
		// 강좌 데이터 -  CLASS_DATA TABLE
		public List <ClassDataDto> ClassDataSelectList();
		public ClassDataDto ClassDataSelectOne(int class_num);
		public int ClassDataInsert(ClassDataDto dto);
		public int classDataSelfInsert(ClassDataDto dto);		
		public int ClassChapterDataInsert(ClassDataDto dto);
		public int ClassDataUpdate(ClassDataDto dto);
		public int ClassDataDelete(String data_subhead);
		
		// 강좌 정보  - CLASS_INFO 테이블
		public List <ClassInfoDto> ClassInfoSelectList();
		public ClassInfoDto ClassInfoSelectOne(int class_num);
		public int ClassInfoInsert(ClassInfoDto dto);
		public int ClassInfoUpdate(ClassInfoDto dto);
		public int ClassInfoDelete(String class_title);
		
		// 강좌 소개 - CLASS_INTRODUCE 테이블
		public List <ClassIntroduceDto> ClassIntroduceSelectList();
		public ClassInfoDto ClassIntroduceSelectOne(int class_num);
		public int ClassIntroduceInsert(ClassIntroduceDto dto);
		public int ClassInfoUpdate(ClassIntroduceDto dto);
		public int ClassIntroduceDelete(String class_content);
		
		// 댓글 - CLASS_REVIEW 테이블
		public List <ClassReviewDto> ClassReviewSelectList(int class_num);
		public ClassReviewDto ClassReviewSelectOne(int board_no);
		public int ClassReviewInsert(ClassReviewDto dto);
		public int ClassReviewUpdate(ClassReviewDto dto);
		public int ClassReviewDelete(int board_no);
		
		public int ClassReviewAnswer(ClassReviewDto dto, int parentBoard_no);
	
}
