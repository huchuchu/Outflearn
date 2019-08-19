package com.outflearn.Outflearn;

import java.util.HashMap;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.outflearn.Outflearn.dto.ClassReviewDto;
import com.outflearn.Outflearn.dto.UserInfoDto;
import com.outflearn.Outflearn.model.biz.ClassDataBiz;

@Controller
public class AnswerController {
	
	@Autowired
	public ClassDataBiz biz;
	

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
//	댓글 입력 페이지 이동
	@RequestMapping("LectureDetailAnswerForm")
	public String LectureDetailAnswerForm(@ModelAttribute ClassReviewDto dto, Model model,int class_num, Authentication auth) {
		logger.info("LectureDetailAnswerForm");

//		// 강의 번호
		model.addAttribute("class_num", dto.getClass_num());
		System.out.println(class_num);

		// 회원 정보 - 닉네임, 유저 번호
		UserInfoDto uDto = (UserInfoDto) auth.getPrincipal();
		String user_nickname = uDto.getUser_nickname();
		int user_num = (Integer) uDto.getUser_num();
		model.addAttribute("user_nickname", user_nickname);
		model.addAttribute("user_num", user_num);

		return "Class/LectureDetailAnswer";
	}
	
//  댓글 입력
	@RequestMapping("LectureDetailAnswer")
	public String LectureDetailAnswer(@ModelAttribute ClassReviewDto dto, int class_num, Model model, Authentication auth) {
		logger.info("LectureDetailAnswer");

		// 회원 정보 - 닉네임, 유저 번호
		UserInfoDto uDto = (UserInfoDto) auth.getPrincipal();
		String user_nickname = uDto.getUser_nickname();
		int user_num = (Integer) uDto.getUser_num();
		model.addAttribute("user_nickname", user_nickname);
		model.addAttribute("user_num", user_num);

		int res = biz.ClassReviewInsert(dto);

		if (res > 0) {
			return "redirect:LectureDetail?class_num=" + class_num;
		} else {
			return "redirect:LectureDetail?class_num=" + class_num;
		}

	}
	
	
	@RequestMapping("LectureDetailAnswerDelete")
	public String answerDelete(int board_no, int class_num) {
		logger.info("LectureDetailAnswerDelete");
		
		int res =  biz.ClassReviewDelete(board_no);
		System.out.println(board_no + "염따");
		System.out.println(res);
		
		if (res > 0) {
			return "redirect:LectureDetail?class_num=" + class_num;
		} else {
			return "redirect:LectureDetail?class_num=" + class_num;
		}
	}
	
	@RequestMapping("AnswerUpdate")
	@ResponseBody
	public Map<String,Object> AnswerUpdate(@ModelAttribute ClassReviewDto dto, int review_num, String review_content) {
		System.out.println("게시판번호"+review_num);
		System.out.println("댓글내용"+review_content);
		
		Boolean updatechk = false;
		Map<String,Object> map = new HashMap<String, Object>();
		
	
		dto.setReview_num(review_num);
		dto.setReview_content(review_content);
		
		int res = biz.ClassReviewUpdate(dto);
		System.out.println(res);
		
		if (res > 0) {
			updatechk=true;
			map.put("content", review_content);
			map.put("updatechk", updatechk);
		}else {
			map.put("updatechk", updatechk);
		}
		System.out.println(updatechk);
		return map;
	}

//	대댓글 폼
	@RequestMapping("ReplyForm")
	public String replyForm(@ModelAttribute ClassReviewDto dto , Model model, int class_num, int board_no, Authentication auth) {
		logger.info("ReplyForm");
		
		model.addAttribute("class_num", dto.getClass_num());
		model.addAttribute("user_star", dto.getUser_star());
		System.out.println("왔냐" + class_num);
		
		// 회원 정보 - 닉네임, 유저 번호
		UserInfoDto uDto = (UserInfoDto) auth.getPrincipal();
		String user_nickname = uDto.getUser_nickname();
		int user_num = (Integer) uDto.getUser_num();
		model.addAttribute("user_nickname", user_nickname);
		model.addAttribute("user_num", user_num);		
		

		model.addAttribute("board_no", board_no);
		System.out.println(board_no + "FLEX");
		model.addAttribute("classReview",biz.ClassReviewSelectOne(board_no));
		
		return "Class/LectureDetailAnswerReply";
	}
	
//	대댓글
	@RequestMapping("Reply")
	public String Reply(@ModelAttribute ClassReviewDto dto , Model model, int class_num , int parentboard_no, Authentication auth) {
		logger.info("Reply");
		
		model.addAttribute("class_num", dto.getClass_num());
		System.out.println("왔냐 " + class_num);
		System.out.println("빡크 " + dto.getReview_num());
		
		// 회원 정보 - 닉네임, 유저 번호
		UserInfoDto uDto = (UserInfoDto) auth.getPrincipal();
		String user_nickname = uDto.getUser_nickname();
		int user_num = (Integer) uDto.getUser_num();
		model.addAttribute("user_nickname", user_nickname);
		model.addAttribute("user_num", user_num);		
		
		model.addAttribute("parentBoard_no",biz.ClassReviewSelectOne(parentboard_no));
		int res = biz.ClassReviewAnswer(dto, parentboard_no);
		
		if (res > 0) {
			return "redirect:LectureDetail?board_no=" + parentboard_no;
		} else {
			return "redirect:LectureDetail?board_no=" + parentboard_no;
		}
	
	}
	
}
