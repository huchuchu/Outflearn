package com.outflearn.Outflearn.model.biz;

import java.util.List;

import com.outflearn.Outflearn.dto.ClassCategoryDto;
import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.ClassReviewDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.dto.MainStreamDto;
import com.outflearn.Outflearn.dto.SubStreamDto;

public interface ClassDataBiz {
	
		// 강좌 정보  - CLASS_INFO 테이블
		public List <ClassInfoDto> ClassInfoSelectList();
		public List<ClassInfoDto> CategorySelectList(String class_category);
		public ClassInfoDto ClassInfoSelectOne(int class_num);
		public List<ClassInfoDto>  classInfoSelectListUser(int user_num);
		public int ClassInfoInsert(ClassInfoDto dto);
		
	
		// 강좌 소개 - CLASS_INTRODUCE 테이블
		public ClassIntroduceDto ClassIntroduceSelectList(int class_num);
		public int ClassIntroduceInsert(ClassIntroduceDto dto);
	
		
		// 강좌 데이터 -  CLASS_DATA 테이블
		public List <ClassDataDto> ClassDataSelectList();
		public ClassDataDto ClassDataSelectOne(int class_num);
		public int ClassDataInsert(ClassDataDto dto);		
		public int ClassChapterDataInsert(ClassDataDto dto);
		
		// 장바구니 - BASKET 테이블
		public int classBasketInsert(ClassInfoDto dto);
		public int classBasketDelete(int class_num);
		
		// 댓글 - CLASS_REVIEW 테이블
		public List <ClassReviewDto> ClassReviewSelectList(int class_num);
		public ClassReviewDto ClassReviewSelectOne(int review_num);
		public int ClassReviewInsert(ClassReviewDto dto);
		public int ClassReviewUpdate(ClassReviewDto dto);
		public int ClassReviewDelete(int review_num);
		
		public int ClassReviewAnswer(ClassReviewDto dto, int parentBoard_no);
		public int ClassReviewInsertAnswer(ClassReviewDto dto);
		
		// 주류, 부류 - MAIN_STREAM , SUB_STREAM
		public int mainStreamInsert(MainStreamDto dto);
		public int subStreamInsert(SubStreamDto dto);
		public int ClassCategoryInsert(ClassCategoryDto dto);


	
		//페이징
		public List<ClassInfoDto> selectListPage(int firstIndex, int recordCountPerPage, String txt_search );
		public int selectTotalCount(String txt_search);
		public List<ClassInfoDto> selectListPage(int firstIndex, int recordCountPerPage, String txt_search , String searchOption);
		public int selectTotalCount(String searchOption, String txt_search);
}
