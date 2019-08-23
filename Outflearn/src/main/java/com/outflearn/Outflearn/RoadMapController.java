package com.outflearn.Outflearn;




import java.util.ArrayList;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.MainStreamDto;
import com.outflearn.Outflearn.dto.RoadMapCon;
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
	public String roadMapPage(Model model) {
		
		List<MainStreamDto> mainStreamList = biz.mainStreamList();		
		List<RoadMapInfoDto> roadMapList = biz.roadMapList();
		
//
//		System.out.println("stream갯수"+mainStreamList.size());	
//		System.out.println("roadMap갯수"+roadMapList.size());
		//조인 -유저네임 맵으로리턴
		//유저인포 
		
		model.addAttribute("roadList", roadMapList);
		model.addAttribute("mainList", mainStreamList);		

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
	public String searchWingogo(Model model, @RequestParam String btnIdVal) {
		
		List<MainStreamDto> mainStreamList = biz.mainStreamList();		
		List<SubStreamDto> subStreamList = biz.subStreamList();	
		
		System.out.println(subStreamList.size());
		System.out.println(mainStreamList.size());
		
		model.addAttribute("btnIdVal", btnIdVal);
		model.addAttribute("mainList", mainStreamList);
		model.addAttribute("subList", subStreamList);
		return"RoadMap/SearchForm";
	}
	
	//검색창에서 검색 후 값과 리턴
	@RequestMapping("/searchFilter")
	public String searchFilter(Model model, @RequestParam String[] subFilter, @RequestParam String please) {
		
		System.out.println("들어온 필터 갯수"+subFilter.length);
		
		List<ClassInfoDto> resList = new ArrayList<ClassInfoDto>();
		resList = biz.classInfoList(subFilter);
		System.out.println("컨트롤러로 다시 컴백 :"+ resList.size());
		

		
		List<MainStreamDto> mainStreamList = biz.mainStreamList();		
		List<SubStreamDto> subStreamList = biz.subStreamList();	
		
		model.addAttribute("btnIdVal", please);
		model.addAttribute("mainList", mainStreamList);
		model.addAttribute("subList", subStreamList);
		model.addAttribute("resList", resList);		
		return"RoadMap/SearchForm";
	}
	
	//로드맵 보기
	@RequestMapping("/roadMapDetail")
	public String roadMapDetail(@RequestParam String roadNum, Model model, ServletRequest request) {
		System.out.println("로드맵번호 번호: "+ roadNum );
		//로드맵 번호로 리트스받아옴
		RoadMapInfoDto dto = biz.selectOneRoadMap(roadNum);
		
		//로드맵 번호로 roamapCon에서 classNum들 받아옴
		List<RoadMapCon> list = biz.RoadMapConList(roadNum);
		System.out.println("list"+list);
		System.out.println("===========================================");
		//class_no를 list에 담음
		List<Integer> classNumList = new ArrayList<Integer>();
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).getClass_num());
			classNumList.add(list.get(i).getClass_num());
		}
		
		System.out.println("classNumList"+classNumList);
		
		//class_Num으로 class_infoList받아옴
		List<ClassInfoDto> resList = biz.RoadClassInfoList(classNumList);
		System.out.println(resList.size()+"+++++++++++++++++++++");
		
		HttpServletRequest req = (HttpServletRequest)request;
		String Http =StringUtils.defaultString(req.getScheme());
		int serverPort = req.getServerPort();
		String serverName = StringUtils.defaultString(req.getServerName());
		String url = StringUtils.defaultString(req.getRequestURI().toString()); //전체
		String queryString = StringUtils.defaultString(req.getQueryString());   //?id=admin
		
		String URL = Http+"://"+serverName+":"+serverPort+"/"+url+"?"+queryString;
		System.out.println(URL);
		
		model.addAttribute("URL", URL); //현재 주소
		model.addAttribute("resList", resList);//classInfo
		model.addAttribute("conList", list);//roadMapCon
		model.addAttribute("roadMap", dto); //roadMapInfo
		return"RoadMap/RoadMapDetail";
	}
	
	//로드맵 구독
	@RequestMapping("/roadMapJoin")
	public String roadMapJoin(@RequestParam String roadnum, @RequestParam String usernum) {
				
	int subRes = biz.roadMapSubscribeInsert(roadnum, usernum); //로드맵 구독 insert
	int roadRes= biz.updateRoadSubscribe(roadnum); //roadmap subscribe update
		
	if(subRes>0) {
		System.out.println("로드맵 구독 insert 성공");
	}else {
		System.out.println("로드맵 구독 insert 실패");
	}
	
	if(roadRes>0) {
		System.out.println("roadmap subscribe update성공");
	}else {
		System.out.println("roadmap subscribe update실패");
	}
		
		
		return "";
	}
	

}
