package com.outflearn.Outflearn.model.biz;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.model.dao.ClassDataDao;


@Service
public class ClassDataBizImpl implements ClassDataBiz {
	
	@Autowired
	private ClassDataDao dao;

//	--------------------------------------------------- 강좌 데이터
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
	

	@Override
	public int ClassDataUpdate(ClassDataDto dto) {
		
		return dao.ClassDataUpdate(dto);
	}

	@Override
	public int ClassDataDelete(String data_subhead) {
		
		return dao.ClassDataDelete(data_subhead);
	}

//	--------------------------------------------------- 강좌 정보
	@Override
	public List<ClassInfoDto> ClassInfoSelectList() {
		
		return dao.ClassInfoSelectList();
	}

	@Override
	public ClassInfoDto ClassInfoSelectOne(int class_num) {
		
		return dao.ClassInfoSelectOne(class_num);
	}

	@Override
	public int ClassInfoInsert(ClassInfoDto dto) {
		
		return dao.ClassInfoInsert(dto);
	}

	@Override
	public int ClassInfoUpdate(ClassInfoDto dto) {
		
		return dao.ClassInfoUpdate(dto);
	}

	@Override
	public int ClassInfoDelete(String class_title) {
		
		return dao.ClassInfoDelete(class_title);
	}
	
//	---------------------------------------------------	강좌 소개
	@Override
	public List<ClassIntroduceDto> ClassIntroduceSelectList() {
		
		return null;
	}

	@Override
	public ClassInfoDto ClassIntroduceSelectOne(int class_num) {

		return null;
	}

	@Override
	public int ClassIntroduceInsert(ClassIntroduceDto dto) {
	
		return 0;
	}

	@Override
	public int ClassInfoUpdate(ClassIntroduceDto dto) {

		return 0;
	}

	@Override
	public int ClassIntroduceDelete(String class_content) {

		return 0;
	}


// ---------------------------------------------------	Live
	@Override
	public List<LiveDto> liveCalendar() {
		return dao.liveCalendar();
	}
	
}
