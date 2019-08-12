package com.outflearn.Outflearn.dto;

public class ClassReviewDto {
	
	private int class_num;
	private int board_no;
	private int qa_groupno;
	private int qa_groupsq;
	private int qa_titletab;
	private int user_num;
	private String review_content;
	private int user_star;
	private String user_nickname;
	
	public ClassReviewDto() {

	}

	public ClassReviewDto(int class_num, int board_no, int qa_groupno, int qa_groupsq, int qa_titletab,
			int user_num, String review_content, int user_star, String user_nickname) {
		this.class_num = class_num;
		this.board_no = board_no;
		this.qa_groupno = qa_groupno;
		this.qa_groupsq = qa_groupsq;
		this.qa_titletab = qa_titletab;
		this.user_num = user_num;
		this.review_content = review_content;
		this.user_star = user_star;
		this.user_nickname = user_nickname;
	}

	public int getClass_num() {
		return class_num;
	}

	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getQa_groupno() {
		return qa_groupno;
	}

	public void setQa_groupno(int qa_groupno) {
		this.qa_groupno = qa_groupno;
	}

	public int getQa_groupsq() {
		return qa_groupsq;
	}

	public void setQa_groupsq(int qa_groupsq) {
		this.qa_groupsq = qa_groupsq;
	}

	public int getQa_titletab() {
		return qa_titletab;
	}

	public void setQa_titletab(int qa_titletab) {
		this.qa_titletab = qa_titletab;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
	public int getUser_star() {
		return user_star;
	}

	public void setUser_star(int user_star) {
		this.user_star = user_star;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	
	
}