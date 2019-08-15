package com.outflearn.Outflearn;




import java.util.ArrayList;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.outflearn.Outflearn.dto.MainStreamDto;
import com.outflearn.Outflearn.dto.RoadMapInfoDto;
import com.outflearn.Outflearn.dto.SubStreamDto;
import com.outflearn.Outflearn.model.biz.RoadMapBiz;

@Controller
public class RoadMapController {
	
	private static final Logger logger  = LoggerFactory.getLogger(RoadMapController.class);
	
	@Inject
	private RoadMapBiz biz;
	

	
	
	//로드맵 보기
	@RequestMapping("/RoadMap")
	public String roadMapPage() {
		return"RoadMap/RoadMapList";
	}
	
	//로드맵 쓰기 페이지1
	@RequestMapping("/RoadMapWriteP1")
	public String roadMapWriteP1() {
		return "RoadMap/RoadMapWrite_p1";
	}
	
	//로드맵2 다이렉트
	@RequestMapping("/RoadMapWriteP2")
	public String RoadMapWriteP2() {
		return"RoadMap/RoadMapWrite_p2";
	}
	
	//로드맵 1페이지 작성 후 insert
	@RequestMapping("/roadInsert")
	public String roadMapInsert(@ModelAttribute RoadMapInfoDto dto, Model model) {
		
		int res = 0;
		System.out.println(dto.getRoadmap_content());
		System.out.println(dto.getRoadmap_title());
		System.out.println(dto.getUser_num());
		
		res = biz.insertRoadMap(dto);	
		
		int seq = biz.selectSQ() ;
		
		System.out.println("시퀀스번호"+seq);
		
		//넘어갈때 시퀀스 번호까지 같이 넘어감
		model.addAttribute("roadSeq", seq);
		return"RoadMap/RoadMapWrite_p2";
	}
	
	//로드맵 2페이지 작성 후 insert
	@RequestMapping("/roadNclass")
	public String roadNclass(@RequestParam String[] class_num, @RequestParam String seq)  {
		
		System.out.println("roadNclass 입장:::::::");
		System.out.println("class_num===="+class_num);
		System.out.println("class_num.length"+class_num.length);
		System.out.println("roadmap 번호"+seq);
		
		
		for(String res : class_num) {
			System.out.println("컨트롤러");
			System.out.println(res);
		}
		
		
		biz.insertroadNclass(class_num, seq);
		
		System.out.println("인서트 성공!");
	
		
		return"RoadMap/RoadMapList";
	}
	
	//검색창 띄우기
	@RequestMapping("/searchWingogo")
	public String searchWingogo(Model model) {
		
		List<MainStreamDto> mainStreamList = biz.mainStreamList();
		List<SubStreamDto> subStreamList = biz.subStreamList();
		System.out.println(mainStreamList.size());
		System.out.println(subStreamList.size());
		
		model.addAttribute("mainList", mainStreamList);
		model.addAttribute("subList", subStreamList);
		return"RoadMap/SearchForm";
	}
	
	

}
