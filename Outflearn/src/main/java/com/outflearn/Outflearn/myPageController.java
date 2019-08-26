package com.outflearn.Outflearn;

import javax.servlet.http.HttpSession;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.biz.ClassDataBiz;
import com.outflearn.Outflearn.model.biz.RoadMapBiz;
import com.outflearn.Outflearn.model.biz.myPageBiz;

@Controller
public class myPageController {

	@Autowired
	public myPageBiz biz;
	

	private static final Logger logger = LoggerFactory.getLogger(myPageController.class);

// myPage
	@RequestMapping("myPage")
	public String myPage(Model model, Authentication auth) {

		UserInfoDto dto = (UserInfoDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		model.addAttribute("userInfo", dto);
		model.addAttribute("basketClass", biz.getPreBasketClass(dto.getUser_num()));
		model.addAttribute("subClass", biz.getPreSubscribe(dto.getUser_num()));
		model.addAttribute("subRoadmap", biz.getPreSubRoadmap(dto.getUser_num()));
		model.addAttribute("preQA", biz.getPreQA(dto.getUser_num()));

		return "Member/myPage";
	}
	
	@RequestMapping("listenClass")
	public String listenClass(Model model) {
		
		UserInfoDto dto = (UserInfoDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		model.addAttribute("subClass", biz.getSubscribe(dto.getUser_num()));
		return "Member/listenClass";
	}
	
	@RequestMapping("subRoadmap")
	public String subRoadmap(Model model) {
		
		UserInfoDto dto = (UserInfoDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("subRoadmap", biz.getSubRoadmap(dto.getUser_num()));
		
		return "Member/subRoadmap";
	}
	
	@RequestMapping("myQuestion")
	public String myQuestion(Model model) {
		
		UserInfoDto dto = (UserInfoDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("myQA", biz.getQA(dto.getUser_num()));
		
		return "Member/myQuestion";
	}
	
	@RequestMapping("configProfile")
	public String configProfile(Model model) {
		
		UserInfoDto dto = (UserInfoDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		model.addAttribute("userInfo", dto);
		
		return "Member/configProfile";
	}

}
