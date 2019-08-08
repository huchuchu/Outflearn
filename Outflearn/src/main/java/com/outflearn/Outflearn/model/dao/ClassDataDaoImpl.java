package com.outflearn.Outflearn.model.dao;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.LiveDto;

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
	public ClassDataDto ClassDataSelectOne(int class_num) {

		ClassDataDto dto = new ClassDataDto();

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_num", class_num);
		System.out.println("daoImpl : " + class_num);
		dto = sqlSession.selectOne(namespace + "classdataselectone", map);

		return dto;
	}

	@Override
	public int ClassDataInsert(ClassDataDto dto) {
		int res = 0;

		res = sqlSession.insert(namespace + "ClassDataInsert", dto);

		return res;
	}

//	챕터 추가
	@Override
	public int ClassChapterDataInsert(ClassDataDto dto) {
		int res = 0;

		res = sqlSession.insert(namespace + "ClassChapterDataInsert", dto);

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
	public ClassInfoDto ClassInfoSelectOne(int class_num) {

		ClassInfoDto dto = new ClassInfoDto();

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_num", class_num);

		dto = sqlSession.selectOne(namespace + "classinfoselectone", map);

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

		return 0;
	}

//	--------------------------------------------------- 강좌 데이터
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

// --------------------------------------------------- Live

	@Override
	public List<LiveDto> liveCalendar() {

		List<LiveDto> list = sqlSession.selectList(namespace + "liveCalendar");

		return list;
	}

}
