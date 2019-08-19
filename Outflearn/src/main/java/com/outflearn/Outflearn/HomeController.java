package com.outflearn.Outflearn;

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

@Controller
public class HomeController {

	@Autowired
	public ClassDataBiz biz;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/")
	public String home() {

		return "home";
	}

	@RequestMapping(value = "home")
	public String tohome() {

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
	public String LectureList(String class_category, Model model) {

		if(class_category != null) {
			model.addAttribute("classinfo", biz.CategorySelectList(class_category));
		} else {
			model.addAttribute("classinfo", biz.ClassInfoSelectList());
		}

		return "Class/LectureList";
	}

	@RequestMapping("/LectureDetail")
	public String LectureDetail(@ModelAttribute ClassInfoDto Dto, @ModelAttribute ClassIntroduceDto iDto ,int class_num, Model model, HttpSession session, Authentication auth) {

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
		
		
		ClassIntroduceDto abc = biz.ClassIntroduceSelectList(class_num);
		model.addAttribute("classIntroduce", abc);
		System.out.println(abc);
		
	

		return "Class/LectureDetail";
	}

	@RequestMapping("DetailDashBoard")
	@ResponseBody
	public String DetailDashBoard(Model model, HttpSession session) {

		int info_num = (int) session.getAttribute("info_num");

		ClassDataDto dto = biz.ClassDataSelectOne(info_num);
		return dto.getData_data();
	}

	@RequestMapping("Livepage")
	public String Livepage() {
		
		return "Live/Livepage.jsp";
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
				if (a.contains("v=")) {
					b = a.split("v=")[1];
				} else if (a.contains("list=")) {
					b = a.split("list=")[1];
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

				if (a.contains("v=")) {
					b = a.split("v=")[1];
				} else if (a.contains("list=")) {
					b = a.split("list=")[1];
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
	public String LecturePlayList(Model model, HttpSession session) {

		int info_num = (int) session.getAttribute("info_num");

		ClassDataDto data_dto = biz.ClassDataSelectOne(info_num);
		model.addAttribute("info_dto", biz.ClassInfoSelectOne(info_num));

		return data_dto.getData_data();
	}

	@RequestMapping("introOutflearn")
	public String introOutflearn() {
		return "introOutflearn";
	}

// Live
	@RequestMapping("liveCalendar")
	@ResponseBody
	public List<LiveDto> liveCalendar() {

		return biz.liveCalendar();
	}
	
	@RequestMapping("LectureList/LectureCategory")
	public String LectureCategory(String class_category, Model model) {
		
		model.addAttribute("classinfo", biz.CategorySelectList(class_category));
		
		return "Class/LectureList";
	}

	@RequestMapping("livePopup")
	@ResponseBody
	public ClassInfoDto livePopup(int live_num) {
		return biz.livePopup(live_num);
	}

	@RequestMapping("casterRoom")
	public String casterRoom() {
		return "Live/casterRoom";
	}

	@RequestMapping("getMyClass")
	public List<ClassInfoDto> getMyClass(Authentication auth) {
		UserInfoDto dto = (UserInfoDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return biz.getMyClass(dto.getUser_num());
	}
	
	@RequestMapping("liveRooms")
	@ResponseBody
	public List<ClassInfoDto> liveRooms(String[] liveRooms){
		
		return biz.liveRooms(liveRooms);
	}
	

// myPage
	@RequestMapping("myPage")
	public String myPage(Model model, Authentication auth) {

		UserInfoDto dto = (UserInfoDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		model.addAttribute("userInfo", dto);
		model.addAttribute("wishList", biz.getWishList(dto.getUser_num()));
		model.addAttribute("subClass", biz.getSubscribe(dto.getUser_num()));

		return "myPage";
	}

}
