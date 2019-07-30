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

@Repository
public class ClassDataDaoImpl implements ClassDataDao {

   @Autowired
   public SqlSessionTemplate sqlSession;

//   --------------------------------------------------- 강좌 데이터
   @Override
   public List<ClassDataDto> ClassDataSelectList() {
      // TODO Auto-generated method stub
      return null;
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
   public int ClassDatainsert(ClassDataDto dto) {
      System.out.println("다오임플에 잘넘어왓을까?");
      int res = 0;
      
      try {
         res = sqlSession.insert(namespace + "classdatainsert", dto);
         System.out.println("값이왜" + res);
      } catch (Exception e) {
         System.out.println("다시하자");
         e.printStackTrace();
      }
      
      return res;
   }

   @Override
   public int ClassDataupdate(ClassDataDto dto) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int ClassDatadelete(String data_subhead) {
      // TODO Auto-generated method stub
      return 0;
   }

//   --------------------------------------------------- 강좌 정보
   @Override
   public List<ClassInfoDto> ClassInfoSelectList() {

      List<ClassInfoDto> list = new ArrayList<ClassInfoDto>();

      try {
         list = sqlSession.selectList(namespace + "classinfoselectlist");
         System.out.println(list);
      } catch (Exception e) {
         System.out.println("다시하자");
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
   public int ClassInfoinsert(ClassInfoDto dto) {
      System.out.println("dao왔다.");
      int res = 0;
   
      res = sqlSession.insert(namespace + "ClassInfoDtoInsert", dto);
      System.out.println("값이 잘들어왔나?" + res);
   
      
      return res;
   }

   @Override
   public int ClassInfoupdate(ClassInfoDto dto) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int ClassInfodelete(String class_title) {
      // TODO Auto-generated method stub
      return 0;
   }

}