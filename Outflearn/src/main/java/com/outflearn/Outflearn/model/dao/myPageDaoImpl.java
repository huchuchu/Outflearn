package com.outflearn.Outflearn.model.dao;

import java.sql.SQLWarning;

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
import com.outflearn.Outflearn.dto.RoadMapCon;
import com.outflearn.Outflearn.dto.connectUserClass;
import com.outflearn.Outflearn.dto.ClassReviewDto;

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
	
}
