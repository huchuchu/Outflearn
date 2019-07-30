package com.outflearn.Outflearn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.model.biz.ClassDataBiz;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

   @Autowired
   public ClassDataBiz biz;

   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home() {

      return "home";
   }

   @RequestMapping("/LectureList")
   public String LectureList(Model model) {
	   
      model.addAttribute("classinfo", biz.ClassInfoSelectList());
      
      return "LectureList";
   }

   @RequestMapping("/LectureDetail")
   public String LectureDetail(@ModelAttribute ClassInfoDto dto, Model model, HttpSession session) {
	   
	   model.addAttribute("classinfo", biz.ClassInfoSelectOne(dto.getClass_num()));
	   session.setAttribute("info_num", dto.getClass_num());
	   
	   return "LectureDetail";
   }
   
   @RequestMapping("DetailDashBoard")
   @ResponseBody
   public String DetailDashBoard(Model model, HttpSession session) {
	   
	   int info_num = (int) session.getAttribute("info_num");
	   System.out.println("변환하기 전 :" + session.getAttribute("info_num"));
	   System.out.println("변환 후  : " + info_num);
	   
	   ClassDataDto dto = biz.ClassDataSelectOne(info_num);
	   System.out.println("controller : " + dto.toString());
	   
	   return dto.getData_data();
   }
   
   @RequestMapping("Live")
   public void Live() {
	   
   }
   
   @RequestMapping("ClassInfoInsertForm")
   public void ClassInfoInsertForm() {
      
   }
   
   @RequestMapping("/DataVideoUploadForm")
   public String DataVideoUploadForm(@ModelAttribute ClassInfoDto dto) {
      
      int res = biz.ClassInfoinsert(dto);
      
      if(res > 0) {
         return "DataVideoUploadForm";
      }else {
         return "redirect: ClassInfoInsertForm";
      }
   }
   
   @RequestMapping("DataVideoUpload")
   public String DataVideoUpload(@ModelAttribute ClassDataDto dto) {
      
      String a = dto.getData_data();
      String b = "";
      if(a.contains("v=")) {
    	  b = a.split("v=")[1];
      } else if(a.contains("list=")) {
    	  b = a.split("list=")[1];
      }
//      String b = a.substring(32, 42);   
      System.out.println(b);
      dto.setData_data(b);
      
      
      int res = biz.ClassDatainsert(dto);
      System.out.println("hello " + res);
      
      if(res > 0) {
         return "redirect: LectureList";
      } else {
         return "redirect: DataVideoUploadForm";
      }
      

   }
   
   
   

}