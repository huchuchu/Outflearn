package com.outflearn.Outflearn.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.RoadMapCon;

@Repository
public class myPageDaoImpl implements myPageDao {

	@Autowired
	public SqlSessionTemplate sqlSession;


	@Override
	public List<ClassInfoDto> getSubscribe(int user_num) {
		return sqlSession.selectList(namespace + "getSubscribe", user_num);
	}


	@Override
	public List<ClassInfoDto> getBasketClass(int user_num) {
		return sqlSession.selectList(namespace + "getBasketClass", user_num);
	}


	@Override
	public List<RoadMapCon> getSubRoadmap(int user_num) {
		return sqlSession.selectList(namespace + "getSubRoadmap", user_num);
	}


	@Override
	public List<ClassInfoDto> getPreBasketClass(int user_num) {
		return sqlSession.selectList(namespace + "getPreBasketClass", user_num);
	}


	@Override
	public List<ClassInfoDto> getPreSubscribe(int user_num) {
		return sqlSession.selectList(namespace + "getPreSubscribe", user_num);
	}


	@Override
	public List<RoadMapCon> getPreSubRoadmap(int user_num) {
		return sqlSession.selectList(namespace + "getPreSubRoadmap", user_num);
	}
	
}
