package com.outflearn.Outflearn.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;

@Repository
public class ClassDataDaoImpl implements ClassDataDao {

	@Autowired
	public SqlSessionTemplate sqlSession;

//	--------------------------------------------------- 강좌 데이터
	@Override
	public List<ClassDataDto> ClassDataSelectList() {

		List<ClassDataDto> list = new ArrayList<ClassDataDto>();

		try {
			list = sqlSession.selectList(namespace + "ClassDateSelectlist");
		} catch (Exception e) {

			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ClassDataDto ClassDataSelectOne(String data_data) {

		ClassDataDto dto = sqlSession.selectOne(namespace + "ClassDataSelectone", data_data);

		return dto;
	}

	@Override
	public int ClassDataInsert(ClassDataDto dto) {
		int res = 0;

		res = sqlSession.insert(namespace + "ClassDataInsert", dto);

		return res;
	}

	@Override
	public int ClassDataUpdate(ClassDataDto dto) {
		int res = 0;

		res = sqlSession.update(namespace + "ClassDataUpdate", dto);

		return res;
	}

	@Override
	public int ClassDataDelete(String data_subhead) {
		// TODO Auto-generated method stub
		return 0;
	}

//	--------------------------------------------------- 강좌 정보
	@Override
	public List<ClassInfoDto> ClassInfoSelectList() {

		List<ClassInfoDto> list = new ArrayList<ClassInfoDto>();

		try {
			list = sqlSession.selectList(namespace + "ClassInfoSelectlist");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ClassInfoDto ClassInfoSelectOne(String class_title) {
		
		ClassInfoDto dto = sqlSession.selectOne(namespace + "ClassInfoSelectone", class_title);

		return dto;
	}

	@Override
	public int ClassInfoInsert(ClassInfoDto dto) {
		int res = 0;

		res = sqlSession.insert(namespace + "ClassInfoDtoInsert", dto);

		return res;
	}

	@Override
	public int ClassInfoUpdate(ClassInfoDto dto) {
		int res = 0;

		res = sqlSession.update(namespace + "ClassInfoUpdate", dto);

		return res;
	}

	@Override
	public int ClassInfoDelete(String class_title) {
		// TODO Auto-generated method stub
		return 0;
	}

}
