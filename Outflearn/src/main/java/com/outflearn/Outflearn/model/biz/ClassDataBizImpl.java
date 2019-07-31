package com.outflearn.Outflearn.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassUploadDto;
import com.outflearn.Outflearn.model.dao.ClassDataDao;


@Service
public class ClassDataBizImpl implements ClassDataBiz {
	
	@Autowired
	private ClassDataDao dao;

//	--------------------------------------------------- 강좌 데이터
	@Override
	public List<ClassDataDto> ClassDataSelectList() {
		// TODO Auto-generated method stub
		return dao.ClassDataSelectList();
	}

	@Override
	public ClassDataDto ClassDataSelectOne(int class_num) {
		// TODO Auto-generated method stub
		return dao.ClassDataSelectOne(class_num);
	}

	@Override
	public int ClassDataInsert(ClassDataDto dto) {
		
		return dao.ClassDataInsert(dto);
	}

	@Override
	public int ClassDataUpdate(ClassDataDto dto) {
		// TODO Auto-generated method stub
		return dao.ClassDataUpdate(dto);
	}

	@Override
	public int ClassDataDelete(String data_subhead) {
		// TODO Auto-generated method stub
		return dao.ClassDataDelete(data_subhead);
	}

//	--------------------------------------------------- 강좌 정보
	@Override
	public List<ClassInfoDto> ClassInfoSelectList() {
		// TODO Auto-generated method stub
		return dao.ClassInfoSelectList();
	}

	@Override
	public ClassInfoDto ClassInfoSelectOne(int class_num) {
		// TODO Auto-generated method stub
		return dao.ClassInfoSelectOne(class_num);
	}

	@Override
	public int ClassInfoInsert(ClassInfoDto dto) {
		
		return dao.ClassInfoInsert(dto);
	}

	@Override
	public int ClassInfoUpdate(ClassInfoDto dto) {
		// TODO Auto-generated method stub
		return dao.ClassInfoUpdate(dto);
	}

	@Override
	public int ClassInfoDelete(String class_title) {
		// TODO Auto-generated method stub
		return dao.ClassInfoDelete(class_title);
	}

//	--------------------------------------------------- 강좌 영상올리기
	
	@Override
	public List<ClassUploadDto> ClassUploadSelectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ClassInfoDto ClassUploadSelectOne(int class_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int ClassUploadInsert(ClassUploadDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ClassUploadUpdate(ClassUploadDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ClassUploadDelete(int class_num) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
