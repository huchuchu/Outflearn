package com.outflearn.Outflearn.model.biz;

import java.util.List;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;

public interface ClassDataBiz {
   
   // 강좌 데이터
   public List <ClassDataDto> ClassDataSelectList();
   public ClassDataDto ClassDataSelectOne(int class_num);
   public int ClassDatainsert(ClassDataDto dto);
   public int ClassDataupdate(ClassDataDto dto);
   public int ClassDatadelete(String data_subhead);
   
   // 강좌 정보
   public List <ClassInfoDto> ClassInfoSelectList();
   public ClassInfoDto ClassInfoSelectOne(int class_num);
   public int ClassInfoinsert(ClassInfoDto dto);
   public int ClassInfoupdate(ClassInfoDto dto);
   public int ClassInfodelete(String class_title);
}