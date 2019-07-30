package com.outflearn.Outflearn;

import java.sql.Clob;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

		model.addAttribute("ClassInfolist", biz.ClassInfoSelectList());

		return "LectureList";
	}

	@RequestMapping("LectureDetail")
	public void LectureDetail() {

	}
	
	@RequestMapping("ClassInfoInsertform")
	public void ClassInfoInsertForm() {
		
	}
	
	@RequestMapping("/DataVideoUploadForm")
	public String DataVideoUploadForm(@ModelAttribute ClassInfoDto dto) {
		
		int res = biz.ClassInfoInsert(dto);
		
		if(res > 0) {
			return "DataVideoUploadForm";
		}else {
			return "redirect: ClassInfoInsertform";
		}
	}
	
//	유튜브영상 링크를 받아와서 DB넣어준다.
	@RequestMapping("DataVideoUpload")
	public String DataVideoUpload(@ModelAttribute ClassDataDto dto) {
		
		String a = dto.getData_data();
//		String b = a.split("v=", 2).toString();
		String b = a.substring(32, 42);	

		dto.setData_data(b);
		
		
		int res = biz.ClassDataInsert(dto);
		System.out.println("hello " + res);
		
		if(res > 0) {
			return "redirect: LectureList";
		} else {
			return "redirect: DataVideoUploadForm";
		}
		

	}
	
//  유튜브 링크영상말고 직접 영상 업로드
	@RequestMapping("SelfDataVideoUpload")
	public void SelfDataVideoUpload() {
		
	}
	
	

}
