package com.outflearn.Outflearn.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
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
	public ClassDataDto ClassDataSelectOne(String data_data) {
		// TODO Auto-generated method stub
		return dao.ClassDataSelectOne(data_data);
	}

	@Override
	public int ClassDataInsert(ClassDataDto dto) {
		
		return dao.ClassDatainsert(dto);
	}

	@Override
	public int ClassDataUpdate(ClassDataDto dto) {
		// TODO Auto-generated method stub
		return dao.ClassDataupdate(dto);
	}

	@Override
	public int ClassDataDelete(String data_subhead) {
		// TODO Auto-generated method stub
		return dao.ClassDatadelete(data_subhead);
	}

//	--------------------------------------------------- 강좌 정보
	@Override
	public List<ClassInfoDto> ClassInfoSelectList() {
		// TODO Auto-generated method stub
		return dao.ClassInfoSelectList();
	}

	@Override
	public ClassInfoDto ClassInfoSelectOne(String class_title) {
		// TODO Auto-generated method stub
		return dao.ClassInfoSelectOne(class_title);
	}

	@Override
	public int ClassInfoInsert(ClassInfoDto dto) {
		
		return dao.ClassInfoinsert(dto);
	}

	@Override
	public int ClassInfoUpdate(ClassInfoDto dto) {
		// TODO Auto-generated method stub
		return dao.ClassInfoupdate(dto);
	}

	@Override
	public int ClassInfoDelete(String class_title) {
		// TODO Auto-generated method stub
		return dao.ClassInfodelete(class_title);
	}

	

}
