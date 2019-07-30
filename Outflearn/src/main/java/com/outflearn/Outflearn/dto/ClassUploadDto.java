package com.outflearn.Outflearn.dto;

import java.sql.Clob;

public class ClassUploadDto {
	
	private int class_num;
	private Clob upload_text;
	private Clob upload_data;
	
	public ClassUploadDto() {
		
	}
	
	public ClassUploadDto(int class_num, Clob upload_text, Clob upload_data) {
		super();
		this.class_num = class_num;
		this.upload_text = upload_text;
		this.upload_data = upload_data;
	}

	public int getClass_num() {
		return class_num;
	}

	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}

	public Clob getUpload_text() {
		return upload_text;
	}

	public void setUpload_text(Clob upload_text) {
		this.upload_text = upload_text;
	}

	public Clob getUpload_data() {
		return upload_data;
	}

	public void setUpload_data(Clob upload_data) {
		this.upload_data = upload_data;
	}
	
	

}

