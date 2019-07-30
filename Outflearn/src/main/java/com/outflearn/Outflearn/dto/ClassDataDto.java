package com.outflearn.Outflearn.dto;

import java.sql.Clob;

public class ClassDataDto {

//   강좌데이터
	private int class_num;
	private String data_subhead;
	private int data_sq;
	private String data_title;
	private String data_data;
	
	public ClassDataDto() {

	}

	public ClassDataDto(int class_num, String data_subhead, int data_sq, String data_title, String data_data) {
		this.class_num = class_num;
		this.data_subhead = data_subhead;
		this.data_sq = data_sq;
		this.data_title = data_title;
		this.data_data = data_data;
	}

	public int getClass_num() {
		return class_num;
	}

	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}

	public String getData_subhead() {
		return data_subhead;
	}

	public void setData_subhead(String data_subhead) {
		this.data_subhead = data_subhead;
	}

	public int getData_sq() {
		return data_sq;
	}

	public void setData_sq(int data_sq) {
		this.data_sq = data_sq;
	}

	public String getData_title() {
		return data_title;
	}

	public void setData_title(String data_title) {
		this.data_title = data_title;
	}

	public String getData_data() {
		return data_data;
	}

	public void setData_data(String data_data) {
		this.data_data = data_data;
	}

}