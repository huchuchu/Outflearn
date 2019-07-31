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

//   --------------------------------------------------- 강좌 데이터
   @Override
   public List<ClassDataDto> ClassDataSelectList() {
      // TODO Auto-generated method stub
      return null;
   }

   @Override
   public ClassDataDto ClassDataSelectOne(int class_num) {
      // TODO Auto-generated method stub
      return dao.ClassDataSelectOne(class_num);
   }

   @Override
   public int ClassDatainsert(ClassDataDto dto) {
      
      return dao.ClassDatainsert(dto);
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
      // TODO Auto-generated method stub
      return dao.ClassInfoSelectList();
   }

   @Override
   public ClassInfoDto ClassInfoSelectOne(int class_num) {
      return dao.ClassInfoSelectOne(class_num);
   }

   @Override
   public int ClassInfoinsert(ClassInfoDto dto) {
      
      return dao.ClassInfoinsert(dto);
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