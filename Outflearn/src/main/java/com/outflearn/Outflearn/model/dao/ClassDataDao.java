package com.outflearn.Outflearn.model.dao;

import java.util.List;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;

public interface ClassDataDao {
	
	String namespace = "auth.";
	
	// 강좌 데이터
	public List <ClassDataDto> ClassDataSelectList();
	public ClassDataDto ClassDataSelectOne(String data_data);
	public int ClassDataInsert(ClassDataDto dto);
	public int ClassDataUpdate(ClassDataDto dto);
	public int ClassDataDelete(String data_subhead);
	
	// 강좌 정보
	public List <ClassInfoDto> ClassInfoSelectList();
	public ClassInfoDto ClassInfoSelectOne(String class_title);
	public int ClassInfoInsert(ClassInfoDto dto);
	public int ClassInfoUpdate(ClassInfoDto dto);
	public int ClassInfoDelete(String class_title);
	
}
