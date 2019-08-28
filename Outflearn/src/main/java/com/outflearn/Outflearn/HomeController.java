package com.outflearn.Outflearn;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.outflearn.Outflearn.dto.ClassCategoryDto;
import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.LiveDto;
import com.outflearn.Outflearn.dto.MainStreamDto;
import com.outflearn.Outflearn.dto.SubStreamDto;
import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.biz.ClassDataBiz;
import com.outflearn.Outflearn.service.Pagination;

@Controller
public class HomeController {

	@Autowired
	public ClassDataBiz biz;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/")
	public String home(Model model) {

		model.addAttribute("SubCount", biz.SubCountSelectList());
		
		return "home";
	}

	@RequestMapping(value = "home")
	public String tohome(Model model) {

		model.addAttribute("SubCount", biz.SubCountSelectList());
		
		return "home";
	}
	
//	장바구니 유저정보
	@RequestMapping("basket")
	public String basket(@ModelAttribute ClassInfoDto dto, Model model, int class_num, Authentication auth) {
		logger.info("basket");
		
		System.out.println(auth.getPrincipal());
		UserInfoDto uDto = (UserInfoDto) auth.getPrincipal();
		int user_num = uDto.getUser_num();
		System.out.println(user_num + "오냐");

		
	
	
//		ClassInfo
		dto.setUser_num(uDto.getUser_num());
		
		model.addAttribute("classInfoUser", biz.classInfoSelectListUser(user_num));
		System.out.println("안오냐??");
				
		System.out.println("안녕111");
		int res = biz.classBasketInsert(dto);
		System.out.println("안녕222");
		
		return "Class/ClassBasket";
	}

//	장바구니 삭제
	@RequestMapping("basketDelete")
	public String basketDelete(@ModelAttribute ClassInfoDto dto, Model model ,int class_num) {
		
		model.addAttribute("classInfoUser", biz.classBasketDelete(class_num));
		
		return "";
	}
	
	@RequestMapping("/LectureList")
	public String LectureListPage(Model model, String txt_search, String page, String class_category) {
		logger.info("txt서치전");
		
		int totalCount = biz.selectTotalCount(txt_search);
		logger.info(""+totalCount);
		
		int pageNum = (page==null)? 1:Integer.parseInt(page);
		
		Pagination pagination = new Pagination();
		
		//get방식의 파라미터값으로 받은page변수, 현재 페이지 번호
		pagination.setPageNo(pageNum);
		
		//한 페이지에 나오는 게시물의 개수 
		pagination.setPageSize(9);
		pagination.setTotalCount(totalCount);
		
		//select해오는 기준을 구함
		pageNum = (pageNum -1) * pagination.getPageSize();
		
		List<ClassInfoDto> list = biz.selectListPage(pageNum, pagination.getPageSize(), txt_search);
		
		model.addAttribute("classinfo", list);
		model.addAttribute("pagination", pagination);
		model.addAttribute("txt_search", txt_search);
		model.addAttribute("class_category", class_category);
		
		if(class_category != null) {
			model.addAttribute("classinfo", biz.CategorySelectList(class_category));
		} else {
			model.addAttribute("classinfo", biz.selectListPage(pageNum, pagination.getPageSize(), txt_search));
		}
		
		return "Class/LectureList";
		
	}

		
	

	@RequestMapping("/LectureDetail")
	public String LectureDetail(@ModelAttribute ClassInfoDto Dto, int class_num, Model model, HttpSession session, Authentication auth) {

		logger.info("/LectureDetail");
		session.setAttribute("info_num", class_num);
		model.addAttribute("class_num", class_num);
		// 닉네임
		// 회원 정보
		System.out.println(auth.getPrincipal());
		UserInfoDto uDto = (UserInfoDto) auth.getPrincipal();
		String user_nickname = uDto.getUser_nickname();
		model.addAttribute("user_nickname", user_nickname);
		
		// 강좌 소개
		model.addAttribute("classinfo", biz.ClassInfoSelectOne(class_num));
		System.out.println(biz.ClassInfoSelectOne(class_num));
		// 댓글
		model.addAttribute("classReview", biz.ClassReviewSelectList(class_num));
		System.out.println(biz.ClassReviewSelectList(class_num));
		
		// 강의 소개
		model.addAttribute("classIntroduce", biz.ClassIntroduceSelectList(class_num));
		System.out.println(biz.ClassIntroduceSelectList(class_num));
		
		// 질문 리스트
		model.addAttribute("classQuestion", biz.QASelectList(class_num));
		System.out.println(biz.QASelectList(class_num) + " : 질문들");
		
		// 대쉬보드 질문 리스트
		model.addAttribute("ReviewList", biz.ReviewList(class_num));
		
		// 대쉬보드 리뷰 리스트
		model.addAttribute("QAList", biz.QAList(class_num));
		
		return "Class/LectureDetail";
	}

	@RequestMapping("DetailDashBoard")
	@ResponseBody
	public String[] DetailDashBoard(Model model, HttpSession session) {

		int info_num = (int) session.getAttribute("info_num");

		List<ClassDataDto> dto = biz.ClassDataSelectOne(info_num);
		

		String[] array = new String[dto.size()];

		int size = 0;

		for(ClassDataDto temp : dto){
			
			array[size++] = temp.getData_data();
			System.out.println(temp.getData_data() + " : controller");

		}

		return array;
	}

	@RequestMapping("Livepage")
	public String Livepage() {
		
		return "Live/Livepage";
	}

//	강의 쓰기
	@RequestMapping("ClassInfoInsertForm")
	public String ClassInfoInsertForm(Authentication auth, Model model) {
		logger.info("ClassInfoInsertForm");

		// 회원 정보
		UserInfoDto uDto = (UserInfoDto) auth.getPrincipal();
		String user_nickname = uDto.getUser_nickname();
		int user_num = (Integer) uDto.getUser_num();
		model.addAttribute("user_nickname", user_nickname);
		model.addAttribute("user_num", user_num);

		return "Class/ClassInfoInsertForm";
	}

//	ClassInfoInsertForm.jsp - > ClassIntroduceInsertForm.jsp  CLASS_DATA DB 저장
	@RequestMapping("ClassIntroduceInsertForm")
	public String ClassIntroduceInsertForm(MultipartHttpServletRequest mtfRequest, @ModelAttribute ClassInfoDto dto,
			@RequestParam(name="main_name") String main_name, @RequestParam(name="sub_name") String sub_name ) {
		logger.info("ClassIntroduceInsertForm");
		System.out.println("아예안오니");
		
		// 주류, 부류
		MainStreamDto mDto = new MainStreamDto();
		mDto.setMain_name(main_name);
		int mRes = biz.mainStreamInsert(mDto);
		System.out.println(mRes);
		
		SubStreamDto sDto = new SubStreamDto();
		sDto.setSub_name(sub_name);
		int sRes = biz.subStreamInsert(sDto);
		System.out.println(sRes);
		
		
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
	
		String path = mtfRequest.getSession().getServletContext().getRealPath("resources/uploadImage");
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
			String class_img_path = path + "/" + originFileName; // 경로
			System.out.println("경로 " + class_img_path);
			String class_img = originFileName; // 파일 이름
			dto.setClass_img(class_img);
			System.out.println(class_img);
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			int res = 0;
			try {
				mf.transferTo(new File(class_img_path)); // 파일 집어넣는다

				res = biz.ClassInfoInsert(dto);

				if (res > 0) {
					System.out.println("성공");
				} else {
					System.out.println("실패");
				}
			} catch (IllegalStateException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}
		}
		
		ClassCategoryDto cDto = new ClassCategoryDto();
		int cRes = biz.ClassCategoryInsert(cDto);
		System.out.println(cRes);

		return "Class/ClassIntroduceInsertForm";
	}
	

	@RequestMapping("DataVideoUploadForm")
	public String DataVideoUploadForm(@ModelAttribute ClassIntroduceDto dto, Model model) {
		logger.info("DataVideoUploadForm");

		int res = biz.ClassIntroduceInsert(dto);
		if (res > 0) {
			return "Class/DataVideoUploadForm";
		} else {
			return "Class/DataVideoUploadForm";
		}

	}

// 	영상소개 작성 확인 DataVideoUploadForm.jsp
	@RequestMapping("DataVideoUpload")
	public String DataVideoUpload(MultipartHttpServletRequest mtfRequest, @ModelAttribute ClassDataDto dto, Model model)
			throws FileNotFoundException {
		logger.info("DataVideoUpload");
		
		if (dto.getData_data() == null) {
	         List<MultipartFile> fileList = mtfRequest.getFiles("file");
	         System.out.println("안녕!!!");
	         String path = mtfRequest.getSession().getServletContext().getRealPath("resources/uploadImage");
	         File dir = new File(path);
	         if (!dir.isDirectory()) {
	            dir.mkdirs();
	         }

			for (MultipartFile mf : fileList) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				long fileSize = mf.getSize(); // 파일 사이즈
				String data_data_path = path + "/" + originFileName; // 경로
				System.out.println("경로 " + data_data_path);
				String data_data = path + originFileName; // 파일 이름
				dto.setData_data(data_data);
				System.out.println(data_data);
				System.out.println("originFileName : " + originFileName);
				System.out.println("fileSize : " + fileSize);

				try {
					mf.transferTo(new File(data_data_path));

				} catch (IllegalStateException e) {

					e.printStackTrace();
				} catch (IOException e) {

					e.printStackTrace();
				}
			}

		} else {
			if (dto.getData_data().substring(0, 5).equals("https")) {

				String a = dto.getData_data();
				String b = "";
				System.out.println(a);
				if(a.contains("v=")) {
					b = a.split("\\?")[1];
					if(b.contains("&")) {
						b = b.substring(0, b.indexOf("&"));
					}
					System.out.println(b);
				} else if (a.contains("list=")) {
					b = a.split("\\?")[1];
					if(b.contains("&")) {
						b = b.substring(0, b.indexOf("&"));
					}
					System.out.println(b);
				}

				dto.setData_data(b);

			}

		}

		int res = biz.ClassDataInsert(dto);

		if (res > 0) {
			return "Class/DataVideoUploadFormPlus";
		} else {
			return "Class/DataVideoUploadFormPlus";
		}
	}
		


//	DataVideoUploadFormPlus - > DataVideoUploadFormPlus 한 챕터에 영상 추가
	@RequestMapping("DataVideoUploadPlus")
	public String DataVideoUploadPlus(MultipartHttpServletRequest mtfRequest, @ModelAttribute ClassDataDto dto)
			throws FileNotFoundException {
		logger.info("DataVideoUploadPlus");
		System.out.println("안녕");
		if (dto.getData_data() == null) {
			List<MultipartFile> fileList = mtfRequest.getFiles("file");
			System.out.println("안녕!!!");
			String path = mtfRequest.getSession().getServletContext().getRealPath("resources/uploadImage");
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}

			for (MultipartFile mf : fileList) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				long fileSize = mf.getSize(); // 파일 사이즈
				String data_data_path = path + "/" + originFileName; // 경로
				System.out.println("경로 " + data_data_path);
				String data_data = path + originFileName; // 파일 이름
				dto.setData_data(data_data);
				System.out.println(data_data);
				System.out.println("originFileName : " + originFileName);
				System.out.println("fileSize : " + fileSize);
				int res = 0;
				
				try {
					mf.transferTo(new File(data_data_path));

				} catch (IllegalStateException e) {

					e.printStackTrace();
				} catch (IOException e) {

					e.printStackTrace();
				}
			}

		} else {
			if (dto.getData_data().substring(0, 5).equals("https")) {

				String a = dto.getData_data();
				String b = "";

				if(a.contains("v=")) {
					b = a.split("\\?")[1];
					if(b.contains("&")) {
						b = b.substring(0, b.indexOf("&"));
					}
					System.out.println(b);
				} else if (a.contains("list=")) {
					b = a.split("\\?")[1];
					if(b.contains("&")) {
						b = b.substring(0, b.indexOf("&"));
					}
					System.out.println(b);
				}

				dto.setData_data(b);

			}
		}

		int res = biz.ClassChapterDataInsert(dto);

		if (res > 0) {
			return "Class/DataVideoUploadFormPlus";
		} else {
			return "Class/DataVideoUploadFormPlus";
		}
	}

	@RequestMapping("LectureDetailView")
	public String LectureDetailView(String DATA_DATA, Model model) {

		model.addAttribute("DATA_DATA", DATA_DATA);

		return "Class/LectureDetailView";
	}

	@RequestMapping("LecturePlayList")
	@ResponseBody
	public String[] LecturePlayList(Model model, HttpSession session) {

		int info_num = (int) session.getAttribute("info_num");

		List<ClassDataDto> data_dto = biz.ClassDataSelectOne(info_num);
		model.addAttribute("info_dto", biz.ClassInfoSelectOne(info_num));

		String[] array = new String[data_dto.size()];

		int size = 0;

		for(ClassDataDto temp : data_dto){
			array[size++] = temp.getData_data();
		}
		
		System.out.println(array[0]);

		return array;
	}

	@RequestMapping("introOutflearn")
	public String introOutflearn() {
		return "introOutflearn";
	}

}
