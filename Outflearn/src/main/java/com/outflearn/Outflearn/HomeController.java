package com.outflearn.Outflearn;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.ClassReviewDto;
import com.outflearn.Outflearn.dto.ClassUploadDto;
import com.outflearn.Outflearn.dto.FileUpload;
import com.outflearn.Outflearn.dto.FileValidator;
import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.biz.ClassDataBiz;

@Controller
public class HomeController {

	@Autowired
	public ClassDataBiz biz;
	
	@Autowired
	private FileValidator fileValidator;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/")
	public String home() {

		return "home";
	}

	@RequestMapping(value = "home")
	public String tohome() {

		return "home";
	}

	@RequestMapping("/LectureList")
	public String LectureList(Model model) {

		model.addAttribute("classinfo", biz.ClassInfoSelectList());

		return "LectureList";
	}

	@RequestMapping("/LectureDetail")
	public String LectureDetail(@ModelAttribute ClassInfoDto cDto, int class_num, Model model, HttpSession session, Authentication auth) {

		logger.info("/LectureDetail");
		model.addAttribute("classinfo", biz.ClassInfoSelectOne(class_num));
		model.addAttribute("class_num", class_num);

  

		ClassReviewDto rDto = new ClassReviewDto();
		
		model.addAttribute("classReview", biz.ClassReviewSelectList(class_num));
		System.out.println(biz.ClassReviewSelectList(class_num));

		return "LectureDetail";
	}

	@RequestMapping("DetailDashBoard")
	@ResponseBody
	public String DetailDashBoard(Model model, HttpSession session) {

		int info_num = (int) session.getAttribute("info_num");
		System.out.println("변환하지 않은 거 :" + session.getAttribute("info_num"));
		System.out.println("변환한 것 : " + info_num);

		ClassDataDto dto = biz.ClassDataSelectOne(info_num);
		System.out.println("controller : " + dto.toString());

		return dto.getData_youtube();
	}

	@RequestMapping("Livepage")
	public void Livepage() {

	}

////	강의 쓰기
//	@RequestMapping("ClassInfoInsertForm")
//	public String ClassInfoInsertForm(Authentication auth, Model model) {
//		logger.info("ClassInfoInsertForm");
//	
//		// 회원 정보
//	    UserInfoDto uDto = (UserInfoDto) auth.getPrincipal();
//	    String user_nickname = uDto.getUser_nickname();
//	    int user_num = (Integer) uDto.getUser_num();
//	    model.addAttribute("user_nickname", user_nickname);
//	    model.addAttribute("user_num", user_num);		
//		
//		
//		return "ClassInfoInsertForm";
//	}

//	ClassInfoInsertForm.jsp - > ClassIntroduceInsertForm.jsp  CLASS_DATA DB 저장
	@RequestMapping("ClassIntroduceInsertForm")
	public String ClassIntroduceInsertForm(@ModelAttribute ClassInfoDto dto) {
		logger.info("ClassIntroduceInsertForm");

		int res = biz.ClassInfoInsert(dto);

		if (res > 0) {
			return "ClassIntroduceInsertForm";
		} else {
			return "redirect: ClassIntroduceInsertForm";
		}
	}

//	ClassIntroduceInsertForm.jsp - > DataVideoUploadForm.jsp  CLASS_INTRODUCE DB 저장
	@RequestMapping("DataVideoUploadForm")
	public String DataVideoUploadForm(@ModelAttribute ClassIntroduceDto dto) {
		logger.info("DataVideoUploadForm");

		int res = biz.ClassIntroduceInsert(dto);
	
		if (res > 0) {
			return "DataVideoUploadForm";
		} else {

			return "redirect: ClassInfoInsertForm";
		}
	}

// 	영상소개 작성 확인 DataVideoUploadForm.jsp
	@RequestMapping("DataVideoUpload")
	public String DataVideoUpload(@ModelAttribute ClassDataDto dto) {
		logger.info("DataVideoUpload");
		System.out.println("왔냐?");

		int res = 0;

		String a = dto.getData_youtube();
		String b = "";

		if (a.contains("v=")) {
			b = a.split("v=")[1];
		} else if (a.contains("list=")) {
			b = a.split("list=")[1];
		}

		dto.setData_youtube(b);
		System.out.println(res);

		//	유튜브 영상인지 셀프 영상 업로드 구분 

		res = biz.ClassDataInsert(dto);

		if (res > 0) {
			return "DataVideoUploadFormPlus";
		} else {
			return "redirect: DataVideoUploadForm";
		}

	}

//	직접 영상 업로드 팝업창 파일 받아옴
	@RequestMapping("ClassUpload")
	public String ClassUpload(@ModelAttribute ClassDataDto dto, HttpSession session) {

		int res = biz.ClassDataUpdate(dto);

		return "home";
	}

//	챕터 추가
	@RequestMapping("DataVideoUploadFormPlus")
	public void DataVideoUploadFormPlus() {

	}

//	영상 소개페이지에서 
	@RequestMapping("DataVideoUploadPlus")
	public String DataVideoUploadPlus(@ModelAttribute ClassDataDto dto, HttpSession session, Model model) {

		int res = 0;

		String a = dto.getData_youtube();
		String b = "";
		if (a.contains("v=")) {
			b = a.split("v=")[1];
		} else if (a.contains("list=")) {
			b = a.split("list=")[1];
		}

		dto.setData_youtube(b);

		res = biz.ClassChapterDataInsert(dto);

		model.addAttribute("classdata", biz.ClassDataSelectList());

		if (res > 0) {
			return "redirect: DataVideoUploadFormPlus";
		} else {
			return "redirect: DataVideoUploadForm";
		}

	}

	@RequestMapping("BackDataVideoUploadForm")
	public String BackDataVideoUploadForm(@ModelAttribute ClassDataDto dto, Model model) {

		return "BackDataVideoUploadForm";
	}

	@RequestMapping("LectureDetailView")
	public String LectureDetailView(String DATA_DATA, Model model) {

		model.addAttribute("DATA_DATA", DATA_DATA);

		return "LectureDetailView";
	}

	@RequestMapping("LecturePlayList")
	@ResponseBody
	public String LecturePlayList(Model model, HttpSession session) {

		int info_num = (int) session.getAttribute("info_num");

		ClassDataDto data_dto = biz.ClassDataSelectOne(info_num);
		model.addAttribute("info_dto", biz.ClassInfoSelectOne(info_num));

		return data_dto.getData_youtube();
	}

	@RequestMapping("introOutflearn")
	public void introOutflearn() {

	}
// 강의 추가 - > 썸네일 이미지
	@RequestMapping("ClassImageUpload")
	public void ClassImageUpload() {
		
	}
	
//	파일 업로드
	@RequestMapping("imageUpload")
	   public String imageUpload(HttpServletRequest request, Model model, FileUpload fileUpload, BindingResult result, Authentication auth) {
		  logger.info("imageUpload");
	      
		  System.out.println("왔냐??????????");
		//파일 유효성 검사
			// bingResult : 객체를 Binding하다가 발생하는 error의 정보를 받기 위해 사용 
			fileValidator.validate(fileUpload, result);
			if(result.hasErrors()) {
				return "ClassImageUpload";
			}
		  
		  
	      //uploadForm.jsp에서 넘어온 file을 MultipartFile로 변환
	      MultipartFile file = fileUpload.getFile();
	      System.out.println("안녕 형들");
	      String filename = file.getOriginalFilename();
	      System.out.println(filename + "");
	      
	      
	      //uploadFile.jsp에 넘겨줄 객체정보 담기
	      //fileName 파일명  /  desc 설명
	      FileUpload fileobj = new FileUpload();
	      System.out.println("나 그냥 30대 아저씨야");
	      fileobj.setFilename(filename);
	      
	      
	      InputStream inputStream = null;
	      OutputStream outputStream = null;
	      System.out.println("인생으 뭐다");
	      
	      try {
	         
	         inputStream = file.getInputStream();
	         String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/storage");
	         
	         System.out.println("업로드 될 실제 경로 : " + path);
	         
	         
	         //java 파일생성 코드
	         File storage = new File(path);
	         if(!storage.exists()) {
	            storage.mkdirs();
	         }
	        
	         
	         File newfile = new File(path + "/" + filename);
	         if(!newfile.exists()) {
	            newfile.createNewFile();
	         }
	         
	         outputStream = new FileOutputStream(newfile);
	         
	         int read = 0;
	         byte[] b = new byte[(int)file.getSize()];
	         
	         while((read=inputStream.read(b)) != -1) {
	            outputStream.write(b, 0, read);
	         }
	      } catch (IOException e) {

	         e.printStackTrace();
	      } finally {
	         try {
	            inputStream.close();
	            outputStream.close();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	  	
	      // 회원 정보
		   UserInfoDto uDto = (UserInfoDto) auth.getPrincipal();
		   String user_nickname = uDto.getUser_nickname();
		   int user_num = (Integer) uDto.getUser_num();
		   model.addAttribute("user_nickname", user_nickname);
		   model.addAttribute("user_num", user_num);
	      
	      
	      return "ClassInfoInsertForm";
	   }


}
