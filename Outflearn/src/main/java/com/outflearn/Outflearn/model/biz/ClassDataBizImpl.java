package com.outflearn.Outflearn.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.ClassReviewDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.model.dao.ClassDataDao;


@Service
public class ClassDataBizImpl implements ClassDataBiz {
	
	@Autowired
	private ClassDataDao dao;



//	--------------------------------------------------- 강좌 정보(CLASS_INFO)
	@Override
	public List<ClassInfoDto> ClassInfoSelectList() {
		
		return dao.ClassInfoSelectList();
	}
	
	@Override
	public List<ClassInfoDto> CategorySelectList(String class_category) {
		return dao.CategorySelectList(class_category);
	}

	@Override
	public ClassInfoDto ClassInfoSelectOne(int class_num) {
		
		return dao.ClassInfoSelectOne(class_num);
	}

	@Override
	public int ClassInfoInsert(ClassInfoDto dto) {
		
		return dao.ClassInfoInsert(dto);
	}

//	---------------------------------------------------	강좌 소개(CLASS_INTRODUCE)
	@Override
	public List<ClassIntroduceDto> ClassIntroduceSelectList(int class_num) {
		
		return dao.ClassIntroduceSelectList(class_num);
	}
	

	@Override
	public int ClassIntroduceInsert(ClassIntroduceDto dto) {
	
		return dao.ClassIntroduceInsert(dto);
	}
	
//	--------------------------------------------------- 강좌 데이터(CLASS_DATA)
	
	@Override
	public List<ClassDataDto> ClassDataSelectList() {
	
		return dao.ClassDataSelectList();
	}
	
	@Override
	public ClassDataDto ClassDataSelectOne(int class_num) {
	
		return dao.ClassDataSelectOne(class_num);
	}
	
	@Override
	public int ClassDataInsert(ClassDataDto dto) {
		
		return dao.ClassDataInsert(dto);
	}
	
	@Override
	public int ClassChapterDataInsert(ClassDataDto dto) {
		
		return dao.ClassChapterDataInsert(dto);
	}
	


// ---------------------------------------------------	Live
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
	public List<ClassInfoDto> getWishList(int user_num) {
		return dao.getWishList(user_num);
	}

	@Override
	public List<ClassInfoDto> getSubscribe(int user_num) {
		return dao.getSubscribe(user_num);
	}
	
	@Override
	public List<ClassInfoDto> liveRooms(String[] liveRooms) {
		return dao.liveRooms(liveRooms);
	}
	
//	--------------------------------------------------- 댓글
	@Override
	public List<ClassReviewDto> ClassReviewSelectList(int class_num) {
	
		return dao.ClassReviewSelectList(class_num);
	}

	@Override
	public ClassReviewDto ClassReviewSelectOne(int review_num) {

		return dao.ClassReviewSelectOne(review_num);
	}

	@Override
	public int ClassReviewInsert(ClassReviewDto dto) {
		
		return dao.ClassReviewInsert(dto);
	}

	@Override
	public int ClassReviewUpdate(ClassReviewDto dto) {
	
		return dao.ClassReviewUpdate(dto);
	}

	@Override
	public int ClassReviewDelete(int review_num) {
		
		return dao.ClassReviewDelete(review_num);
	}

	@Override
	public int ClassReviewAnswer(ClassReviewDto dto, int parentBoard_no) {
		int parentboard_no = dto.getReview_num();
		
		  // update
	      int ClassReviewUpdateAnswer = dao.ClassReviewUpdateAnswer(parentboard_no);
	      
	      // insert
	      int ClassReviewInsertAnswer = dao.ClassReviewInsertAnswer(dto);
		
		return (ClassReviewUpdateAnswer + ClassReviewInsertAnswer);
	}



	

	



	

		
}
