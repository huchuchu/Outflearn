package com.outflearn.Outflearn.dto;


public class ClassUploadDto {
	
	private int class_num;
	private String upload_data;
	
	public ClassUploadDto() {
		
	}
	
	public ClassUploadDto(int class_num,  String upload_data) {
		super();
		this.class_num = class_num;
		this.upload_data = upload_data;
	}

	public int getClass_num() {
		return class_num;
	}

	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}


	public String getUpload_data() {
		return upload_data;
	}

	public void setUpload_data(String upload_data) {
		this.upload_data = upload_data;
	}
	
	

}

